<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Selecionar Servico</title>
	<link href="view/bootstrapHome/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="view/js/jquery.alphanumeric.js"></script>
	<script src="view/bootstrapHome/js/bootstrap.min.js"></script>
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.8/css/jquery.dataTables.css">
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.8/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="view/js/table.js"></script>
</head>
<body>
<c:import url="/view/principal/menu.jsp"></c:import>
<br>
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
	<div  class="tabelas">
	<div align="center"><h3 class="h3">PEDIDO DE SERVICO</h3></div>
	<div align="center"><h3 class="h3">SELECIONE O SERVICO</h3></div>
		<table style="pading: 5%;" id="tableProduto" class="table">
			<thead>
				<tr>
					<th>NOME</th>
					<th>DESCRI��O</th>
					<th>PRECO</th>
					<th>GARANTIA</th>
					<th>SELECIONAR</th>
				</tr>
			</thead> 
			<c:forEach var="servico" items="${listaServico}">
					<tr>
						<td>${servico.nome}</td>
						<td>${servico.descricao}</td>
						<td>${servico.preco}</td>
						<td>
							<fmt:formatDate value="${servico.garantia}" pattern="dd/MM/yyyy" />
						</td>
						<td>
							<a href="retornaPedidoServicoWeb?cod=${servico.cod}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span>Selecionar</a>
						</td>
					</tr>	
			</c:forEach>	
		</table>
		<br><br>
		<h3>Servicos Selecionados</h3>
		<table class="table" id="servicoSelecionado">
			<thead>
				<tr>
					<th>NOME</th>
					<th>DESCRI��O</th>
					<th>PRECO</th>
					<th>GARANTIA</th>
					<th>REMOVER</th>
				</tr>
			</thead> 
			<c:forEach var="servicoAdd" items="${listaServicoAdd}" varStatus="id">
					<tr>
						<td>${servicoAdd.nome}</td>
						<td>${servicoAdd.descricao}</td>
						<td>${servicoAdd.preco}</td>
						<td>
							<fmt:formatDate value="${servicoAdd.garantia}" pattern="dd/MM/yyyy" />
						</td>
						<td>
							<a class="btn icon-btn btn-warning" href="removerServicoPedidoWeb?cod=${servicoAdd.cod}"><span class="glyphicon btn-glyphicon glyphicon-minus img-circle text-warning"></span>Remove</a>
						</td>
					</tr>	
			</c:forEach>	
		</table>
		<br>
		<div align="center">
				<a class="btn icon-btn btn-info" href="pedidoServicoEtapa2Web"><span class="glyphicon btn-glyphicon glyphicon-share img-circle text-info"></span>Pr�xima Etapa do Pedido</a>
		
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#codigo').numeric();	
		});
	</script> 
</body>
</html>