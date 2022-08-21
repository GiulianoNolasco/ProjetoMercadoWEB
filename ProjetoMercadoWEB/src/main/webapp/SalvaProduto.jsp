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

	String id = request.getParameter("id_produto");
	String nome = request.getParameter("descricao_produto");
	float preco = Float.parseFloat(request.getParameter("preco"));
	String situacao = request.getParameter("situacao");
	pro.setPreco(preco);
	pro.setSituacao(situacao.charAt(0));
	pro.setDescricao_produto(nome);

	if (id.equals("-1")) {
		DAO.insereRegistro(pro);
	} else {
		pro.setId_produto(Integer.parseInt(id));
		DAO.atualizaRegistro(pro);
	}

	response.sendRedirect("CadastroProduto.jsp");
	%>

</body>
</html>