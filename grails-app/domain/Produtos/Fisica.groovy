package Produtos

class Fisica extends Pessoa {

    static final String ESTADO_CIVIL_SOLTEIRO = "Solteiro"
    static final String ESTADO_CIVIL_CASADO = "Casado"
    static final String ESTADO_CIVIL_SEPARADO = "Separado judicialmente"
    static final String ESTADO_CIVIL_DIVORCIADO = "Divorciado"
    static final String ESTADO_CIVIL_VIUVO = "Viúvo"

    static final String SEXO_MASCULINO = "M"
    static final String SEXO_FEMININO = "F"

    String nome
    String cpf
    String rg
    String orgaoEmissorRg
    String ufRg
    Date dataNascimento    
    String estadoCivil
    String sexo
    
    static constraints = {
        nome blank:false, size:1..100
        cpf(cpf:true)
        cpf unique:true
        cpf nullable:true
        rg nullable:true, size:0..50
        orgaoEmissorRg nullable:true, size:0..50
        ufRg nullable:true, size:0..2
        dataNascimento nullable:true

        estadoCivil nullable:true, inList:["",ESTADO_CIVIL_SOLTEIRO, ESTADO_CIVIL_CASADO, ESTADO_CIVIL_SEPARADO, ESTADO_CIVIL_DIVORCIADO, ESTADO_CIVIL_VIUVO]
        sexo nullable:true, inList:["",SEXO_MASCULINO, SEXO_FEMININO]
        

    }

    String toString() {
        nome
    }
}