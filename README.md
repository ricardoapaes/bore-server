# 🚇 Bore Server
Um projeto que configura e expõe um servidor [Bore](https://github.com/ekzhang/bore) utilizando HTTPS e subdomínios, orquestrado através de contêineres Docker e um proxy reverso (Nginx).
O Bore é um projeto moderno e rápido para criar túneis TCP de forma simples, similar ao ngrok.

## 🚀 O que é o projeto
Este repositório facilita a implantaação ("deployment") do `bore-server` fornecendo uma estrutura pronta para rodar em produção. Ele integra o servidor do Bore com um proxy reverso Nginx para oferecer endpoints seguros (HTTPS) baseados em subdomínios dinâmicos.

## 🛠️ Tecnologias utilizadas
- **Rust**: Linguagem base do servidor Bore.
- **Docker & Docker Compose**: Empacotamento e orquestração dos serviços (Nginx e servidor Bore).
- **Nginx**: Servidor web atuando como proxy reverso.
- **Shell Script**: Automações auxiliares de configuração no ambiente.

## ✅ Pré-requisitos
Antes de executar o projeto, você precisa ter instalados:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/) ou suporte ao compose através do Podman.
- Instalação e configuração ativa do [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) e do [acme-companion](https://github.com/nginx-proxy/acme-companion) para gerenciamento automático de SSL.

## ⚙️ Como rodar o projeto localmente (Docker)

1. Crie uma cópia do arquivo de exemplo `.env.example` para `.env` e ajuste as configurações:
```shell
cp .env.example .env
```

2. Configurações de Variáveis de Ambiente no `.env`:
```shell
BORE_HOST=bore.example.com     # Domínio que será exposto no nginx-proxy
BORE_SECRET=123456             # Chave secreta de autenticação no bore-server
BORE_MIN_PORT=7000             # Porta mínima para alocação no bore-server
NGINX_PORT=80                  # Porta de comunicação interna do nginx
BORE_SERVER_HOST=bore-server   # (Opcional) Nome do host do bore-server na rede Docker
```

3. Suba os contêineres com o Docker Compose:
```shell
docker-compose up --build -d
```
Isso fará o build do servidor Bore (a partir da pasta `bore/`) e da imagem Nginx customizada (a partir da pasta `nginx/`).

## 🌐 Como acessar externamente
Uma vez que os serviços estejam rodando e o `nginx-proxy` tenha gerado o SSL, você pode acessar os túneis pelo domínio configurado no `BORE_HOST` e sua respectiva porta como um *caminho (subpasta)* da URL.

Por exemplo, se o seu `BORE_HOST` é `bore.example.com` e a porta que o Bore designou foi a `7000`, a URL externa será:
`https://bore.example.com/7000`

## 🧪 Como executar os testes
O núcleo da aplicação (Bore) é escrito em Rust. Para testá-lo localmente (caso deseje contribuir ou modificar o comportamento do servidor), você precisará do `cargo` instalado.

1. Entre no diretório do bore:
```shell
cd bore
```

2. Execute os testes automatizados do cargo:
```shell
cargo test
```
