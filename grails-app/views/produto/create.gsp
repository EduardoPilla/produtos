
<%@ page import="Produtos.Produto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />       
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="buttons">         
            <span class="buttons"><a class="but" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a><div class="razd_b"></div></span> 
            <span class="buttons"><a class="but"  <g:link  class="list" action="list"><g:message  code="default.list.label" args="[entityName]" /></g:link></a></span>                 
            <span class="menuButton">
              <div class="razd_b"></div>
              <a class="but" 
                 <g:message code="default.new.label" args="[entityName]" />
                 <g:link title="Clique aqui para sair do sistema" class="exit" controller="logout">Sair</g:link>
              </a>
              
            </span>
        </div>            
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${produtoInstance}">
            <div class="errors">
                <g:renderErrors bean="${produtoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao"><g:message code="produto.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'descricao', 'errors')}">
                                    <g:textField class="maiuscula" name="descricao" value="${produtoInstance?.descricao}" />
                                </td>
                            </tr>
                                               
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codBarras"><g:message code="produto.codBarras.label" default="Cod Barras" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'codBarras', 'errors')}">
                                    <g:textField name="codBarras" value="${produtoInstance?.codBarras}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="precoVenda"><g:message code="produto.precoVenda.label" default="Preço Venda" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'precoVenda', 'errors')}">
                                    <g:textField name="precoVenda" value="${produtoInstance?.precoVenda}" />
                                </td>
                            </tr>           
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estoque"><g:message code="produto.estoque.label" default="Estoque" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'estoque', 'errors')}">
                                    <g:textField name="estoque" value="${produtoInstance?.estoque}" />
                                </td>
                            </tr>    
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estoqueMinimo"><g:message code="produto.estoqueMinimo.label" default="Estoque Mínimo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'estoqueMinimo', 'errors')}">
                                    <g:textField name="estoqueMinimo" value="${produtoInstance?.estoqueMinimo}" />
                                </td>
                            </tr>                 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ativo"><g:message code="produto.ativo.label" default="Ativo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'ativo', 'errors')}">
                                    <g:checkBox name="ativo" value="${produtoInstance?.ativo}" />
                                </td>
                            </tr>                            
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="buttons"><g:submitButton name="create" id="buttonSave" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
