<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Produto Admin</title>
	<link href="view/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.8/css/jquery.dataTables.css">
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.8/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="view/js/table.js"></script>
</head>
<body>
<c:import url="../menu.jsp"></c:import>

	
	<div class="tabelas">
	
	<c:choose>
		<c:when test="${not empty mensagem}">
			<div class="alert alert-success">
  				<button type="button" class="close" data-dismiss="alert">
  					<span class="glyphicon glyphicon-remove"></span>
  				</button>
  				<strong>${mensagem}</strong>
			</div>
		</c:when>
	</c:choose>
	<div align="center"><h3 class="h3">Produtos</h3></div>
		<table id="tableProduto" class="table">
			<thead>
				<tr>
					<th class="thMenor">COD</th>
					<th class="tabelaGeral">NOME</th>
					<th class="tabelaGeral">CADASTRANTE</th>
					<th class="tabelaGeral">DESCRI��O</th>
					<th class="tabelaGeral">PRECO VENDA</th>
					<th class="tabelaGeral">QUANTIDADE</th>
					<th class="tabelaGeral">IMAGEM</th>
					<th>SELECIONAR</th>
					
				</tr>
			</thead> 
			<c:forEach var="produto" items="${listaProduto}" varStatus="id">
					<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'blue' }">
						<td>${produto.cod }</td>
						<td>${produto.nome}</td>
						<td>${produto.usuario.nome}</td>
						<td>${produto.descricao}</td>
						<td>${produto.precoVenda}</td>
						<td>${produto.quantidade}</td>
						<td>
							<img alt="img" src="view/img/${produto.imagem}" style="width: 30%;" />
						</td>
					<td><a href="pedidoProdutoAdd?cod=${produto.cod}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span>Selecionar</a></td>
					</tr>
				
			</c:forEach>	
		</table>
		
		
		<br><br>
		<h3>Produto Selecionados</h3>
		<table class="table" id="servicoSelecionado">
			<thead>
				<tr>
					<th class="thMenor">COD</th>
					<th class="tabelaGeral">NOME</th>
					<th class="tabelaGeral">DESCRI��O</th>
					<th class="tabelaGeral">PRECO VENDA</th>
					<th class="tabelaGeral">QUANTIDADE</th>
					<th class="tabelaGeral">IMAGEM</th>
					<th class="tabelaGeral">SELECIONAR</th>
				</tr>
			</thead> 
			<c:forEach var="produtoAdd" items="${listaProdutoAdd}" varStatus="id">
					<tr>
						<td>${produtoAdd.cod }</td>
						<td>${produtoAdd.nome}</td>
						<td>${produtoAdd.descricao}</td>
						<td>${produtoAdd.precoVenda}</td>
						<td>${produtoAdd.quantidade}</td>
						<td>
							<img alt="img" src="view/img/${produtoAdd.imagem}" style="width: 30%;" />
						
						<td><a class="btn icon-btn btn-warning" href="removerProdutoPedidoAdmin?cod=${produtoAdd.cod}"><span class="glyphicon btn-glyphicon glyphicon-minus img-circle text-warning"></span>Remove</a></td>
					</tr>	
			</c:forEach>	
		</table>
		<br>
		<div align="center">
				<a class="btn icon-btn btn-info" href="pedidoProdutoEtapa2Admin"><span class="glyphicon btn-glyphicon glyphicon-share img-circle text-info"></span>Pr�xima Etapa do Pedido</a>
		
		</div>
	</div>
</body>
</html>