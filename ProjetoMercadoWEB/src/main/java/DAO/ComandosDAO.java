package DAO;

import DTO.Tabela;
import UTIL.CRUDUtil;
import UTIL.Campo;
import java.util.ArrayList;
import javax.swing.table.TableModel;

public class ComandosDAO {

    private BancoDAO banco = new BancoDAO();

    public TableModel retornaRegistroCRUD(Tabela tb, String Where) {
        ArrayList<Campo> listaCampos = tb.retornaCampos();
        String campos = "";
        int tamanhoLista = listaCampos.size();
        for (Campo campo : listaCampos) {
            campos += campo.nomeCampo + " '" + campo.apelidoCampo + "'";
            if (tamanhoLista != 1) {
                campos += ",";
            }
            tamanhoLista--;
        }
        return CRUDUtil.resultSetToTableModel(banco.retornaDados("SELECT " + campos + " FROM " + tb.nomeTabela + " " + Where));
    }

    public String atualizaRegistro(Tabela tb) {
        String comando = "UPDATE " + tb.nomeTabela + " SET ";
        String comandoWhere = " WHERE ";
        ArrayList<Campo> listaCampos = tb.retornaCampos();
        String valoresTabela = "";
        int tamanhoLista = listaCampos.size();
        for (Campo Icampo : listaCampos) {
            if (!Icampo.chavePrimaria) {
                valoresTabela += Icampo.nomeCampo + " = ";
                if (Icampo.valorCampo.getClass() == String.class || Icampo.valorCampo.getClass() == Character.class) {
                    valoresTabela += "'" + Icampo.valorCampo + "'";
                } else {
                    valoresTabela += Icampo.valorCampo;
                }
                if (tamanhoLista != 1) {
                    valoresTabela += ", ";
                }
            }
            tamanhoLista--;
        }
        for (Campo Icampo : listaCampos) {
            if (Icampo.chavePrimaria) {
                comandoWhere += Icampo.nomeCampo + " = " + Icampo.valorCampo.toString();
            }
        }
        BancoDAO banco = new BancoDAO();
        banco.executaComando(comando + valoresTabela + comandoWhere);
        return comando + valoresTabela + comandoWhere;
    }

    public String apagaRegistro(Tabela tb) {
        String comando = "DELETE FROM " + tb.nomeTabela + " WHERE ";
        String comandoWhere = "";
        ArrayList<Campo> listaCampos = tb.retornaCampos();
        for (Campo Icampo : listaCampos) {
            if (Icampo.chavePrimaria) {
                comandoWhere += Icampo.nomeCampo + " = " + Icampo.valorCampo.toString();
            }
        }
        String ComandoFinal = comando + comandoWhere;
        BancoDAO banco = new BancoDAO();
        banco.executaComando(ComandoFinal);
        return ComandoFinal;
    }

    public String insereRegistro(Tabela tb) {
        ArrayList<Campo> listaCampos = tb.retornaCampos();
        String Comando = "INSERT INTO " + tb.nomeTabela;

        //iniciocoletacampos
        String CamposTabela = "(";
        int tamanhoLista = listaCampos.size();
        for (Campo Icampo : listaCampos) {
            if (!Icampo.chavePrimaria) {
                CamposTabela += Icampo.nomeCampo;
                if (tamanhoLista != 1) {
                    CamposTabela += ", ";
                }
            }
            tamanhoLista--;
        }
        CamposTabela += ")";
        // fim coleta campos

        // inicio coleta valores
        String valoresTabela = " VALUES (";
        tamanhoLista = listaCampos.size();
        for (Campo Icampo : listaCampos) {
            if (!Icampo.chavePrimaria) {
                if (Icampo.valorCampo.getClass() == String.class || Icampo.valorCampo.getClass() == Character.class) {
                    valoresTabela += "'" + Icampo.valorCampo + "'";
                } else {
                    valoresTabela += Icampo.valorCampo;
                }
                if (tamanhoLista != 1) {
                    valoresTabela += ", ";
                }
            }
            tamanhoLista--;
        }
        valoresTabela += ")";
        // fim coleta valores

        BancoDAO banco = new BancoDAO();
        banco.executaComando(Comando + CamposTabela + valoresTabela);
        return Comando + CamposTabela + valoresTabela;
    }
}
