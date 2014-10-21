package Produtos

class Telefone implements Comparable{

    static final String TIPO_CASA = 'Casa'
    static final String TIPO_CELULAR = 'Celular'
    static final String TIPO_TRABALHO = 'Trabalho'
    static final String TIPO_OUTRO = 'Outro'
    static final String TIPO_FAX_COMERCIAL = 'Fax comercial'
    static final String TIPO_FAX_RESIDENCIAL = 'Fax residencial'
    static final String TIPO_PERSONALIZADO = 'Personalizado'
    static final String TIPO_PAGER = 'Pager'
    static final String TIPO_EMPRESA = 'Empresa'
    static final String TIPO_ASSISTENTE = 'Assistente'
    static final String TIPO_CALLBACK = 'Callback'
    static final String TIPO_CARRO = 'Carro'
    static final String TIPO_ISDN = 'ISDN'
    static final String TIPO_PRINCIPAL = 'Principal'
    static final String TIPO_MMS = 'MMS'
    static final String TIPO_OUTRO_FAX = 'Outro fax'
    static final String TIPO_RADIO = 'Rádio'
    static final String TIPO_TELEX = 'Telex'
    static final String TIPO_TTY_TDD = 'TTY TDD'
    static final String TIPO_CELULAR_COMERCIAL = 'Celular comercial'
    static final String TIPO_PAGER_COMERCIAL = 'Pager comercial'

    String tipo
    String tipoPersonalizado
    String numero
    Integer sequencia = 0
    Boolean padrao = false

    static belongsTo = [pessoa:Pessoa]

    static constraints = {
        tipo(inList:[TIPO_CASA, TIPO_CELULAR, TIPO_TRABALHO, TIPO_OUTRO, TIPO_FAX_COMERCIAL, TIPO_FAX_RESIDENCIAL, TIPO_PERSONALIZADO, TIPO_PAGER, TIPO_EMPRESA, TIPO_ASSISTENTE, TIPO_CALLBACK, TIPO_CARRO, TIPO_ISDN, TIPO_PRINCIPAL, TIPO_MMS, TIPO_OUTRO_FAX, TIPO_RADIO, TIPO_TELEX, TIPO_TTY_TDD, TIPO_CELULAR_COMERCIAL, TIPO_PAGER_COMERCIAL])
        tipoPersonalizado(nullable:true, validator: { val, obj -> if(!val && obj.tipo == TIPO_PERSONALIZADO) return "telefone.tipoPersonalizado.blank" })
        numero(size:0..50)
    }

    def beforeInsert() {
        if(pessoa) {
            this.updatePadrao()
            Integer seq = Email.executeQuery('select max(e.sequencia) from Telefone e where e.pessoa = :pessoa',[pessoa:pessoa])[0] ?: 0
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
            def telefonePadrao = Telefone.findByPessoaAndPadrao(pessoa, true)
            if(telefonePadrao) {
                telefonePadrao.padrao = false
                telefonePadrao.save()
            }
        }
    }

    String toString() {
        String resTipo = (tipo == TIPO_PERSONALIZADO ? tipoPersonalizado : tipo)
        "$resTipo: $numero ${padrao?'(principal)':''}"
    }

    int compareTo(obj) {
        (this.sequencia+'/'+this.id).compareTo(obj.sequencia+'/'+obj.id)
    }
}
