<%@page import="DTO.VendasDTO"%>
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
	VendasDTO venda = new VendasDTO();
	ComandosDAO DAO = new ComandosDAO();
	venda.setId_venda(Integer.parseInt(request.getParameter("id_venda")));
	DAO.apagaRegistro(venda);
	response.sendRedirect("CadastroVenda.jsp");
	%>

</body>
</html>