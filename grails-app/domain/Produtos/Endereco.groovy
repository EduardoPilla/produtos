package Produtos

class Endereco implements Comparable{
    static final String TIPO_CASA = "Residencial"
    static final String TIPO_TRABALHO = "Comercial"
    static final String TIPO_OUTRO = "Outros"
    static final String TIPO_PERSONALIZADO = "Personalizado"

    static final String ESTADO_AC = "AC"
    static final String ESTADO_AL = "AL"
    static final String ESTADO_AP = "AP"
    static final String ESTADO_AM = "AM"
    static final String ESTADO_BA = "BA"
    static final String ESTADO_CE = "CE"
    static final String ESTADO_DF = "DF"
    static final String ESTADO_ES = "ES"
    static final String ESTADO_GO = "GO"
    static final String ESTADO_MA = "MA"
    static final String ESTADO_MT = "MT"
    static final String ESTADO_MS = "MS"
    static final String ESTADO_MG = "MG"
    static final String ESTADO_PA = "PA"
    static final String ESTADO_PB = "PB"
    static final String ESTADO_PR = "PR"
    static final String ESTADO_PE = "PE"
    static final String ESTADO_PI = "PI"
    static final String ESTADO_RJ = "RJ"
    static final String ESTADO_RN = "RN"
    static final String ESTADO_RS = "RS"
    static final String ESTADO_RO = "RO"
    static final String ESTADO_RR = "RR"
    static final String ESTADO_SC = "SC"
    static final String ESTADO_SP = "SP"
    static final String ESTADO_SE = "SE"
    static final String ESTADO_TO = "TO"

    String tipo
    String tipoPersonalizado
    String logradouro
    String numero
    String complemento
    String bairro
    String cep
    String cidade
    String estado
    Integer sequencia = 0
    Boolean padrao = false

    static belongsTo = [pessoa:Pessoa]

    static constraints = {
        tipo inList:[TIPO_CASA, TIPO_TRABALHO, TIPO_OUTRO]
        tipoPersonalizado nullable:true, validator:{ val, obj -> if(!val && obj.tipo == TIPO_PERSONALIZADO) return ['blank'] }
        logradouro size:0..100
        numero size:0..10
        complemento size:0..50
        bairro size:0..50
        cep size:0..8
        cidade size:0..50
        estado inList:[ESTADO_AC,ESTADO_AL,ESTADO_AP,ESTADO_AM,ESTADO_BA,ESTADO_CE,ESTADO_DF,ESTADO_ES,ESTADO_GO,ESTADO_MA,ESTADO_MT,ESTADO_MS,ESTADO_MG,ESTADO_PA,ESTADO_PB,ESTADO_PR,ESTADO_PE,ESTADO_PI,ESTADO_RJ,ESTADO_RN,ESTADO_RS,ESTADO_RO,ESTADO_RR,ESTADO_SC,ESTADO_SP,ESTADO_SE,ESTADO_TO]
    }

    def beforeInsert() {
        if(pessoa) {
            this.updatePadrao()
            Integer seq = Email.executeQuery('select max(e.sequencia) from Endereco e where e.pessoa = :pessoa',[pessoa:pessoa])[0] ?: 0
            sequencia = seq + 1
        }
    }

    def beforeUpdate() {
        if(pessoa) {
            this.updatePadrao()
        }
    }

    void updatePadrao() {
        if(this.padrao) {
            def endPadrao = Endereco.findByPessoaAndPadrao(pessoa, true)
            if(endPadrao) {
                endPadrao.padrao = false
                endPadrao.save()
            }
        }
    }

    String toString() {
        String resTipo = (tipo == TIPO_PERSONALIZADO ? tipoPersonalizado : tipo)
        "$resTipo: $logradouro $numero - $cidade-$estado ${padrao?'(principal)':''}"
    }

    int compareTo(obj) {
        (this.sequencia+'/'+this.id).compareTo(obj.sequencia+'/'+obj.id)
    }
}