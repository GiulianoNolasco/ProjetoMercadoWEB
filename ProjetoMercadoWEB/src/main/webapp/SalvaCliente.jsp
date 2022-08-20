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
	ClientesDTO cli = new ClientesDTO();
	ComandosDAO DAO = new ComandosDAO();

	String id = request.getParameter("id_cliente");
	String nome = request.getParameter("nome_cliente");
	String idade = request.getParameter("idade_cliente");
	String situacao = request.getParameter("situacao_cliente");
	cli.setIdade_cliente(Integer.parseInt(idade));
	cli.setSituacao_cliente(situacao.charAt(0));
	cli.setNome_cliente(nome);

	if (id.equals("-1")) {
		DAO.insereRegistro(cli);
	} else {
		cli.setId_cliente(Integer.parseInt(id));
		DAO.atualizaRegistro(cli);
	}
	
	response.sendRedirect("CadastroCliente.jsp");

	%>

</body>
</html>