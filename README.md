# 🚀 Gerenciador de Eventos e Palestrantes

<p align="center">
  <strong>API REST para gerenciamento de eventos e palestrantes</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Node.js-20+-339933?style=for-the-badge&logo=node.js&logoColor=white">
  <img src="https://img.shields.io/badge/TypeScript-5+-3178C6?style=for-the-badge&logo=typescript&logoColor=white">
  <img src="https://img.shields.io/badge/Express-5-000000?style=for-the-badge&logo=express&logoColor=white">
  <img src="https://img.shields.io/badge/Prisma-ORM-2D3748?style=for-the-badge&logo=prisma&logoColor=white">
  <img src="https://img.shields.io/badge/PostgreSQL-Database-4169E1?style=for-the-badge&logo=postgresql&logoColor=white">
</p>

---

## 📌 Sobre o projeto

O **Gerenciador de Eventos e Palestrantes** é uma aplicação desenvolvida para cadastrar, consultar, atualizar e excluir eventos e palestrantes.

A aplicação também permite relacionar palestrantes aos eventos, possibilitando que:

- 🎤 Um palestrante participe de vários eventos
- 📅 Um evento possua vários palestrantes
- 🔗 Palestrantes sejam adicionados a eventos
- ❌ Palestrantes sejam removidos de eventos
- 🔎 Eventos sejam consultados com seus palestrantes
- 📋 Palestrantes sejam consultados individualmente

O projeto foi desenvolvido utilizando uma arquitetura organizada em **rotas, controllers e camada de acesso ao banco**, utilizando o **Prisma ORM** para comunicação com o PostgreSQL.

---

# 🎯 Objetivo

O projeto foi desenvolvido como parte de uma atividade prática de desenvolvimento de sistemas, com o objetivo de aplicar conceitos de:

- APIs REST
- Node.js
- Express
- TypeScript
- Banco de dados relacional
- PostgreSQL
- Prisma ORM
- Relacionamentos entre entidades
- CRUD
- Arquitetura de software
- Organização de projetos backend

---

# 🧠 Tecnologias utilizadas

| Tecnologia | Utilização |
|---|---|
| 🟢 Node.js | Ambiente de execução |
| 🟦 TypeScript | Linguagem principal |
| ⚡ Express | Framework para API |
| 🔷 Prisma | ORM |
| 🐘 PostgreSQL | Banco de dados |
| 🌐 REST API | Comunicação entre cliente e servidor |
| 📦 npm | Gerenciamento de dependências |

---

# 🏗️ Arquitetura

O projeto utiliza uma organização baseada em responsabilidades:

```text
Cliente
   │
   ▼
┌─────────────────────┐
│      Routes         │
│   Rotas da API      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│    Controllers      │
│ Regras das ações    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│       Prisma        │
│      ORM / DB       │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│     PostgreSQL      │
│      Database       │
└─────────────────────┘