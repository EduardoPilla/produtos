
<%@ page import="Produtos.SecRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'secRole.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="authority" title="${message(code: 'secRole.authority.label', default: 'Authority')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${secRoleInstanceList}" status="i" var="secRoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${secRoleInstance.id}">${fieldValue(bean: secRoleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: secRoleInstance, field: "authority")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${secRoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
