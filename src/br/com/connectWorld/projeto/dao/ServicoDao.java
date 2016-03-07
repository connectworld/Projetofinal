package br.com.connectWorld.projeto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.connectWorld.projeto.model.Servico;
import br.com.connectWorld.projeto.model.Usuario;
import br.com.connectWorld.projeto.util.ConexaoComBanco;

public class ServicoDao {
	// CRIANDO A VAIRAVEL QUE IRAR RECEBER A CONEXAO
	private Connection conexao;

	// CRIANDO O METODO DA CONEXAO
	public ServicoDao() {
		try {
			this.conexao = new ConexaoComBanco().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void salvar(Servico servico) {
		// COMANDO SQL PARA SALVAR CONTATOS
		String insert = "INSERT INTO servicos (nome,descricao,preco,garantia,user_cadastrante) VALUES (?,?,?,?,?)";
		// CRIANDO VAIRAVEL QUE VAI RESPONSALVEL PELO COMANDO ACIMA
		PreparedStatement stmt;
		try {
			// INSERINDO O COMANDO SQL DENTRO DA VARIAVEL CRIANDA ACIMA
			stmt = conexao.prepareStatement(insert);
			// INSERINDO OS DADOS DENTR DA VARIAVEL STMT
			stmt.setString(1, servico.getNome());
			stmt.setString(2, servico.getDescricao());
			stmt.setDouble(3, servico.getPreco());
			stmt.setDate(4, new java.sql.Date(servico.getGarantia().getTime()));
			stmt.setInt(5, servico.getUsuario().getCod());
			// EXUCUTANDO O SQL
			stmt.execute();
			// FECHANDO CONEXAO
			conexao.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

	public List<Servico> listar() {
		try {
			// CRIANDO UM ARRAY LISTA PARA GUARDAR OS DADOS PARA PODEREM
			// SER APRESENTADOS
			List<Servico> listarServico = new ArrayList<Servico>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("select * from servicos");
			ResultSet param = stmt.executeQuery();

			// PECORRENDO O ARRAY E MONTADO O OBJETO
			Servico servico = null;
			while (param.next()) {
				servico = montarObjeto(param);
				listarServico.add(servico);
			}
			param.close();
			stmt.close();
			conexao.close();
			return listarServico;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// METODO QUE ATUALIZA CONTATOS DO BANCO DE DADOS
	public void atualizarServico(Servico servico) {
		String sql = "update servicos set descricao=?, nome=?, preco=?, garantia = ?,user_cadastrante = ? where cod_servico=?";
		try {
			PreparedStatement param = conexao.prepareStatement(sql);
			param.setString(1, servico.getDescricao());
			param.setString(2, servico.getNome());
			param.setDouble(3, servico.getPreco());
			param.setDate(4, new java.sql.Date(servico.getGarantia().getTime()));
			param.setInt(5, servico.getUsuario().getCod());
			param.setInt(6, servico.getCod());

			param.execute();
			param.close();
			conexao.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// METODO QUE DELETA CONTATOS
	public void deletar(Servico servico) {
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("DELETE FROM servicos WHERE cod_servico = ? or nome = ?");
			stmt.setInt(1, servico.getCod());
			stmt.setString(2, servico.getNome());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Servico buscarPorCod(int cod) {
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("SELECT * FROM servicos WHERE cod_servico = ?");
			stmt.setInt(1, cod);
			ResultSet rs = stmt.executeQuery();

			Servico servico = null;
			if (rs.next()) {
				servico = montarObjeto(rs);
			}
			rs.close();
			stmt.close();
			conexao.close();
			return servico;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// METODO DE TESTE DO JUNIT
	public Servico buscarPorNome(String nome) {
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("SELECT * FROM servicos WHERE nome = ?");
			stmt.setString(1, nome);
			ResultSet rs = stmt.executeQuery();

			Servico servico = null;
			if (rs.next()) {
				servico = montarObjeto(rs);
			}
			rs.close();
			stmt.close();
			conexao.close();
			return servico;
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Montar Objeto
	private Servico montarObjeto(ResultSet rs) throws SQLException {

		Servico servico = new Servico();
		servico.setCod(rs.getInt("cod_servico"));
		servico.setNome(rs.getString("nome"));
		servico.setDescricao(rs.getString("descricao"));
		servico.setPreco(rs.getDouble("preco"));
		servico.setGarantia(rs.getDate("garantia"));

		// MONTANODO USUÁRIO
		int cod = rs.getInt("user_cadastrante");
		UsuarioDao dao = new UsuarioDao();
		Usuario usuario = dao.buscarPorCod(cod);
		servico.setUsuario(usuario);
		return servico;
	}
	public void fecharBanco() throws SQLException {
		conexao.close();

	}

}
