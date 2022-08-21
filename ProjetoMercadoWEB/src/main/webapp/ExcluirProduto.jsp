<%@page import="DTO.ProdutosDTO"%>
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
	ProdutosDTO pro = new ProdutosDTO();
	ComandosDAO DAO = new ComandosDAO();
	pro.setId_produto(Integer.parseInt(request.getParameter("id_produto")));
	DAO.apagaRegistro(pro);
	response.sendRedirect("CadastroProduto.jsp");
	%>

</body>
</html>