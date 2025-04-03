# 📌 Testes de Nivelamento 

## 📖 Sobre o Projeto
Este repositório contém a implementação dos testes de nivelamento, abordando scraping de dados, transformação de dados, manipulação de banco de dados e desenvolvimento de uma API.

---

## 🛠️ Tecnologias Utilizadas
- **Python** 🐍
- **Vue.js** 🖥️
- **MySQL** 🗄️
- **Postman** 📬

---

## 📝 Testes Implementados

### 1️⃣ **Teste de Web Scraping**
🔹 Realizado em Python.

✅ Acesso ao site da ANS:
   - [https://www.gov.br/ans](https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos)
✅ Download dos Anexos I e II (PDFs).
✅ Compactação dos arquivos em um único `.zip`.

---

### 2️⃣ **Teste de Transformação de Dados**
🔹 Realizado em Python.

✅ Extração da tabela **Rol de Procedimentos e Eventos em Saúde** (Anexo I do teste anterior).
✅ Salvamento dos dados em formato **CSV**.
✅ Compactação do CSV em `Teste_Joao_Neto.zip`.
✅ Substituição de abreviações nas colunas OD e AMB conforme legenda do rodapé.

---

### 3️⃣ **Teste de Banco de Dados**
🔹 Scripts SQL para MySQL.

✅ Download dos arquivos:
   - [Demonstrativos Contábeis](https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/)
   - [Dados Cadastrais das Operadoras](https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/)
✅ Criação de tabelas no banco de dados.
✅ Importação dos arquivos CSV.
✅ Queries analíticas:
   - **Top 10 operadoras com maiores despesas** em "Eventos/Sinistros Conhecidos ou Avisados de Assistência à Saúde Médico Hospitalar" no **último trimestre**.
   - **Top 10 operadoras com maiores despesas** nessa categoria no **último ano**.

---

### 4️⃣ **Teste de API**
🔹 Backend: Flask (Python) 🐍
🔹 Frontend: Vue.js 🎨

✅ Criação de um servidor com **Flask**.

✅ Endpoint que realiza busca textual nos cadastros de operadoras.

✅ Exibição dos dados em uma interface Vue.js.

✅ Testes realizados via **Postman**.

---

## 🚀 Como Rodar o Projeto

### 🔧 Pré-requisitos
- Python 3.x
- Node.js
- MySQL Workebench
- Postman

### 📌 Clone o repositório
```sh
 git clone https://github.com/JoaoNettoo/Teste-de-Nivelamento
 cd Teste-de-Nivelamento
```

### 🖥️ Rodando o Backend
```sh
 cd Teste_4/api
 pip install -r requirements.txt
 python app.py
```

### 🎨 Rodando o Frontend
```sh
 cd Teste_4/frontend
 npm install
 npm run dev
```

### ✅ Testando a API no Postman
- Importe a coleção **`Teste_4/postman`** no Postman e execute as requisições.

---

## 📌 Conclusão
Todos os testes foram implementados e organizados de acordo com os requisitos. 💡


