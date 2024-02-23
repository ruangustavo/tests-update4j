<%@ page import="java.util.Optional" %>
<% String HOSTNAME_ALERTA24H = Optional.ofNullable(System.getenv("HOSTNAME_ALERTA24H")).orElse(System.getProperty("HOSTNAME_ALERTA24H")); %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <META http-equiv="PRAGMA" content="no-cache"/>
    <META http-equiv="CACHE-CONTROL" content="no-cache"/>
    <META http-equiv="expires" content="Thursday, 20-May-07 00:15:00 GMT"/>

    <link rel="shortcut icon" href="<%=request.getContextPath()%>/imagens/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-responsive.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ESTILO.css" type="text/css">
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery-ui-1.10.4.custom.min.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/moment-with-langs.min.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrapv3.js"></script>
    <script>
        function encode(f) {
            if (f["configuracoes.senha"].value != "") {
                f["configuracoes.senha"].value = btoa(f["configuracoes.senha"].value);
            }
            return true;
        }
    </script>
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<div class="container">

    <header>
        <div class="row">
            <div class="col-md-12 headerLogin">
                <div class="text-center">
                    <a href="https://www.sms.com.br" target="_blank"><img class="logoSMS" style="margin-left: 0px"/></a>
                    <a href="https://<% out.print(HOSTNAME_ALERTA24H); %>" target="_blank"><img class="logoLegrand" /></a>
                </div>
            </div>
        </div>
    </header>

    <section class="content">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">

                <div class="panel" style="margin-top: 20px;">
                    <h1>LOGIN</h1>

                    <div style="width: 100%; padding: 10px;">
                        <s:if test="mensagemErro != null && mensagemErro != \"\" ">
                            <div id="msgErro" class="msgErro">
                                <br>
                                <s:property value="mensagemErro"/>
                            </div>
                            <br>
                        </s:if>
                        <form action="<%=request.getContextPath()%>/s2/checaSenha.action" class="formulario"
                              method="POST"
                              onSubmit="return encode(this);">
                            <p><label for="senha" style="cursor: pointer"><s:text name="configuracoes.senha"/></label>
                                <s:password name="configuracoes.senha" id="senha" size="10" showPassword="false"
                                            cssClass="form-control form-senha" tabindex="0"/>
                            <div class="text-center"><input type="submit" value="<s:text name="botao.login"/>"
                                                            class="btn btn-primary"></div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <footer>
        <div class="row">
            <div class="col-md-12 text-center">&nbsp;</div>
        </div>
    </footer>

</div>

</body>
</html>
