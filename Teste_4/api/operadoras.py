import pandas as pd
# Carregar os dados do CSV
df = pd.read_csv("../data/Relatorio_cadop.csv", sep=";", dtype=str)

def buscar_operadoras(termo):
    termo = termo.strip().lower()  # Remove espaços e quebras de linha extras
    # Filtrar por CNPJ, Nome Fantasia ou Razão Social
    filtro = df[
        df["CNPJ"].str.lower().str.contains(termo, na=False) |
        df["Nome_Fantasia"].str.lower().str.contains(termo, na=False) |
        df["Razao_Social"].str.lower().str.contains(termo, na=False)
    ]
    # Colunas que devem ser retornadas
    resultados = filtro[[
        "Nome_Fantasia", "Razao_Social", "Registro_ANS", 
        "Cidade", "UF", "Telefone", "Endereco_eletronico"
    ]].to_dict(orient="records")
    
    return resultados
