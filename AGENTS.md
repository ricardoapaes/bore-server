# 🤖 Diretrizes e Padrões para Agentes (AGENTS.md)

Este arquivo descreve regras estritas de infraestrutura, padronização e arquitetura deste repositório para serem seguidas por agentes automatizados ou durante contribuições e code reviews.

## 🇧🇷 Regras de Idioma Restrita
**All communication, code reviews, PR titles/descriptions, and commit messages must be strictly in Brazilian Portuguese (pt-BR).**

## 🏗️ Mapeamento de Arquitetura e Diretórios
Abaixo está a organização e as responsabilidades de cada diretório base do projeto:

- `bore/`: Contém o código-fonte em Rust para a infraestrutura do servidor do Bore. Aqui são construídos os binários do aplicativo para gerenciar os túneis TCP. Além disso, esse diretório contém os testes unitários da aplicação principal.
- `nginx/`: Contém as configurações, Shell Scripts e o `Dockerfile` voltados para o Nginx. Este diretório é responsável pela camada do proxy reverso, controlando roteamentos, subdomínios, redirecionamentos e configurações atreladas aos túneis SSL que suportam as requisições que chegam.
- `docker-compose.yaml` (e `docker-compose.podman.yaml`): Arquivos de orquestração Docker que vinculam a porta do contêiner `bore-server` e o contêiner proxy `nginx`.
- Raiz do projeto: Contém os arquivos de documentação geral e controle (como `.gitignore`, `README.md`, e este `AGENTS.md`).

## 📋 Padrão de Commits e Pull Requests
Para organizar o histórico de versão e garantir conformidade no processo de CI/CD, todos os Commits e Títulos de Pull Requests **devem** seguir estritamente este formato:

`[Emoji] [ID-da-Tarefa-Jira] Mensagem clara do que foi feito`

*Exemplos:*
- `🐛 [EIC-123] Corrige erro de validação no formulário`
- `✨ [EIC-124] Adiciona nova rota de exportação`

### Tabela de Referência de Emojis
Utilize os seguintes emojis de acordo com a finalidade do seu commit/PR:

| Emoji | Significado |
| :---: | :--- |
| ✨ | Nova feature ou implementação |
| 🐛 | Correção de bug |
| ♻️ | Refatoração de código sem mudar comportamentos base |
| 📝 | Adição ou alteração em documentação (ex: README, AGENTS) |
| 🔧 | Mudanças em configurações (ex: Docker, Docker Compose, CI/CD) |
| 🚀 | Melhorias de performance ou deploy |
| 🧪 | Criação ou alteração de testes unitários ou de integração |

Certifique-se sempre de validar essas regras antes de consolidar qualquer trabalho no repositório base.
