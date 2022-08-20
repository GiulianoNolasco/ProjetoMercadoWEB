package DTO;

import UTIL.Campo;
import java.util.ArrayList;

public class VendasDTO extends Tabela {

    private Campo<Integer> id_venda = new Campo<>("id_venda", "Identificador", true);
    private Campo<Integer> fk_cliente = new Campo<>("fk_cliente", "Cliente Comprou");
    private Campo<Integer> fk_produto = new Campo<>("fk_produto", "Produdo Vendido");
    private Campo<Integer> fk_funcionario = new Campo<>("fk_funcionario", "Funcionário Vendeu");
    private Campo<Integer> quantidade = new Campo<>("quantidade", "Quantidade");

    public VendasDTO() {
        this.nomeTabela = "vendas";
    }

    @Override
    public ArrayList<Campo> retornaCampos() {
        ArrayList<Campo> listaCampos = new ArrayList<>();
        listaCampos.add(getId_venda());
        listaCampos.add(getFk_cliente());
        listaCampos.add(getFk_produto());
        listaCampos.add(getFk_funcionario());
        listaCampos.add(getQuantidade());
        return listaCampos;
    }

    public Campo<Integer> getId_venda() {
        return id_venda;
    }

    public Campo<Integer> getFk_cliente() {
        return fk_cliente;
    }

    public Campo<Integer> getFk_produto() {
        return fk_produto;
    }

    public Campo<Integer> getFk_funcionario() {
        return fk_funcionario;
    }

    public Campo<Integer> getQuantidade() {
        return quantidade;
    }

    public void setId_venda(Integer id_venda) {
        this.id_venda.valorCampo = id_venda;
    }

    public void setFk_cliente(Integer fk_cliente) {
        this.fk_cliente.valorCampo = fk_cliente;
    }

    public void setFk_produto(Integer fk_produto) {
        this.fk_produto.valorCampo = fk_produto;
    }

    public void setFk_funcionario(Integer fk_funcionario) {
        this.fk_funcionario.valorCampo = fk_funcionario;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade.valorCampo = quantidade;
    }
}
