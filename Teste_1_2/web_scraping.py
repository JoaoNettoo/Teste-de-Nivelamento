import requests
from bs4 import BeautifulSoup
import zipfile
import tabula
import pandas as pd

# 1. Teste de Web Scraping
# URL do site
url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

# Fazendo a requisição ao site
response = requests.get(url)

# Verificando se o acesso foi bem-sucedido
if response.status_code == 200:
    soup = BeautifulSoup(response.text, "html.parser")

    # Encontrar todos os links na página
    links = soup.find_all("a", href=True)

    # Filtrar os links que contêm "Anexo I" ou "Anexo II" que terminam com '.pdf'
    pdf_links = [link["href"] for link in links if ("Anexo I" in link.text or "Anexo II" in link.text) and link["href"].endswith(".pdf")]

    # Lista para armazenar os nomes dos arquivos baixados
    downloaded_files = []

    # Baixar os PDFs
    for idx, link in enumerate(pdf_links, 1):
        # Baixar o arquivo
        response = requests.get(link)
        
        if response.status_code == 200:
            # Salvar o PDF no diretório atual
            filename = f"anexo_{idx}.pdf"
            with open(filename, "wb") as file:
                file.write(response.content)
            downloaded_files.append(filename)
            print(f"{filename} baixado com sucesso!")
        else:
            print(f"Erro ao baixar o arquivo: {link}")

    # Compactar os arquivos PDF em um único arquivo ZIP
    with zipfile.ZipFile("anexos.zip", "w") as zipf:
        for file in downloaded_files:
            zipf.write(file)
            print(f"{file} adicionado ao arquivo ZIP.")

else:
    print("Erro ao acessar o site:", response.status_code)

# 2 Teste de transformação de dados 
# Extração da tabela do PDF
pdf_path = "anexo_1.pdf"  # Caminho do arquivo PDF baixado

# Usando o tabula-py para extrair a tabela do PDF
# Isso vai gerar uma lista de DataFrames
tables = tabula.read_pdf(pdf_path, pages='all', multiple_tables=True)

# Salva os dados em uma tabela estruturada (CSV)
# Junta todas em uma única tabela
df = pd.concat(tables, ignore_index=True)

# Substitui abreviações (OD e AMB) pelas descrições completas
abreviations_map = {
    "OD": "Seg. Odontológica",
    "AMB": "Seg. Ambulatorial"
}

# Substitui as abreviações nas colunas do DataFrame
df.replace(abreviations_map, inplace=True)

# Nome do arquivo CSV final
csv_filename = "rol_de_procedimentos_atualizado.csv"

# Salva o CSV com as abreviações substituídas
df.to_csv(csv_filename, index=False)
print(f"Arquivo CSV '{csv_filename}' gerado com sucesso com as abreviações substituídas!")

# Compacta o CSV em um arquivo ZIP
with zipfile.ZipFile(f"Teste_Joao_Neto.zip", "w") as zipf:
    zipf.write(csv_filename)
    print(f"Arquivo CSV compactado em 'Teste_Joao_Neto.zip'.")
