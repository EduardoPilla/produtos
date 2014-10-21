package Produtos

class Pessoa {

    String descricao
    String observacao

    Date dateCreated
    Date lastUpdated

    SortedSet enderecos
    SortedSet telefones
    SortedSet emails
    SortedSet contasBancarias

    static hasMany = [enderecos:Endereco, telefones:Telefone]

    static constraints = {
        descricao nullable:true, blank:true
        observacao nullable:true, size:0..500
    }      
}
