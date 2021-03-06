package br.com.connectWorld.projeto.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.connectWorld.projeto.dao.ClienteDao;
import br.com.connectWorld.projeto.dao.ItensPedidoServicoDao;
import br.com.connectWorld.projeto.dao.PedidoDao;
import br.com.connectWorld.projeto.dao.ServicoDao;
import br.com.connectWorld.projeto.model.Cliente;
import br.com.connectWorld.projeto.model.Pedido;
import br.com.connectWorld.projeto.model.PedidoWebDTO;
import br.com.connectWorld.projeto.model.Servico;

@Controller
public class ClienteController {
	
	@RequestMapping("/salvarClientePedido")
	public String salvarClientePedido(Model model, PedidoWebDTO pedidoWeb) throws SQLException{
		PedidoDao pedidoDao = new PedidoDao();
		Pedido pedido = new Pedido();
		ClienteDao clienteDao = new ClienteDao();
		Cliente cliente = new Cliente();
		Cliente clientePesquisado = new Cliente();
		cliente.setCpf(pedidoWeb.getCpf());
		clientePesquisado = clienteDao.buscarPorCpf(cliente);
		
		if (clientePesquisado != null) {
			pedido.setCliente(clientePesquisado);
			Date date = new Date();
			pedido.setData(date);
			pedido.setSituacao("A");
			pedido.setValor(0);
			pedidoDao.salvar(pedido);
			
			Pedido ultimoPedidoSalvo = pedidoDao.obterUltimoPedido();
			ItensPedidoServicoDao itens = new ItensPedidoServicoDao();
			for (Servico servico: pedidoWeb.getServico()) {
				itens.salvarItens(ultimoPedidoSalvo.getCod(), servico);
			}
			model.addAttribute("mensagem", "Pedido Realizado Com sucesso");
			pedidoDao.fecharBanco();
			clienteDao.fecharBanco();
			itens.fecharBanco();
			return "forward:chamaPedidoWeb";
		}else {
			cliente.setNome(pedidoWeb.getNome());
			cliente.setCpf(pedidoWeb.getCpf());
			cliente.setEmail(pedidoWeb.getEmail());
			cliente.setContato1(pedidoWeb.getContato1());
			cliente.setContato2(pedidoWeb.getContato2());
			cliente.setCep(pedidoWeb.getCep());
			cliente.setBairro(pedidoWeb.getBairro());
			cliente.setCidade(pedidoWeb.getCidade());
			cliente.setRua(pedidoWeb.getRua());
			cliente.setNumero(pedidoWeb.getNumero());
			cliente.setIbge(pedidoWeb.getIbge());
			cliente.setUf(pedidoWeb.getUf());
			clienteDao.salvar(cliente);
			
			cliente = clienteDao.obterUltimoCliente();
			
			pedido.setCliente(cliente);
			Date date = new Date();
			pedido.setData(date);
			pedido.setSituacao("A");
			pedido.setValor(0);
			pedidoDao.salvar(pedido);
			Pedido ultimoPedidoSalvo = pedidoDao.obterUltimoPedido();
			ItensPedidoServicoDao itens = new ItensPedidoServicoDao();
			for (Servico servico: pedidoWeb.getServico()) {
				itens.salvarItens(ultimoPedidoSalvo.getCod(), servico);
			}
			model.addAttribute("mensagem", "Pedido Realizado Com sucesso");
			pedidoDao.fecharBanco();
			clienteDao.fecharBanco();
			itens.fecharBanco();
			return "forward:chamaPedidoWeb";
		}
		
	}
	@RequestMapping("/chamaPedidoWeb")
	public String chamaPedido(Model model) throws SQLException {
		ServicoDao dao = new ServicoDao();
		List <Servico> listaServico = dao.listar();
		model.addAttribute("listaServico",listaServico);
		dao.fecharBanco();
		return "principal/pedidoServicoWeb";
	}
	@RequestMapping("/buscarCpf")
	public String buscarCpf(Model model,Cliente cliente) throws SQLException {
		ClienteDao clienteDao = new ClienteDao();
		Cliente clienteConsultado = clienteDao.buscarPorCpf(cliente);
		clienteDao.fecharBanco();
		if (clienteConsultado != null) {
			ServicoDao dao = new ServicoDao();
			List <Servico> listaServico = dao.listar();
			dao.fecharBanco();
			model.addAttribute("listaServico",listaServico);
			model.addAttribute("clienteConsultado", clienteConsultado);
			return "principal/pedidoServicoWebPreechido";
		}
		else {
			model.addAttribute("mensagem", "Desculpa, voce ainda nao realizou nenhum tipo de compra conosco");
			return "principal/pedidoServicoWeb";
		}	
	}
	@RequestMapping("/listarCliente")
	public String listarCliente(Model model, Cliente cliente) throws SQLException {
		ClienteDao dao = new ClienteDao();
		List <Cliente> listaCliente = dao.listar();
		model.addAttribute("listaCliente",listaCliente);
		dao.fecharBanco();
		return "cliente/listarCliente";
	}
	@RequestMapping("/deletarCliente")
	public String deletarCliente(Model model, Cliente cliente) throws SQLException {
		ClienteDao dao = new ClienteDao();
		dao.deletar(cliente);
		model.addAttribute("mensagem","Cliente deletado com Sucesso");
		dao.fecharBanco();
		return "cliente/listarCliente";
	}
	@RequestMapping("/editarCliente")
	public String editarCliente(Model model, Cliente cliente) throws SQLException {
		ClienteDao dao = new ClienteDao();
		Cliente clienteConsultado = dao.buscarPorCpf(cliente);
		model.addAttribute("clienteConsultado",clienteConsultado);
		dao.fecharBanco();
		return "cliente/editarCliente";
	}
	@RequestMapping("/verDadosCliente")
	public String verDados(Model model, Cliente cliente) throws SQLException {
		ClienteDao dao = new ClienteDao();
		Cliente clienteConsultado = dao.buscarPorCod(cliente.getCod());
		model.addAttribute("clienteConsultado",clienteConsultado);
		dao.fecharBanco();
		return "cliente/verDados";
	}
}
