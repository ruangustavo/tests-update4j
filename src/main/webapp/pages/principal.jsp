<%@ page language="java" errorPage="" %>
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
<html class="no-js" xmlns="http://www.w3.org/1999/xhtml" lang="pt" xml:lang="pt">
<!--<![endif]-->
<head>
    <title>SMS Power View</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <META http-equiv="PRAGMA" content="no-cache"/>
    <META http-equiv="CACHE-CONTROL" content="no-cache"/>
    <META http-equiv="expires" content="Thursday, 20-May-07 00:15:00 GMT"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/imagens/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-modal.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-responsive.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ESTILO.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/usuario-mobile.css" type="text/css">

    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery-ui-1.10.4.custom.min.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/moment-with-langs.min.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrapv3.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/bootstrap-modalmanager.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-modal.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/bootstrap-paginator.min.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/aux-datepicker.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/ajax.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/menus.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/funcoes.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/monitor.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/controle.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/configuracao.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/mobile.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/telaConfiguracoesGatewayMobile.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/telaConfiguracoesWs.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/telaConfiguracoesEmailMsg.js"></script>
    <script charset="UTF-8" type="text/javascript"
            src="<%=request.getContextPath()%>/js/telaConfiguracoesMobile.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/agenda.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/FuncoesAuxiliares.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/validacaoHora.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/validacao.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/log.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/validacaoIP.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/validacaoEmail.js"></script>
    <script charset="UTF-8" type="text/javascript" src="<%=request.getContextPath()%>/js/validator.min.js"></script>

    <style type="text/css">
        /* The Modal (background) */
        .modal-cookie {
            display: none;
            position: fixed;
            z-index: 2147483647;
            bottom: 32px;
            left: 32px;
            right: 32px;
            margin: auto;
            max-width: 1334px;
            min-height: 70px;
            box-shadow: 0 2px 4px 0 rgb(0 0 0/ 40%);
            border: solid 1px #eeeeee;
            background-color: #fff;
            padding: 8px 16px;
            border-radius: 4px;
            max-width: 950px;
        }

        /* Modal Content */
        .modal-cookie-content {
            display: flex;
            margin: auto;
        }

        .button-cookies {
            /* 	background-color: white; */
            border: 2px solid #3e74a0;
            /* 	color: #3e74a0; */
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            font-weight: 700;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 8px;
            background-color: #3e74a0;
            color: white;
        }

        .cookies-text {
            font-size: 12px;
            margin-top: 5px;
        }

        @media only screen and (max-width: 620px) {
            .modal-cookie-content {
                flex-flow: column;
            }
        }

    </style>

    <SCRIPT type="text/javascript">
        <!--//
        var homeSite = "<%=request.getContextPath()%>";
        var mainThread;
        var paginaAtual = 0;
        var linguagemUI = parseInt('<s:property value="linguagemUi"/>');

        $(document).ready(function () {
            criaMenu('<%=(String)request.getSession().getAttribute("tipomenu")%>');
            setTimeout("atualizaFrameInfo()", 5000);

            var ultimaVersaoTermosUsoAlerta = '<s:property value="ultimaVersaoTermosUsoAlerta"/>';
            var usuarioAceitouUltimaVersaoTermosUso = '<s:property value="usuarioAceitouVersoesTermosUso"/>';

            var ultimaVersaoPoliticasPrivacidadeAlerta = '<s:property value="ultimaVersaoPoliticasPrivacidadeAlerta"/>';
            var usuarioAceitouUltimaVersaoPoliticasPrivacidade = '<s:property value="usuarioAceitouVersoesPoliticasPrivacidade"/>';

            var qrCodeLinkTermosPoliticasAlerta = '<s:property value="qrCodeLinkTermosPoliticasAlerta"/>';
            qrCodeLinkTermosPoliticasAlerta = 'data:image/png;base64,' + qrCodeLinkTermosPoliticasAlerta;

            $('#qrcode-termos').attr('src', qrCodeLinkTermosPoliticasAlerta);

            if (usuarioAceitouUltimaVersaoTermosUso === 'false' || usuarioAceitouUltimaVersaoPoliticasPrivacidade === 'false') {
                $('#modal-use-terms').modal({backdrop: 'static', keyboard: false});
            }

            var usuarioAceitouCookies = localStorage.getItem('acceptCookies');
            var usuarioRejeitouCookies = localStorage.getItem('rejectCookies');
            if (!usuarioAceitouCookies && !usuarioRejeitouCookies) {
                var dialogCookies = document.getElementById("modalCookies");
                // dialogCookies.style.display = "flex";
            }
        });

        var checkAcceptTermsAndAge = function () {
            var checkAge = $('#modal-use-terms #chkInformAge').prop("checked");
            var checkTerms = $('#modal-use-terms #chkAcceptTerms').prop("checked");
            $('#modal-use-terms #btnAcceptAndGoToSite').prop("disabled", !checkAge || !checkTerms);
        }

        var acceptTermsAndGoToSite = function () {
            var ultimaVersaoTermosUsoAlerta = '<s:property value="ultimaVersaoTermosUsoAlerta"/>';
            var ultimaVersaoPoliticasPrivacidadeAlerta = '<s:property value="ultimaVersaoPoliticasPrivacidadeAlerta"/>';

            $.ajax({
                type: 'GET',
                url: "mobile/aceite/documentos?versaoTermo=" + ultimaVersaoTermosUsoAlerta + "&versaoPolitica=" + ultimaVersaoPoliticasPrivacidadeAlerta,
                dataType: "json",
                contentType: 'application/json',
                success: function (data, status, request) {
                    $('#modal-use-terms').modal('hide');
                    document.location.reload(true);
                },
                error: function (request, status, thrown) {
                    $('#modal-use-terms').modal('hide');
                    document.location.reload(true);
                }
            });
        }

        var acceptAndGoToSite = function () {
            localStorage.setItem('acceptCookies', true);
            localStorage.setItem('rejectCookies', false);
            var dialogCookies = document.getElementById("modalCookies");
            dialogCookies.style.display = "none";
        }

        var rejectAndGoToSite = function () {
            localStorage.setItem('rejectCookies', true);
            localStorage.setItem('acceptCookies', false);
            var dialogCookies = document.getElementById("modalCookies");
            dialogCookies.style.display = "none";
        }
        //-->
    </SCRIPT>

    <jsp:include page='<%=(String)request.getSession().getAttribute("menu")%>' flush="true"></jsp:include>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--[if lt IE 7]>
