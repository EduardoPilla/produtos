package Produtos

import grails.test.*

class ProdutoTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }
    
    void testConstraints(){
        mockDomain Produto
        def produto = new Produto()
        assertFalse produto.validate()
        def produto_ok = new Produto(descricao:"Coca Cola", ativo:true, estoque:10, estoqueMinimo:10)
        assertTrue produto_ok.validate()
    }
    
    void testUnicidade(){
        mockDomain Produto, []
        def produto1 = new Produto(descricao:"Fanta", ativo:true, estoque:10, estoqueMinimo:10)
        produto1.save()
        def produto2 = new Produto(descricao:"Coca Cola", ativo:true, estoque:10, estoqueMinimo:10)
        produto2.save()
    }
}