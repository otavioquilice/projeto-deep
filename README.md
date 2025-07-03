## 🚀 Sobre o projeto

Este é um projeto Laravel executado via Docker, desenvolvido exclusivamente para fins de avaliação prática.

---

## 📦 Requisitos

- Docker
- Docker Compose

---

## ▶️ Como executar

1. Clone o repositório e navegue até a pasta do projeto

2. Execute um dos comandos abaixo para iniciar os containers:

```bash
docker compose up
```
Ou para rodar em segundo plano (modo detached):

```bash
docker compose up -d
```

3. Após o start dos container, acessar: http://127.0.0.1:8000/


## ⚙️ Configurações do ambiente
O serviço MySQL está exposto na porta 3307 da máquina HOST caso queira se conectar através de uma ferramenta (GUI) para modelagem, desenvolvimento e administração de bancos de dados MySQL

O arquivo .env está commitado intencionalmente, exclusivamente para facilitar o uso desse teste prático

## O que foi feito
1. Backend: Laravel 10 + PHP 8.2
2. Migrations
3. Testes Unitários
4. Frontend: Blade + Bootstrap + Javascript
5. Banco de Dados: MySQL
6. Autenticação: Laravel Breeze
7. Validação: Laravel Request Validation.
8. JavaScript: Modal sweetalert
9. Upload de imagem de perfil com armazenamento local e exibição no dashboard e edição do perfil.
10. Docker para containers Laravel e SGBD MySql
11. Login + Logout + Registro de usuário
