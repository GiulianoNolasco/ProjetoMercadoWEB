package DTO;

import UTIL.Campo;
import java.util.ArrayList;
import java.util.HashMap;

public abstract class Tabela {

    public String nomeTabela;

    public abstract ArrayList<Campo> retornaCampos();

    public HashMap<String, String> retornaApelidoCampos() {
        ArrayList<Campo> ListaCampos = retornaCampos();
        HashMap<String, String> hm = new HashMap<>();
        for (Campo campo : ListaCampos) {
            hm.put(campo.apelidoCampo, campo.nomeCampo);
        }
        return hm;
    }
}
