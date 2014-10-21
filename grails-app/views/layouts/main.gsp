<html>
    <head>
        <title><g:layoutTitle default="Produto" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'styles.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'big_img.jpg')}" type="image/x-icon" />
        <g:javascript src="jquery/jquery-1.4.3.min.js" />
        <g:javascript src="jquery/jquery-1.4.mim.js"/>
        <g:javascript src="jquery/jquery.field_selection.js" />
        <g:javascript src="jquery/jquery.select.js" />
        <g:javascript src="ui/jquery.ui.core.min.js"/>
        <g:javascript src="ui/jquery.ui.widget.min.js"/>
        <g:javascript src="ui/jquery.ui.datepicker.min.js"/>
        <g:javascript src="jquery/jquery.maskedinput-1.2.2.min.js"/>
        <g:javascript src="main.js" />
        <g:javascript src="util.js" />
        <g:layoutHead /> 
    </head>
    <body>
      <div id="main">
        <div id="spinner" class="spinner" style="display: none">
           <img src="${resource(dir:'images',file:'spinner.gif')}" alt="" />
           <img src="${resource(dir:'images',file:'carregando.png')}" alt="Carregando..." />
        </div>
        <div title="Controle de Produtos" id="grailsLogo" class="logo"><a href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'big_img.jpg')}" alt="BRvida" border="0" /></a></div>
        <!--<div style="float:left; margin-top:64px; font-size: 12pt; font-style: italic">v. <g:meta name="app.version" />  </div>-->
      
        <div style="clear:both"/>
        <g:layoutBody />
        <div style="clear:both"/>
        
        <div class="rodape" id="footer">
          <noscript>
             <p><h1>Seu navegador não suporta JavaScript, ou ele está desativado.</h1></p>
          </noscript>
          Produtos v.<g:meta name="app.version" />. Desenvolvido por <a href="http://www.clicksistemas.com.br/" target="_blank">Click Sistemas Ltda</a>
        </div>
      </div>
    </body>
</html>