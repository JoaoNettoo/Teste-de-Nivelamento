from flask import Flask, request, jsonify
from operadoras import buscar_operadoras

app = Flask(__name__)

@app.route('/buscar', methods=['GET'])
def buscar():
    termo = request.args.get('termo', '')
    resultados = buscar_operadoras(termo)
    return jsonify(resultados)

if __name__ == '__main__':
    app.run(debug=True)
