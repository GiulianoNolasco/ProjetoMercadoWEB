<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.BancoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mercado - Clientes</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-white"href="index.jsp">
        <img src="Imagens/logoNav.jpg" width=200 height=80>
     
        <a class="navbar-brand" href="index.jsp">Página inicial</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
       
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="CadastroCliente.jsp">Clientes</a>
            </li>
          </ul>
        </div>
        
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="CadastroFuncionario.jsp">Funcionários</a>
            </li>
          </ul>
        </div>
        
          <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="CadastroProduto.jsp">Produtos</a>
            </li>
          </ul>
        </div>
        
          <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="CadastroVenda.jsp">Vendas</a>
            </li>
          </ul>
        </div>
       
      </nav>
      
<p>  <p>


<body class="bg-dark text-light">

    <div class="container">

      <div class="jumbotron bg-light">
        
        <h1 style="color:black;">CLIENTES</h1>
      </div>

<main>
  
  <section>
    <a href="FormularioCliente.jsp?id_cliente=-1">
      <button class="btn btn-success">Novo Cliente</button>
    </a>
 
  </section>
  <section>

    <table class="table bg-light mt-3">
  
        <thead>
          <tr>
            <th style="text-align: center;">ID</th>
            <th style="text-align: center;">Nome Cliente</th>
            <th style="text-align: center;">Idade</th>
            <th style="text-align: center;">Situação</th>
            
            <th style="text-align: center;">Ações</th>
          </tr>
        </thead>
        <tbody>
        
		<%
        BancoDAO db = new BancoDAO();
        String id = "";
        String nome = "";
        String idade = "";
        String situacao = "";
        String situacao_desc = "";
    
        	ResultSet retorno = db.retornaDados("select * from clientes");
     		while (retorno.next()){
        	id = retorno.getString("id_cliente");
        	nome = retorno.getString("nome_cliente");
        	idade = retorno.getString("idade_cliente");
        	situacao = retorno.getString("situacao_cliente").toUpperCase();
        		if(situacao.equals("A")){
        			situacao_desc = "Ativo";
        		}else{
        			situacao_desc = "Inativo";
        	}
        
			%>
           
            <tr>
                      <td style="text-align: center;"><%out.write(id);%></td>
                      <td style="text-align: center;"><%out.write(nome);%></td>
                      <td style="text-align: center;"><%out.write(idade);%></td>
                      <td style="text-align: center;"><%out.write(situacao_desc);%></td>
                      
                      <td style="text-align: center;">
                        <a href="FormularioCliente.jsp?id_cliente=<%out.write(id);%>">
                          <button type="button" class="btn btn-primary">Editar</button>
                        </a>
                        <a href="ExcluirCliente.jsp?id_cliente=<%out.write(id);%>">
                          <button type="button" class="btn btn-danger">Excluir</button>
                        </a>
                      </td>
                    </tr>    <%}%>  </tbody>
    </table>

  </section>


</main>
    <!-- .container -->
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  
</body>
</body>
</html>