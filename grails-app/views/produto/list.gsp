
<%@ page import="Produtos.Produto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'styles.css')}" />
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="buttons">
            <span class="menuButton"><a class="but" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a><div class="razd_b"></div></span>
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
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <g:render template="/layouts/criteria" model="[filtro:['busca', 'ativo']]"/> 

<!--           <div class="criteria">
              <table class="criteriatable">
                <tr class="prop">
                <g:form method="get" action="list">

                  <td class="value">
                     <div>Buscar(Descrição/Cód Barras):</div>
                     <g:textField  class="maiuscula" name="q" value="${params.q}"/>
                  </td>
                  
                  <td class="value">
                     <div>Filtra Ativo Sim/Não:</div>
                     <g:checkBox  name="q" value="${params.q}"/>
                  </td>
                  
                  <td class="value">
                      <div>&nbsp;</div>
                      <g:submitButton name="ir" value="Pesquisar" />
                  </td>
                </g:form>
            </div>   -->
            

            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'produto.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'produto.descricao.label', default: 'Descricao')}" />
                        
                            <g:sortableColumn property="ativo" title="${message(code: 'produto.ativo.label', default: 'Ativo')}" />
                        
                            <g:sortableColumn property="codBarras" title="${message(code: 'produto.codBarras.label', default: 'Cod Barras')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${produtoInstanceList}" status="i" var="produtoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${produtoInstance.id}">${fieldValue(bean: produtoInstance, field: "id")}</g:link></td>
                        
                            <td class="maiuscula">${fieldValue(bean: produtoInstance, field: "descricao")}</td>
                        
                            <td><g:formatBoolean boolean="${produtoInstance.ativo}" /></td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "codBarras")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${produtoInstanceTotal}"/>
<!--                params="[l:params.l, q:params.q, from:params.from, to:params.to]"-->
            </div>
        </div>
      

    </body>
</html>
