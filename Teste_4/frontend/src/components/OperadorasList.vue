<template>
    <div>
      <h1>Buscar Operadoras de Saúde</h1>
  
      <select v-model="tipoBusca">
        <option value="cnpj">CNPJ</option>
        <option value="nome">Nome Fantasia</option>
        <option value="endereco">Endereço</option>
      </select>
  
      <input v-model="termo" :placeholder="placeholderTexto" />
      <button @click="buscarOperadora">Buscar</button>
  
      <ul v-if="operadoras.length">
        <li v-for="operadora in operadoras" :key="operadora.Registro_ANS">
          <strong>{{ operadora.Nome_Fantasia || operadora.Razao_Social }}</strong>
          <p>Cidade: {{ operadora.Cidade }}</p>
          <p>UF: {{ operadora.UF }}</p>
          <p>Telefone: {{ operadora.Telefone }}</p>
        </li>
      </ul>
  
      <p v-else>Nenhuma operadora encontrada.</p>
    </div>
  </template>
  
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        termo: '',
        operadoras: []
      };
    },
    methods: {
      async buscarOperadora() {
        try {
          const response = await axios.get(`http://127.0.0.1:5000/buscar?termo=${this.termo}`);
          this.operadoras = response.data;
        } catch (error) {
          console.error('Erro ao buscar operadora:', error);
        }
      }
    }
  };
  </script>
  
  <style scoped>
  input, button {
    margin: 5px;
    padding: 8px;
  }
  </style>
  