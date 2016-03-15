<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pedido de Servico</title>
	<link href="view/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen" />
	<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
	<script type="text/javascript">
	function limpa_formul�rio_cep() {
        //Limpa valores do formul�rio de cep.
        document.getElementById('rua').value=("");
        document.getElementById('bairro').value=("");
        document.getElementById('cidade').value=("");
        document.getElementById('uf').value=("");
        document.getElementById('ibge').value=("");
}

function meu_callback(conteudo) {
    if (!("erro" in conteudo)) {
        //Atualiza os campos com os valores.
        document.getElementById('rua').value=(conteudo.logradouro);
        document.getElementById('bairro').value=(conteudo.bairro);
        document.getElementById('cidade').value=(conteudo.localidade);
        document.getElementById('uf').value=(conteudo.uf);
        document.getElementById('ibge').value=(conteudo.ibge);
    } //end if.
    else {
        //CEP n�o Encontrado.
        limpa_formul�rio_cep();
        alert("CEP n�o encontrado.");
    }
}
    
function pesquisacep(valor) {

    //Nova vari�vel "cep" somente com d�gitos.
    var cep = valor.replace(/\D/g, '');

    //Verifica se campo cep possui valor informado.
    if (cep != "") {

        //Express�o regular para validar o CEP.
        var validacep = /^[0-9]{8}$/;

        //Valida o formato do CEP.
        if(validacep.test(cep)) {

            //Preenche os campos com "..." enquanto consulta webservice.
            document.getElementById('rua').value="...";
            document.getElementById('bairro').value="...";
            document.getElementById('cidade').value="...";
            document.getElementById('uf').value="...";
            document.getElementById('ibge').value="...";

            //Cria um elemento javascript.
            var script = document.createElement('script');

            //Sincroniza com o callback.
            script.src = '//viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

            //Insere script no documento e carrega o conte�do.
            document.body.appendChild(script);

        } //end if.
        else {
            //cep � inv�lido.
            limpa_formul�rio_cep();
            alert("Formato de CEP inv�lido.");
        }
    } //end if.
    else {
        //cep sem valor, limpa formul�rio.
        limpa_formul�rio_cep();
    }
};
	</script>
	<script type="text/javascript" src="view/js/validaCpf.js"></script>
	<script type="text/javascript" src="view/js/buscarCep.js"></script>
	<script type="text/javascript" src="view/js/jquery.maskedinput.js"></script>
</head>
<body>
	<c:import url="../menu.jsp"></c:import>
	<br><br><br>
	<div class="spacing">
	<div align="center">
	<form action="buscarCpf">
		<h4>
			Buscar Cliente por CFP
		</h4>
		<label for="CPF"> CPF:</label>
		<input type="text" required="" placeholder="CPF" name="cpf" id="cpf2" maxlength="11" onblur="return verificarCPF(this.value)" >
		<input type="submit" value="Buscar" name="submit">
	</form>
	</div>
	<br><br>
	<div align="center">
	<form action="buscarCliente">
		<input type="submit" value="Selecionar Cliente" name="submit" class="button">
	</form>
	</div>
	</div>
	<form action="salvarClientePedido" method="post" id="contactFrm">
	<section style=" min-height: 680px; width: 920px; margin: 20px auto; background: #ccc; box-shadow: 0 0 3px #000;">
			<div style="float: left; width: 30%;">
				<div class="container">
					<div class="row">
    					<div class="col-md-4">
							<div class="form_main">
       							<h4 class="heading"><strong>Pedido de Servi�o</strong>  <span></span></h4>
           						<div class="form">
               						<label for="nome"> Nome:</label>
                   					<input type="text" required="" placeholder="Nome Completo" name="nome" class="txt" >
                   					<label for="CPF"> CPF:</label>
		                    		<input type="text" required="" placeholder="CPF" name="cpf" id="cpf" class="txt" maxlength="11" onblur="return verificarCPF(this.value)">
		                    		<label for="E-mail"> E-mail:</label>
		                    		<input type="text" required="" placeholder="Email" name="email" class="txt" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
		                    		<label for="Contato1"> Contato 1:</label>
		                    		<input type="text" required="" placeholder="Contato" name="contato1" id="contato1" class="txt">
		                    		<label for="Contato2"> Contato 2:</label>
		                    		<input type="text" required="" placeholder="Contato Alternativo" name="contato2" id="contato2" class="txt">
		                    		<label for="Servico">Servico:</label> <br>
		                    		 <select name="servico" multiple="multiple" class="form-control" required="required">
		                    			<option value="">Selecione</option>
                            				<c:forEach items="${listaServico}" var="listaServico">
												<option value="${listaServico.cod}"
												<c:if test="${listaServico.cod eq servico.cod}"> selected="selected"</c:if>>
												${nivel.nome}</option>
											</c:forEach>
		                    		</select> 
           						</div>
           					</div>
           				</div>
					</div>
				</div>
			</div>
		<div style="float: right; width: 50%;">
			<div class="container">
				<div class="row">
	    			 <div class="col-md-4">
						<div class="form_main">
	       					<h4 class="heading"><strong>Endereco </strong>  <span></span></h4>
	           					<div class="form">
			                    	<label for="Cep"> Cep:</label>
			                    	<input type="text" required="" placeholder="Cep" name="cep" id="cep" class="txt" onblur="pesquisacep(this.value);">
			                    	<label for="rua"> Rua:</label>
			                    	 <input type="text" required="" placeholder="Rua" name="rua" id="rua" class="txt" >
			                    	<label for="bairro"> Bairro:</label>
			                    	<input type="text" required="" placeholder="Bairro" name="bairro" id="bairro" class="txt" >
			                    	<label for="cidade">Cidade:</label>
			                    	<input type="text" required="" placeholder="Cidade" name="cidade" id="cidade" class="txt" >
			                    	<label for="uf">UF:</label>
			                    	<input type="text" required="" placeholder="UF" name="uf"  id="uf" class="txt" >
			                    	<label for="Numero">Numero</label>
			                    	<input type="text" required="" placeholder="Numero" size="2" name="numero"  id="numero" class="txt" >
			                    	<label for="ibge">IBGE</label>
			                    	<input type="text" name="ibge" id="ibge" class="txt" readonly="readonly">			       	
	           					</div>
	           				</div>
	           			</div> 	           			
					</div>
				</div>
			</div>
	</section>
	<div align="center">
		<input type="submit" value="Enviar" name="submit" class="txt2">
	</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#cpf").mask("999.999.999-99");
			$("#cpf2").mask("999.999.999-99");
			$("#cep").mask("99999-999");
			$("#contato1").mask("(99)99999-9999");
			$("#contato2").mask("(99)99999-9999");
		});
</script> 
</body>
</html>