<p class="chromeframe">O navegador que voc&ecirc; est&aacute; utilizando &eacute; antigo ou est&aacute; <strong>desatualizado</strong>.
Por favor <a href="http://browsehappy.com/">atualize-o</a> ou <a href="http://www.google.com/chromeframe/?redirect=true">ative o Google Chrome Frame</a> para melhorar sua experi&ecirc;cia.</p>
<![endif]-->

<%@ include file="includes/cabecalho.jsp" %>

<!--// CONTE?DO -->
<div id="conteudo" class="container">
    <div class="">
        <div id="conteudo-principal" class="col-md-9">
            <div id="conteudo-ajax" class=""></div>
        </div>
        <div id="conteudo-infor" class="col-md-3">
            <%@ include file="includes/telaInfo.jsp" %>
        </div>
    </div>
</div>
<div id="rodape" class="pull-left">&nbsp;</div>
<!--// FIM DO CONTE?DO -->
<div id="responsive" class="modal fade" tabindex="-1" data-width="580" style="display: none; height: 405px;">
    <%@ include file="about.jsp" %>
</div>

<div id="modal-use-terms" class="modal fade" tabindex="-1" data-width="580" style="display: none">
    <%@ include file="use-terms.jsp" %>
</div>

<div id="modalCookies" class="modal-cookie">
    <div class="modal-cookie-content">
		<span class="cookies-text">N�s usamos cookies e outras
			tecnologias semelhantes para melhorar a sua experi�ncia em nossos
			servi�os, personalizar publicidade e recomendar conte�do de seu
			interesse. Ao utilizar nossos servi�os, voc� concorda com tal
			monitoramento. Conhe�a nossa <a target="_blank"
                                            href="https://<% out.print(Optional.ofNullable(System.getenv("HOSTNAME_ALERTA24H")).orElse(System.getProperty("HOSTNAME_ALERTA24H"))); %>/politica-de-privacidade">Política de Privacidade</a>.

		</span>
        <button type="button" class="button-cookies" id="bnt_cookies" onclick="acceptAndGoToSite()">PROSSEGUIR</button>
        <button type="button" class="button-cookies" id="bnt_cookies_reject" onclick="rejectAndGoToSite()">CANCELAR
        </button>
    </div>
</div>

<div id="templ_aguarde" style="display: none">
    <div class="progress">
        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0"
             aria-valuemax="100"
             style="width: 100%">
            <s:text name="web.mensagem.aguarde"/>
        </div>
    </div>
</div>
</body>
</html>