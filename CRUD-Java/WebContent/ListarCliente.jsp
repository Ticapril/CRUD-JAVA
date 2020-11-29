<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Meu CRUD em java Web</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark text-white">
		
			<a class="navbar-brand" href="#">
				<i class="fas fa-mug-hot"></i>
			</a>
		
		
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav">
				<li class="navbar-item"><a class="nav-link" href="http://localhost:8080/CRUD-Java/CadastrarCliente.jsp">Cadastrar Cliente</a></li>
				<li class="navbar-item"><a class="nav-link" href="http://localhost:8080/CRUD-Java/cliente?acao=cadastrar&opcao=2">Listar Clientes</a></li>
			</ul>
		</div>
	
	</nav>
	
	
	<section id="inicio">
		<div class="jumbotron">
			<h1 class="display-4">Descrição da Aplicação</h1>
			<hr/>
			<p class="lead">Meu primeiro CRUD em java, baseado no modelo da arquitetura MVC utilizando páginas jsp e bootstrap como framework para o Front-End</p>
		</div>
	</section>
	
	<section id="formulario-cadastro">
		<div class="container bg-light">
			<h2 class="text-center text-muted pt-3 pb-3">Lista de Clientes</h2>
			
			
		
						
			
			<table class="table table-striped table-sm">
        <thead>
            <tr>
               <th scope="col">Código Cliente</th>
					<th scope="col">Primeiro Nome</th>	
					<th scope="col">Ultimo Nome</th>		
					<th scope="col">Endereço Email</th>	
					<th scope="col">Estado</th>	
					<th scope="col">Cidade</th>	
					<th scope="col">Cep</th>
						
					<th scope="col" class="text-center">Opções</th>
						
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="cliente" items="${clientes}" >
	        	 <tr>
	                <td>${cliente.idCliente}</td>
	                <td>${cliente.nome}</td>
	                <td>${cliente.ultimoNome}</td>
	                <td>${cliente.enderecoEmail}</td>
	                <td>${cliente.estado}</td>
	                <td>${cliente.cidade}</td>
	                <td>${cliente.cep}</td>
	                <td class="text-center">
	                    <a href="cliente?acao=alterar&opcao=1&id=${cliente.idCliente}" class="btn btn-warning" data-toggle="modal" data-target="#modalAlterar"> <i class="fas fa-user-edit"></i>  Alterar</a>
	                    <a href="cliente?acao=excluir&id=${cliente.idCliente}" class="btn btn-danger" data-toggle="modal" data-target="#modalExcluir"><i class="fas fa-trash-alt" ></i>  Excluir</a>
	                </td>
	            </tr>
        	</c:forEach>   
        </tbody>
    </table>
			
			
		</div>
	</section>
	
	<div class="modal fade" id="modalExcluir" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Deseja realmente Excluir este cliente?</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
			
					<div class="modal-body">
						Ao clicar no botão confirmar o cliente selecionado será excluido da base de dados para sempre e não será possível recupera-lo
					</div>
			
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
						<button type="button" class="btn btn-primary">Confirmar</button>
					</div>
					
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modalAlterar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Deseja realmente Alterar os dados deste cliente?</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
				</div>
				
				<div class="modal-body">
					Ao clicar no botão confirmar você será redirecionado a uma página de edição do cliente
				</div>
			
				<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
							<button type="button" class="btn btn-primary">Confirmar</button>
				</div>
			</div>
		</div>
	</div>




<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html>