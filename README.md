# iptables redirector

iptables redirector is a simple Docker image that redirects traffic via DNAT to
a different address/port. Redirection can be configured via the following
environment variables:

* `TARGET_IP` - the IP to redirect traffic to (default: `127.0.0.1`)
* `TARGET_PORT` - the port to redirect traffic to (default: `8080`)
* `DESTINATIONS` - the destination hostnames or IPs to redirect, comma separated (default: all)

## Examples

#### Forward all outbound traffic to `127.0.0.1:8080`:
```
docker run --cap-add=NET_ADMIN iptables-redirector
```

#### Forward all outbound traffic to `10.0.0.1:3128`:
```
docker run --cap-add=NET_ADMIN \
  -e TARGET_IP=10.0.0.1 -e TARGET_PORT=3128 \
  iptables-redirector
```

#### Forward traffic destined to `bbc.co.uk` to `127.0.0.1:8080`:
```
docker run --cap-add=NET_ADMIN \
  -e DESTINATIONS=bbc.co.uk \
  iptables-redirector
```

#### Forward traffic destined to `bbc.co.uk` & `google.com` to `127.0.0.1:8080`:
```
docker run --cap-add=NET_ADMIN \
  -e DESTINATIONS=bbc.co.uk,google.com \
  iptables-redirector
```
