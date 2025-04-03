<template>
  <div>
    <h1>Buscar Operadoras de Saúde</h1>

    <!-- Seleção do tipo de busca -->
    <select v-model="tipoBusca">
      <option value="cnpj">CNPJ</option>
      <option value="nome_fantasia">Nome Fantasia</option>
      <option value="razao_social">Razão Social</option>
    </select>

    <!-- Campo de pesquisa -->
    <input v-model="termo" :placeholder="placeholderTexto" />
    <button @click="buscarOperadora">Buscar</button>

    <!-- Lista de operadoras -->
    <ul v-if="operadoras.length">
      <li v-for="operadora in operadoras" :key="operadora.Registro_ANS">
        <strong>{{ operadora.Nome_Fantasia || operadora.Razao_Social }}</strong>
        <p>CNPJ: {{ operadora.CNPJ }}</p>
        <p>Nome_Fantasia: {{ operadora.Nome_Fantasia }}</p>
        <p>Registro_ANS: {{ operadora.Registro_ANS }}</p>
        <p>Logradouro: {{ operadora.Logradouro }}</p>
        <p>Numero: {{ operadora.Numero }}</p>
        <p>Complemento: {{ operadora.Complemento }}</p>
        <p>Bairro: {{ operadora.Bairro }}</p>
        <p>Cidade: {{ operadora.Cidade }}</p>
        <p>UF: {{ operadora.UF }}</p>
        <p>CEP: {{ operadora.CEP }}</p>
        <p>Telefone: {{ operadora.Telefone }}</p>
        <p>Endereco_eletronico: {{ operadora.Endereco_eletronico }}</p>
      </li>
    </ul>

    <p v-else>Nenhuma operadora encontrada.</p>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      termo: "",
      tipoBusca: "cnpj", // Padrão como CNPJ
      operadoras: []
    };
  },
  computed: {
    placeholderTexto() {
      // Altera o placeholder conforme o tipo de busca
      return this.tipoBusca === "cnpj"
        ? "Digite o CNPJ"
        : this.tipoBusca === "nome_fantasia"
        ? "Digite o Nome Fantasia"
        : "Digite a Razão Social";
    }
  },
  methods: {
    async buscarOperadora() {
      if (!this.termo.trim()) {
        alert("Digite um termo de busca.");
        return;
      }

      try {
        const response = await axios.get(`http://localhost:5000/buscar`, {
          params: { termo: this.termo, tipo: this.tipoBusca }
        });

        this.operadoras = response.data;
      } catch (error) {
        console.error("Erro ao buscar operadora:", error);
      }
    }
  }
};
</script>

<style scoped>
input,
button,
select {
  margin: 5px;
  padding: 8px;
}
</style>
