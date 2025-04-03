from flask import Flask, request, jsonify
from operadoras import buscar_operadoras
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Habilita CORS para evitar bloqueios no navegador

@app.route('/buscar', methods=['GET'])
def buscar():
    termo = request.args.get('termo', '')
    resultados = buscar_operadoras(termo)
    return jsonify(resultados)

if __name__ == '__main__':
    app.run(debug=True)
