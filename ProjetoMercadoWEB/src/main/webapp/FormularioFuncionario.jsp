<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.BancoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mercado - Funcionários</title>

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


<%
BancoDAO db = new BancoDAO();
int id = Integer.parseInt(request.getParameter("id_funcionario"));
String nome_funcionario = "";
String idade = "";
String situacao = "";
String titulo = "Cadastrando um novo Funcionário";
boolean ativo = true;

if (id>0){
	ResultSet retorno = db.retornaDados("select * from funcionarios where id_funcionario	 = " + id);
	if (retorno.next()){
		titulo = "Alterando Funcionário " + id;
	nome_funcionario = retorno.getString("nome_funcionario");
	idade = retorno.getString("idade");
	situacao = retorno.getString("situacao");
	if(situacao.equals("A")){
		ativo = true;
	}else{
		ativo = false;
	}
	}
	}


%>

<body class="bg-dark text-light">

    <div class="container">

      <div class="jumbotron bg-light">
        
        <h1 style="color:black;">CADASTRO DE FUNCIONÁRIOS</h1>
      </div>


<main>

  <section>
    <a href="CadastroFuncionario.jsp">
      <button class="btn btn-success">Voltar</button>
    </a>
  </section>

  <h2 class="mt-3"><%out.write(titulo);%></h2>

  <form method="get" action= "SalvaFuncionario.jsp">
  <input type = "hidden" name= "id_funcionario" value= "<%out.write(String.valueOf(id)); %>">

    <div class="form-group">
      <label>Nome Funcionário</label>
      <input type="text" class="form-control" name="nome_funcionario" value="<%out.write(nome_funcionario);%>">
    </div>

    <div class="form-group">
      <label>Idade</label>
      <input type="number" class="form-control" name="idade" value="<%out.write(idade);%>">
    </div>

    <div class="form-group">
      <label>Situação</label>

      <div>
          <div class="form-check form-check-inline">
            <label class="form-control">
              <input type="radio" name="situacao" value="A" <% if (ativo){out.write("checked=''");} %>> Ativo
            </label>
          </div>

          <div class="form-check form-check-inline">
            <label class="form-control">
              <input type="radio" name="situacao" value="I"<% if (!ativo){out.write("checked=''");} %>> Inativo
            </label>	
          </div>
      </div>

    </div>

    <div class="form-group">
      <button type="submit" class="btn btn-success">Cadastrar</button>
    </div>

  </form>

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