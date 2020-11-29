<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
			<p class="lead">Meu primeiro CRUD em java, baseado no modelo da arquitetura MVC utilizando páginas jsp e bootstrap como framework para o Front-End</p>
		</div>
	</section>
	
	<section id="formulario-cadastro">
		<div class="container bg-light">
		<h2 class="text-center text-muted pt-3 pb-3">Área de Edição de Dados Cliente</h2>
			<form action="cliente?acao=alterar&opcao=2" method="post">
			
			<div class="form-group">
				<div class="row">
					
						
						<input type="hidden" name="id"  value="${cliente.idCliente}"/>	
				
					
					<div class="col">
						<label for="exampleInputNome">Primeiro Nome</label>
						<input type="text" class="form-control" name="nome" id="nome" value="${cliente.nome }"/>	
					</div>
				
					<div class="col"> 
						<label for="exampleInputSobrenome">Ultimo Nome</label>
						<input type="text" class="form-control" name="ultimoNome" id="ultimoNome" value="${cliente.ultimoNome }"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="exampleInputEmail1">Endereço de Email</label>
				<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="enderecoEmail" value="${cliente.enderecoEmail }">
				<small id="emailHelp" class="form-text text-muted">Nós nunca iremos compartilhar seu email com ninguém</small>
			</div>
			
			<div class="form-group">
				<label for="exampleInput">Senha</label>
				<input type="password" class="form-control"  name="senha" value="${cliente.senha }"/>
			</div>
			<div class="row">
			
				<div class="form-group col-md-6">
					<label for="inputyCity">Cidade</label>
					<input type="text" class="form-control" id="inputCity" name="cidade" value="${cliente.cidade }"/>
				</div>
				
					<div class="form-group col-md-4">
						<label for="inputState">Estado</label>
					<input type="text" class="form-control" id="inputState" name="estado" value="${cliente.estado}"/>
					</div>
				
				
				
				<div class="form-group col-md-2">
					<label for="inputZip">Cep</label>
					<input type="number" class="form-control" id="inputZip" name="cep" value="${cliente.cep}"/>
				</div>
				
			</div>
			<input type="submit" class="btn btn-success mb-3 mt-3">
			
			</form>
			
		</div>

	</section>
	


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html>