package Produtos

import grails.plugins.springsecurity.Secured



class ProdutoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.q = params.q ?: ''
       
        def query = ' from Produto p where (p.codBarras like :q or upper(p.descricao) like :q)  '                
        def map = [q:'%'+params.q+'%']        
        
        if ( params.ativo == 'true' || params.ativo == null) {
                query += 'and p.ativo = :ativo'
                map.ativo = true
        }   

        def total = Produto.executeQuery('select count(*) ' + query, map)[0]

        if(params.sort) {
                query += " order by $params.sort " + params.order?:""
        }        
        
        def list = Produto.findAll(query, map, params)   
        
        [produtoInstanceList: list, produtoInstanceTotal: total]
    }
    
    @Secured(['ROLE_ADMIN']) 
    def create = {
        def produtoInstance = new Produto()
        produtoInstance.properties = params
        return [produtoInstance: produtoInstance]
    }
     
    @Secured(['ROLE_ADMIN']) 
    def save = {
        def produtoInstance = new Produto(params)
        if (produtoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'produto.label', default: 'Produto'), produtoInstance.id])}"
            redirect(action: "show", id: produtoInstance.id)
        }
        else {
            render(view: "create", model: [produtoInstance: produtoInstance])
        }
    }

    def show = {
        def produtoInstance = Produto.get(params.id)
        if (!produtoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'produto.label', default: 'Produto'), params.id])}"
            redirect(action: "list")
        }
        else {
            [produtoInstance: produtoInstance]
        }
    }

    @Secured(['ROLE_ADMIN'])  
    def edit = {
        def produtoInstance = Produto.get(params.id)
        if (!produtoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'produto.label', default: 'Produto'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [produtoInstance: produtoInstance]
        }
    }

    def update = {
        def produtoInstance = Produto.get(params.id)
        if (produtoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (produtoInstance.version > version) {
                    
                    produtoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'produto.label', default: 'Produto')] as Object[], "Another user has updated this Produto while you were editing")
                    render(view: "edit", model: [produtoInstance: produtoInstance])
                    return
                }
            }
            produtoInstance.properties = params
            if (!produtoInstance.hasErrors() && produtoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'produto.label', default: 'Produto'), produtoInstance.id])}"
                redirect(action: "show", id: produtoInstance.id)
            }
            else {
                render(view: "edit", model: [produtoInstance: produtoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'produto.label', default: 'Produto'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def produtoInstance = Produto.get(params.id)
        if (produtoInstance) {
            try {
                produtoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'produto.label', default: 'Produto'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'produto.label', default: 'Produto'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'produto.label', default: 'Produto'), params.id])}"
            redirect(action: "list")
        }
    }
}
