package control;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Cliente_DAO;
import dao.Conexao;
import model.Cliente;

@WebServlet("/cliente")
public class CrudController extends HttpServlet {
	private static final long serialVersionUID = 1l;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
		
		Connection conexao = (Connection) Conexao.getConnection(); // criei uma conex�o  e armazenei a conexao em uma varadcionei cast (connection) pq?
		
		Cliente_DAO  cliente_dao = new Cliente_DAO(conexao);
		
		req.setAttribute("cliente_dao",cliente_dao); // setando o atributo cliente_dao na requisi��o
		
		String acao = req.getParameter("acao");
		
		String dispatcher = "";
		
		switch(acao){
		case "cadastrar":
			dispatcher = this.cadastrar(req, resp);
			break;
		case "alterar":
			dispatcher = this.alterar(req, resp);
			break;
		case "listar":
			dispatcher = this.listar(req, resp);
			break;
		case "excluir":
			dispatcher = this.excluir(req, resp);
			break;
		}
		try {
			conexao.close();
		}catch(Exception e){
			System.out.println("Erro ao estabelecer a conex�o");
			e.printStackTrace();
		}
		//seguindo o fluxo
		req.getRequestDispatcher(dispatcher).forward(req, resp);
	}
	
	private String cadastrar(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException  {
		//pega a op��o da url 
			String opcao = req.getParameter("opcao");
			
		if(opcao.equals("1")) {//tela cadastrar
			return "CadastrarCliente.jsp";
		}
		
		
		
		if(opcao.equals("2")) { //cadastrar
			//criando o objeto cliente
			
			Cliente cliente = new Cliente();
			
			//seta os valores referentes a cliente
			
			cliente.setNome(req.getParameter("nome"));
			cliente.setUltimoNome(req.getParameter("ultimoNome"));
			cliente.setEnderecoEmail(req.getParameter("enderecoEmail"));
			cliente.setSenha(req.getParameter("senha"));
			cliente.setCidade(req.getParameter("cidade"));
			cliente.setEstado(req.getParameter("estado"));
			cliente.setCep(req.getParameter("cep"));
			
			
			Cliente_DAO cliente_dao = (Cliente_DAO) req.getAttribute("cliente_dao");
			cliente_dao.cadastrar(cliente);
			return "cliente?acao=listar";
		}
		return "";
		
		
		
	}
	
	private String alterar(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException  {
		
		String opcao = req.getParameter("opcao");
		
		Cliente_DAO cliente_dao = (Cliente_DAO) req.getAttribute("cliente_dao");
		
				
		if(opcao.equals("1")) {//tela
			int id  = Integer.parseInt(req.getParameter("id"));
			
			Cliente cliente = cliente_dao.buscarPorId(id);
			
			req.setAttribute("cliente",cliente);
			
			return "AlterarCliente.jsp";
			
		}
		if(opcao.equals("2")) { // atualizar
			Cliente cliente = new Cliente();
			
			cliente.setIdCliente(Integer.parseInt(req.getParameter("id")));
			cliente.setNome(req.getParameter("nome"));
			cliente.setUltimoNome(req.getParameter("ultimoNome"));
			cliente.setEnderecoEmail(req.getParameter("enderecoEmail"));
			cliente.setSenha(req.getParameter("senha"));
			cliente.setCidade(req.getParameter("cidade"));
			cliente.setEstado(req.getParameter("estado"));
			cliente.setCep(req.getParameter("cep"));
			
			cliente_dao.alterar(cliente);
			
			return "cliente?acao=listar";
			
		}
		return "";
	}
	
	
	private String listar(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
			
		Cliente_DAO cliente_dao = (Cliente_DAO) req.getAttribute("cliente_dao");
		
		List<Cliente> clientes = cliente_dao.listar();
		
		req.setAttribute("clientes", clientes);
		
		return "ListarCliente.jsp";
	}
	
	private String excluir(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException  {
		
		Cliente_DAO cliente_dao = (Cliente_DAO) req.getAttribute("cliente_dao");//eu to armazenando a requisi��o na variavel cliente_dao
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		cliente_dao.excluir(id);
		
		return "cliente?acao=listar";
		
		
	}

}
