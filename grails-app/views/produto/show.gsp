
<%@ page import="Produtos.Produto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav" id="buttons">
            <span class="menuButton"><a class="but" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a><div class="razd_b"></div></span>
            <span class="menuButton"><a class="but" <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></a><div class="razd_b"></div></span>
            <span class="menuButton"><a class="but" <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></a></span>
            <span class="menuButton">
              <div class="razd_b"></div>
              <a class="but" 
                 <g:message code="default.new.label" args="[entityName]" />
                 <g:link title="Clique aqui para sair do sistema" class="exit" controller="logout">Sair</g:link>
              </a>
              
            </span>
        </div>            
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="maiuscula" class="value">${fieldValue(bean: produtoInstance, field: "descricao")}</td>
                            
                        </tr>                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.codBarras.label" default="Cod Barras" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "codBarras")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.precoVenda.label" default="Preço Venda" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "precoVenda")}</td>
                            
                        </tr>             
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.estoque.label" default="Estoque" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "estoque")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.estoqueMinimo.label" default="Estoque Mínimo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "estoqueMinimo")}</td>
                            
                        </tr>                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.ativo.label" default="Ativo" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${produtoInstance?.ativo}" /></td>
                            
                        </tr>                        
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${produtoInstance?.id}" />
                    <span class="buttons"><g:actionSubmit id="buttonUpdate" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="buttons"><g:actionSubmit id="buttonDelete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
