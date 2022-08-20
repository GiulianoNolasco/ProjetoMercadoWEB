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
	ComandosDAO dao = new ComandosDAO();
	cli.setId_cliente(Integer.parseInt(request.getParameter("id_cliente")));
	dao.apagaRegistro(cli);
	response.sendRedirect("CadastroCliente.jsp");
	%>

</body>
</html>