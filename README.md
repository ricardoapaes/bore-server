# [bore-server] Bore server with https and subdomain

Create http point and expose `bore-server` using a domain and https.

Thanks for this great http tunnel implementation.
https://github.com/ekzhang/bore

## Environment Variables

```shell
BORE_HOST=bore.example.com # Host to expose using `nginx-proxy`.
BORE_SECRET=123456 # Secret to `bore-server`.
BORE_MIN_PORT=7000 # Minimal port to `bore-server`.
NGINX_PORT=80 # Port to expose nginx.
BORE_SERVER_HOST=bore-server # Optional: Use to change `bore-server` host.
```

## How to start?

Once started and configured https://github.com/nginx-proxy/nginx-proxy and https://github.com/nginx-proxy/acme-companion.
and setting the environment variables inside `.env` run the following command.

```shell
docker-compose up --build -d
```

## How to access externally?

To access use the domain defined in `BORE_HOST` using the port as a subfolder, like:

Based on the `BORE_HOST` as "bore.example.com" and the port as 7000 the url would look like this: "https://bore.example.com/7000"
