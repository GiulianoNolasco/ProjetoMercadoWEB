package UTIL;

public class Campo<E> {

    public String nomeCampo;
    public E valorCampo;
    public boolean chavePrimaria = false;
    public String apelidoCampo;

    public Campo() {
    }

    public Campo(String nomeCampo) { //String apelido
        this.nomeCampo = nomeCampo;
    }

    public Campo(String nomeCampo, String apelidoCampo) { //String apelido
        this.nomeCampo = nomeCampo;
        this.apelidoCampo = apelidoCampo;
    }

    public Campo(String nomeCampo, boolean chavePrimaria) { //String apelido
        this.chavePrimaria = chavePrimaria;
        this.nomeCampo = nomeCampo;
    }

    public Campo(String nomeCampo, String apelidoCampo, boolean chavePrimaria) { //String apelido
        this.chavePrimaria = chavePrimaria;
        this.nomeCampo = nomeCampo;
        this.apelidoCampo = apelidoCampo;
    }
}
