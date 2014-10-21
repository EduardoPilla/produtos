
<%@ page import="Produtos.SecRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
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
            <g:hasErrors bean="${secRoleInstance}">
            <div class="errors">
                <g:renderErrors bean="${secRoleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authority"><g:message code="secRole.authority.label" default="Authority" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: secRoleInstance, field: 'authority', 'errors')}">
                                    <g:textField name="authority" value="${secRoleInstance?.authority}" />
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
