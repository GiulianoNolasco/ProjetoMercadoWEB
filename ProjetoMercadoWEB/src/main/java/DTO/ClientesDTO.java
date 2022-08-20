package DTO;

import UTIL.Campo;
import java.util.ArrayList;

public class ClientesDTO extends Tabela {

    private Campo<Integer> id_cliente = new Campo<>("id_cliente", "Identificador", true); //String apelido
    private Campo<String> nome_cliente = new Campo<>("nome_cliente", "Nome cliente");
    private Campo<Integer> idade_cliente = new Campo<>("idade_cliente", "Idade");
    private Campo<Character> situacao_cliente = new Campo<>("situacao_cliente", "Situação");

    public ClientesDTO() {
        this.nomeTabela = "clientes";
    }

    @Override
    public ArrayList<Campo> retornaCampos() {
        ArrayList<Campo> listaCampos = new ArrayList<>();
        listaCampos.add(getId_cliente());
        listaCampos.add(getNome_cliente());
        listaCampos.add(getIdade_cliente());
        listaCampos.add(getSituacao_cliente());
        return listaCampos;
    }

    public Campo<Integer> getId_cliente() {
        return id_cliente;
    }

    public Campo<String> getNome_cliente() {
        return nome_cliente;
    }

    public Campo<Integer> getIdade_cliente() {
        return idade_cliente;
    }

    public Campo<Character> getSituacao_cliente() {
        return situacao_cliente;
    }

    public void setId_cliente(Integer id_cliente) {
        this.id_cliente.valorCampo = id_cliente;
    }

    public void setNome_cliente(String nome_cliente) {
        this.nome_cliente.valorCampo = nome_cliente;
    }

    public void setIdade_cliente(Integer idade_cliente) {
        this.idade_cliente.valorCampo = idade_cliente;
    }

    public void setSituacao_cliente(Character situacao_cliente) {
        this.situacao_cliente.valorCampo = situacao_cliente;
    }
}
