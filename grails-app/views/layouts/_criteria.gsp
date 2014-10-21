<style type="text/css">
  .criteriatable{
    border:none;
    margin:0px;
    padding:0px;
  }
</style>
<div class="criteria">
      <g:form method="get" action="${action ?: 'list'}">
        <table class="criteriatable">
          <tr class="prop">
            <g:if test="${filtro.contains('busca')}">
              <td class="value">
                <div>Buscar:</div>
                <g:textField class="maiuscula" name="q" value="${params.q}"/>
              </td>
            </g:if>

<!--            <g:if test="${filtro.contains('produto')}">
              <td class="value">
                <div>Produto:</div>
                <g:selectHierarquico style="width:100%" from="${produto.Produto.list()}" optionKey="id" name="l" value="${params.q}"/>
              </td>
            </g:if>-->
          
            <g:if test="${filtro.contains('ativo')}">
              <td class="value" style="width: 100px">
                <div>Apenas Ativo:</div>
                  <select name="ativo">
                    <option value="true">Sim       </option>
                    <option value="false">Não</option>
                  </select>
              </td>
            </g:if>
           
            <td style="width:10%; max-width: 100px">
              <div>&nbsp;</div>
              <input style="width:80%" type="submit" value=" Ir "/>
            </td>
        </tr>
        </table>
      </g:form>
    </div>