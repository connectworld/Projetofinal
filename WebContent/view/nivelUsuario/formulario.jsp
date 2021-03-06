<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Niveis de Usuarios</title>
	<link href="view/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="view/js/validaForm.js"></script>
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
<div class="spacing">
<div class="container">
    <div class="row">
        <div class="col-sm-offset-4 col-sm-4">
            <form method="post" action="salvarNivelUsuario" enctype="multipart/form-data">
            <input type="hidden" name="usuario" value="${usuarioLogado.cod }">
            <h3 class="labelsEdit">Cadastro de Niveis de Usarios</h3>
				<div class="form-group">
        			<label for="nome" class="labelsEdit">Nivel do Usu�rio</label>
					<div class="input-group">
						<input type="text" class="form-control" name="nome" id="validate-text" placeholder="Nome" required>
						<span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
					</div>
				</div>
				<div class="form-group">
        			<label for="descricao" class="labelsEdit">Descricao:</label>
					<div class="input-group">
						<input type="text" class="form-control" name="descricao" id="validate-text" placeholder="Descricao" required>
						<span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
					</div>
				</div>
				<div class="form-group">
            		<label for="telas" class="labelsEdit">Telas de Permiss�es:</label>
				</div>
                <button class="btn btn-lg btn-success btn-block" type="submit">Cadastrar</button>
            </form>
        </div>
    </div>
    <div class="tabelas">
		<div align="center"><h3 class="h3">Telas Selecionadas</h3></div>
			<table id="servicoSelecionado" class="table">
				<thead>
					<tr>
						<th>COD</th>
						<th>NOME</th>
					</tr>
				</thead> 
				<c:forEach var="telaAdd" items="${listaTelaAdd}" varStatus="id">
						<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'blue' }">
							<td>${telaAdd.cod }</td>
							<td>${telaAdd.descricao}</td>
						</tr>	
				</c:forEach>	
			</table>
		</div>
</div>
</div>
</body>
</html>