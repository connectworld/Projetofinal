<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>-->
<div class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="chamaHomeAdmin" class="">Home</a></li>
                        <li class=" dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Usuarios<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class=" dropdown">
                                    <a href="cadastrarUsuario">Cadastrar Usuario</a>
                                </li>
                                <li><a href="listarUsuario">Listar Usuario</a></li>
                            </ul>
                        </li>
                        <li class=" dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Nivel de Usuario<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class=" dropdown">
                                    <a href="cadastrarNivelUsuario">Cadastrar Nivel de Usuario</a>
                                </li>
                                <li><a href="listarNivelUsuario">Listar Niveis de Usuarios</a></li>
                            </ul>
                        </li>
                        <li class=" dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Servicos <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="cadastrarServico">Cadastrar Servico</a></li>
                                <li><a href="listarServico">Listar Servico</a></li>
                            </ul>
                        </li>
                        <li class=" dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Baixa de Peedido<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="baixaPedidoServico">Baixar Pedidos de Servico</a></li>
                                <li><a href="baixaPedidoProduto">Baixar Pedidos de Produto</a></li>
                                <li><a href="listarCliente">Clientes</a></li>
                            </ul>
                        </li>
                        <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pedido Servico<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="pesquisarServico">Realizar Pedido</a></li>
                                <li><a href="exibirRelatorioServico">Listar Pedido</a></li>
                            </ul>
                        </li>
                        <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pedido Produto<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="pedidoProdutoAdmin">Realizar Pedido</a></li>
                                <li><a href="exibirRelatorioProduto">Listar Pedidos</a></li>
                            </ul>
                        </li>
                        <li class=" down"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Produtos<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="cadastrarProduto">Cadastrar Produto</a></li>
                                <li><a href="listarProduto">Listar Produto</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${usuarioLogado.nome}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Alterar Meus Dados</a></li>
                                <li><a href="#">Alterar Minha Senha</a></li>
                               
                            </ul>
                        </li>
                         <li><a href="logout">Sair</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- 
</body>
</html>
 -->