# Jogos de Velho

Plataforma web de jogos clássicos e passatempos online, desenvolvida para proporcionar entretenimento nostálgico e acessível, especialmente para idosos que buscam diversão interativa sem necessidade de instalação.

##  Tecnologias

- **Node.js** — ambiente de execução
- **Express.js** — framework HTTP
- **MySQL** — banco de dados relacional

## Estrutura do projeto
```bash
database/
public/
src/
├── server.js
├── routes/
├── controllers/
├── services/
└── models/
app.js
server.js
```

## Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Node.js](https://nodejs.org/) v18+
- [MySQL](https://www.mysql.com/) v8+
- [Git](https://git-scm.com/)

## Instalação

**1. Clone o repositório**
```bash
git clone https://github.com/Raiana-ap/Jogos-de-Velho.git
cd Jogos-de-Velho
```

**2. Instale as dependências**
```bash
npm install
```

**3. Configure as variáveis de ambiente**
```bash
cp .env.example .env
```
Abra o arquivo `.env` e preencha com as suas credenciais:
```
PORT=3000
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=suasenha
DB_NAME=Jogos_de_Velho
```

**4. Crie o banco de dados**
Execute o script DDL no seu MySQL:
```bash
mysql -u root -p < database/jogos_de_velho.sql
```

**5. Inicie o servidor**
```bash
npm start
```

O servidor estará disponível em `http://localhost:3000`.

## Funcionalidades
- Cadastro e login de usuários
- Visualização e atualização de perfil
- Listagem e acesso aos jogos disponíveis
- Partidas multiplayer online
- Avaliações e comentários por jogo
- Painel administrativo para gerenciar jogos

## Autores
Raiana Arbusti Paludo e Pedro Henrique Moreira

Desenvolvido como projeto acadêmico.
