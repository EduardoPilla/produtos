package Produtos

class Produto {
    
    String descricao
    String codBarras
    Boolean ativo
    Double precoVenda
    Double estoque
    Double estoqueMinimo
    
    static constraints = {
        descricao(nullable:false, blank:false)
        ativo (nullable:false, blank:false)
        estoque (nullable:false, blank:false)
        estoqueMinimo (nullable:false, blank:false)
    }
    
    def beforeInsert() {
        ativo = true
    }        
    
    String toString(){
        descricao
    }    
}