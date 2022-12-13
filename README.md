# [bore-server] Bore server with https and subdomain

## Environment Variables

```shell
BORE_HOST=bore.example.com # Host to expose using `nginx-proxy`.
BORE_SECRET=123456 # Secret to `bore-server`.
BORE_MIN_PORT=7000 # Minimal port to `bore-server`.
NGINX_PORT=80 # Port to expose nginx.
```

## How to use?

After setting the environment variables inside `.env` run the following command.

```shell
docker-compose up --build -d
```
