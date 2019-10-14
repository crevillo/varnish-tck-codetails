#
# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide for a comprehensive documentation
# at https://www.varnish-cache.org/docs/.

# Marker to tell the VCL compiler that this VCL has been written with the
# 4.0 or 4.1 syntax.
vcl 4.1;
import std;

# Default backend definition. Set this to point to your content server.
backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if (req.http.uri) {
        ban("obj.http.uri ~ " + req.http.uri);
        return (synth(200, "Banned"));
    }

    return (hash);
}

sub vcl_backend_response {
     if (bereq.url ~ "/assets") {
            unset beresp.http.set-cookie;
            set beresp.http.cache-control = "public, max-age=259200";
            set beresp.ttl = 3d;
            return (deliver);
     }
}

sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.
}
