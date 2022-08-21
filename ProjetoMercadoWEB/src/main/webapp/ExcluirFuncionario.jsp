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
	fun.setId_funcionario(Integer.parseInt(request.getParameter("id_funcionario")));
	DAO.apagaRegistro(fun);
	response.sendRedirect("CadastroFuncionario.jsp");
	%>

</body>
</html>