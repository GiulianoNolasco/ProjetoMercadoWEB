<%@page import="DTO.FuncionariosDTO"%>
<%@page import="DAO.ComandosDAO"%>
<%@page import="DTO.ClientesDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	FuncionariosDTO fun = new FuncionariosDTO();
	ComandosDAO DAO = new ComandosDAO();

	String id = request.getParameter("id_funcionario");
	String nome = request.getParameter("nome_funcionario");
	String idade = request.getParameter("idade");
	String situacao = request.getParameter("situacao");
	fun.setIdade(Integer.parseInt(idade));
	fun.setSituacao(situacao.charAt(0));
	fun.setNome_funcionario(nome);

	if (id.equals("-1")) {
		DAO.insereRegistro(fun);
	} else {
		fun.setId_funcionario(Integer.parseInt(id));
		DAO.atualizaRegistro(fun);
	}
	
	response.sendRedirect("CadastroFuncionario.jsp");

	%>

</body>
</html>