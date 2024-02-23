<%
    response.setDateHeader("Expires", -1); // Proxies.
    response.setDateHeader("Last-Modified", -1);
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0. %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" xmlns="http://www.w3.org/1999/xhtml" lang="pt" xml:lang="pt"> <!--<![endif]-->
<head>
    <title>SMS Power View</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <META http-equiv="PRAGMA" content="no-cache"/>
    <META http-equiv="CACHE-CONTROL" content="no-cache"/>
    <META http-equiv="expires" content="Thursday, 20-May-07 00:15:00 GMT"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.3.custom.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/modelo.css" type="text/css">

    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery-ui-1.10.4.custom.min.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/moment-with-langs.min.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrapv3.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/ajax.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/menus.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/funcoes.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/monitor.js"></script>

    <SCRIPT type="text/javascript">
        <!--//
        var homeSite = "<%=request.getContextPath()%>";
        var mainThread;
        var paginaAtual = 0;

        $(document).ready(function () {
            setInterval("atualizaFrameInfo()", 5000);
        });
        //-->
    </SCRIPT>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--[if lt IE 7]>
    <p class="chromeframe">O navegador que voc&ecirc; est&aacute; utilizando &eacute; antigo ou est&aacute; <strong>desatualizado</strong>. 
    Por favor <a href="http://browsehappy.com/">atualize-o</a> ou <a href="http://www.google.com/chromeframe/?redirect=true">ative o Google Chrome Frame</a> para melhorar sua experi&ecirc;cia.</p>
<![endif]-->
<div class="container">
    <header>
        <div id="barra" class="row">
            <%@ include file="includes/cabecalho.jsp" %>
        </div>
    </header>

    <!--// CONTEÚDO -->
    <div id="conteudo" class="pull-left">
        <div id="conteudo-ajax" class="pull-left">
            <div class="msgErro2 text-center" style="padding: 50px 5px; width: 100%">
                <s:property value="mensagemErro"/>
            </div>
            <div class="text-center" style="padding: 50px 5px">
                <input type="button" class="botaoExcluir"
                       onclick="location.href='<%=request.getContextPath()%>';"
                       value='<s:text name="botao.voltar"/>'/>
            </div>
        </div>
        <div id="conteudo-infor" class="pull-right">
            <%@ include file="includes/telaInfo.jsp" %>
        </div>
    </div>
    <div id="rodape" class="pull-left">&nbsp;</div>
    <!--// FIM DO CONTEÚDO -->
</div>
<div id="bg_popup" class="bg_popup"></div>
<div id="popup" class="popup"></div>

</body>
</html>