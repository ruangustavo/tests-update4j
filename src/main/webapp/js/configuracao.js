// ###################################### CONFIGURACOES GERAL #########################################
function configGeral() {
    incluirPagina("/editarTelaConfiguracoes.action", "conteudo-ajax", null, "limparThread();", null);
}


function validaSenhaPadrao(senha, confirmacaoSenha) {
    var regex = /^(?=.*\d)(?=.*[!#$%'()+-./:?@\[\]\\^_`{}~])(?=.*[a-z])(?=.*[A-Z])/

    if (senha == "") {
        alert(validacaoSenha_InformeASenha);
        return false;
    } else if (confirmacaoSenha == "") {
        alert(validacaoSenha_ConfirmeASenha);
        return false;
    } else if (senha != confirmacaoSenha) {
        alert(validacaoSenha_SenhasNãoCoincidem);
        return false;
    }

    if (senha.length < 8 || !regex.test(senha) || senha.includes(",")) {
        alert(validacaoSenha_SenhaInvalida);
        return false;
    }
    return true;
}

function salvarConfiguracoes(f) {
    f.senha.value = $.trim(f.senha.value);
    f.confSenha.value = $.trim(f.confSenha.value);

    if (f.senha.value != "" || f.confSenha.value != "") {
        if (!validaSenhaPadrao(f.senha.value, f.confSenha.value)) {
            return false;
        }

        f.senha.value = btoa(f.senha.value);
    }

    var deployName = f.deployName.value.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
    deployName = deployName.replace("´", "").replace("^", "").replace("`", "").replace("~", "");
    f.deployName.value = deployName;

    if (hasSerial()) {
        if (!isSerialValido()) {
            alert(msgCampoSerialInvalido);
            $("#serial").focus();
            return;
        }
    } else {
        alert(msgCampoSerialVazio);
        $("#serial").focus();
        return;
    }

    var dados = $(f).serialize();

    incluirPagina("/salvarTelaConfiguracoesGeral.action", "conteudo-ajax", dados, "limparThread();", null);
}

//###################################### CONFIGURACOES POPUP #########################################

function configPopup() {
    incluirPagina("/editarTelaConfiguracoesPopup.action", "conteudo-ajax", null, "limparThread();updatePopupForm();", null);
}

function updateFrequencia() {
    var popupOn = $("#popUpHabilitado").is(":checked");
    var tmpPopup = $("#tempoFrequenciaPopup");
    tmpPopup.prop("disabled", !popupOn);
}

function updatePopupForm() {
    var popupOn = $("#popUpHabilitado").is(":checked");
    var tmpPopup = $("#tempoFrequenciaPopup");
    tmpPopup.prop("disabled", !popupOn);
}

function salvarConfiguracoesPopup(f) {
    var dados = $(f).serialize() + "&cache=" + (new Date()).getTime() + getDisableInput(f.id);
    incluirPagina("/salvarTelaConfiguracoesPopup.action", "conteudo-ajax", dados, "limparThread();updateFrequencia();", null);
    setTimeout(function () {
        updatePopupForm();
    }, 1000);
}

function getDisableInput(form_id) {
    var input = $("#" + form_id + " input:disabled");
    var result = '';
    $.each(input, function (key, val) {
        result += "&" + val.name + '=' + val.value;
    });
    return result;
}

//###################################### CONFIGURACOES BROADCAST #########################################

function configBroadcast() {
    incluirPagina("/editarTelaConfiguracoesBroadcast.action", "conteudo-ajax", null, "limparThread();", null);
}

function listarMensagensBroadcast() {
    incluirPagina("/configuracaoEmailMsg.action", "conteudo-ajax", null, "limparThread();", null);
}

function telaTesteEmail(f) {
    if (validaTesteEmail(f)) {
        var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
        incluirPagina("/telaTesteEmail.action", "conteudo-ajax", dados, "limparThread();", null);
    }
}

function efetuarEnvioTesteEmail(f) {
    var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
    if (validaEnvioTesteEmail(f)) {
        incluirPagina("/enviarTesteEmail.action", "conteudo-ajax", dados, "limparThread();", null);
    }
}

function callEditarMensagemAction(tipo) {
    var dados = "tipo=" + tipo + "&cache=" + (new Date()).getTime();
    incluirPagina("/editarMensagem.action", "conteudo-ajax", dados, "limparThread();", null);
}

function salvarConfiguracoesBroadcast(f) {
    if (validaConfiguracoesBroadcast(f)) {
        f.senhaSMTP.value = btoa(f.senhaSMTP.value);
        var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
        incluirPagina("/salvarTelaConfiguracoesBroadcast.action", "conteudo-ajax", dados, "limparThread();", null);
    }
}

function validaConfiguracoesBroadcast(telaConfiguracoesForm) {

    if (telaConfiguracoesForm.emailHabilitado.checked) {

        if (telaConfiguracoesForm.servidorEmail.value == "") {
            window.alert(msgConfigBroadcastCampoServidorEmail);
            telaConfiguracoesForm.servidorEmail.focus();
            return false;
        }
        if (telaConfiguracoesForm.remetenteEmail.value == "") {
            window.alert(msgConfigBroadcastCampoRemetenteEmail);
            telaConfiguracoesForm.remetenteEmail.focus();
            return false;
        }
        if (telaConfiguracoesForm.usuarioSMTP.value == "") {
            window.alert(msgConfigBroadcastCampoUsuarioSMTP);
            telaConfiguracoesForm.usuarioSMTP.focus();
            return false;
        }
        if (telaConfiguracoesForm.senhaSMTP.value == "") {
            window.alert(msgConfigBroadcastCampoSenhaSMTP);
            telaConfiguracoesForm.senhaSMTP.focus();
            return false;
        }
        if (telaConfiguracoesForm.portaSMTP.value == "") {
            window.alert(msgConfigBroadcastCampoPortaSMTP);
            telaConfiguracoesForm.portaSMTP.focus();
            return false;
        }

        var reEmail = /^[\w-]+(\.[\w-]+)*@(([A-Za-z\d][A-Za-z\d-]{0,61}[A-Za-z\d]\.)+[A-Za-z]{2,6}|\[\d{1,3}(\.\d{1,3}){3}\])$/;

        if (!reEmail.test(telaConfiguracoesForm.remetenteEmail.value)) {
            window.alert(msgConfigBroadcastCampoRemetenteEmail);
            telaConfiguracoesForm.remetenteEmail.focus();
            return false;
        }
    }

    return true;
}

function validaTesteEmail(telaConfiguracoesForm) {

    if (telaConfiguracoesForm.emailHabilitado.checked) {

        if (telaConfiguracoesForm.servidorEmail.value == "") {
            window.alert(msgConfigBroadcastCampoServidorEmail);
            telaConfiguracoesForm.servidorEmail.focus();
            return false;
        }
        if (telaConfiguracoesForm.remetenteEmail.value == "") {
            window.alert(msgConfigBroadcastCampoRemetenteEmail);
            telaConfiguracoesForm.remetenteEmail.focus();
            return false;
        }
        if (telaConfiguracoesForm.usuarioSMTP.value == "") {
            window.alert(msgConfigBroadcastCampoUsuarioSMTP);
            telaConfiguracoesForm.usuarioSMTP.focus();
            return false;
        }

        var reEmail = /^[\w-]+(\.[\w-]+)*@(([A-Za-z\d][A-Za-z\d-]{0,61}[A-Za-z\d]\.)+[A-Za-z]{2,6}|\[\d{1,3}(\.\d{1,3}){3}\])$/;

        if (!reEmail.test(telaConfiguracoesForm.remetenteEmail.value)) {
            window.alert(msgConfigBroadcastCampoRemetenteEmail);
            telaConfiguracoesForm.remetenteEmail.focus();
            return false;
        }

        return true;
    } else {
        window.alert(msgConfigTesteEmailCheck);
    }

    return false;
}

function validaEnvioTesteEmail(telaConfiguracoesForm) {
    var reEmail = /^[\w-]+(\.[\w-]+)*@(([A-Za-z\d][A-Za-z\d-]{0,61}[A-Za-z\d]\.)+[A-Za-z]{2,6}|\[\d{1,3}(\.\d{1,3}){3}\])$/;
    if (!reEmail.test(telaConfiguracoesForm.destinatarioEmail.value)) {
        window.alert(msgConfigBroadcastCampoRemetenteEmail);
        telaConfiguracoesForm.destinatarioEmail.focus();
        return false;
    }
    return true;
}

function salvarConfiguracoesMensagensBroadcast(f) {

    if (validaConfiguracoesMensagemBroadcast(f)) {
        var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();

        incluirPagina("/salvarMensagem.action", "conteudo-ajax", dados, "limparThread();", null);
    }
}

function validaConfiguracoesMensagemBroadcast(telaConfiguracoesForm) {

    if (telaConfiguracoesForm.descricao.value == "") {
        window.alert(msgConfigMsgBroadcastCampoDescricao);
        telaConfiguracoesForm.descricao.focus();
        return false;
    }

    if (telaConfiguracoesForm.emailDestinatario.value == "") {
        window.alert(msgConfigMsgBroadcastCampoEmail);
        telaConfiguracoesForm.emailDestinatario.focus();
        return false;
    }

    var reEmail = /^[\w-]+(\.[\w-]+)*@(([A-Za-z\d][A-Za-z\d-]{0,61}[A-Za-z\d]\.)+[A-Za-z]{2,6}|\[\d{1,3}(\.\d{1,3}){3}\])$/;

    if (!reEmail.test(telaConfiguracoesForm.emailDestinatario.value)) {
        window.alert(msgConfigMsgBroadcastEmailInvalido);
        telaConfiguracoesForm.emailDestinatario.focus();
        return false;
    } else
        return true;
}

//###################################### CONFIGURACOES SHUTDOWN #########################################

function configShutdown() {
    incluirPagina("/editarTelaConfiguracoesShutdown.action", "conteudo-ajax", null, "limparThread();", null);
}

function salvarConfiguracoesShutdown(f) {
    if (f == null) {
        f = $('#telaConfiguracoesForm')[0];
    }

    var isShutdownHabilitado = document.getElementById('shutdownHabilitado').checked;
    var isShutdownHabilitadoUps = document.getElementById('shutdownHabilitadoUps').checked;
    var tempoShutdownUps = $('#tempoSequenciaShutdown').val();
    var tempoBateriaBaixa = $('#tempoBateriaBaixa').val();

    if ((isShutdownHabilitado && $('#tempoShutdownFalhaAC').val() == "") ||
        (isShutdownHabilitadoUps && tempoShutdownUps == "") ||
        (isShutdownHabilitadoUps && tempoBateriaBaixa == "") ||
        ($('#tempoFrequenciaPopup').val() == "")) {
        window.alert(msgConfigShutdownErro);
    } else if (isShutdownHabilitadoUps && (Number(tempoShutdownUps) > 10)) {
        $('#tempoSequenciaShutdown').val("10");
        window.alert(msgConfigShutdownUpsMax10Min);
    } else {
        var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
        incluirPagina("/salvarTelaConfiguracoesShutdown.action", "conteudo-ajax", dados, "limparThread();", null);
    }
}

function redirectConfig() {
    incluirPagina("/editarTelaConfiguracoes.action", "conteudo-ajax", null, "limparThreadConexao();", null);
}

//###################################### CONFIGURACOES ALERTA 24H #########################################
// AS DEMAIS FUNÇÕES ESTÃO NO ARQUIVO telaConfiguracoesWs.js
function configAlerta24h() {
    incluirPagina("/configuracoesAlerta.action", "conteudo-ajax", null, "limparThreadConexao();", null);
}

//###################################### CONFIGURACOES GatewayMobile #########################################
// AS DEMAIS FUNÇÕES ESTÃO NO ARQUIVO telaConfiguracoesGatewayMobile.js
function configGatewayMobile() {
    incluirPagina("/configuracoesGatewayMobile.action", "conteudo-ajax", null, "limparThreadConexao();", null);
}

//###################################### CONFIGURACOES INTERNET (PROXY) #########################################
function configInternet() {
    ativaSubMenu($("#smopcoesinternet a")[0]);
    incluirPagina("/configuracoesProxy.action", "conteudo-ajax", null, "iniciaFormProxy();", null);
}

function iniciaFormProxy() {
    limparThread();
    var f = document.telaConfiguracoesForm;
    f.ipProxy.disabled = f.portaProxy.disabled = f.autenticadoProxy.disabled = !f.habilitadoProxy.checked;
    f.userProxy.disabled = f.passProxy.disabled = !f.autenticadoProxy.checked;
}

function habilitaProxy(obj) {
    var f = obj.form;
    f.ipProxy.disabled = f.portaProxy.disabled = f.autenticadoProxy.disabled = f.userProxy.disabled = f.passProxy.disabled = !obj.checked;
    if (!obj.checked) {
        f.ipProxy.value = "";
        f.portaProxy.value = "";
        f.userProxy.value = "";
        f.passProxy.value = "";
        f.autenticadoProxy.checked = false;
    }
    habilitaUserProxy(f.autenticadoProxy);
}

function habilitaShutdown(obj) {
    var f = obj.form;

    f.tempoShutdownFalhaAC.disabled = !obj.checked;
    f.shutdownHabilitadoUps.disabled = !obj.checked;

    if (f.shutdownHabilitado.checked && f.shutdownHabilitadoUps.checked) {
        f.tempoSequenciaShutdown.disabled = false;
    } else {
        f.shutdownHabilitadoUps.checked = false;
        f.tempoSequenciaShutdown.disabled = true;
    }
}

function habilitaShutdownUps(obj) {
    var f = obj.form;
    f.tempoSequenciaShutdown.disabled = !obj.checked;
}

function habilitaShutdownBateriaBaixa(obj) {
    var f = obj.form;
    f.tempoShutdownBateriaBaixa.disabled = !obj.checked;
}

function habilitaUserProxy(obj) {
    var f = obj.form;
    f.userProxy.disabled = f.passProxy.disabled = !obj.checked;
    if (!obj.checked) {
        f.userProxy.value = "";
        f.passProxy.value = "";
    }
}

function salvarFormProxy(f) {
    if (!validaFormProxy(f))
        return;
    f.passProxy.value = btoa(f.passProxy.value);
    var dados = $(f).serialize();
    incluirPagina("/salvarConfiguracoesProxy.action", "conteudo-ajax", dados, "iniciaFormProxy();", null);

}

function validaFormProxy(f) {

    if ($("#habilitadoProxy").prop("checked")) {
        $("#ipProxy").val($.trim($("#ipProxy").val()));
        if ($("#ipProxy").val() == "") {
            alert(cfgIpProxyObrig);
            $("#ipProxy").focus();
            return false;
        } else if (!CheckIP($("#ipProxy").val())) {
            alert(cfgIpProxyInvalido);
            $("#ipProxy").focus();
            return false;
        }

        if ($("#portaProxy").val() == "") {
            alert(cfgPortaProxyObrig);
            $("#portaProxy").focus();
            return false;
        } else if (!IsStrNum($("#portaProxy").val())) {
            alert(cfgPortaProxyInvalida);
            $("#portaProxy").focus();
            return false;
        }
        if ($("#autenticadoProxy").prop("checked")) {
            if ($.trim($("#userProxy").val()) == "") {
                alert(cfgUserProxyObrig);
                $("#userProxy").focus();
                return false;
            }
            if ($.trim($("#passProxy").val()) == "") {
                alert(cfgPassProxyObrig);
                $("#passProxy").focus();
                return false;
            }
        }
    }
    return true;
}

function configLogs() {
    incluirPagina("/configuracoesLogs.action", "conteudo-ajax", null, "inicializaFormCfgLogs();", null);
}

function inicializaFormCfgLogs() {
    reloadTempo();
    disableLabel();
}

function disableLabel() {
    if (!$("#checkRot").prop("checked")) {
        $("#labelQuant").prop("disabled", true);
        $("#labelQuant").val(10);
    } else {
        $("#labelQuant").prop("disabled", false);
    }
}

function formatTempo(tempo) {
    var seg = new String(parseInt(tempo % 60));
    var min = parseInt(tempo / 60);
    var hour = parseInt(min / 60);
    if (min >= 60) {
        hour = min / 60;
        min = min % 60;
    }
    min = new String(parseInt(min));
    hour = new String(parseInt(hour));

    if (hour.length == 1) {
        hour = "0" + hour;
    }
    if (min.length == 1) {
        min = "0" + min;
    }
    if (seg.length == 1) {
        seg = "0" + seg;
    }
    return hour + ":" + min + ":" + seg;
}

function calculaTempo() {
    var result = $("#quantLog").val() * $("#tempoGravaDado").val();
    return result;
}

function reloadTempo() {
    $("#tempo").html(formatTempo(calculaTempo()));
}

function salvarConfigLogs(f) {
    if ($("#checkGrava").prop("checked")) {
        if ($("#quantLog").val() <= 0) {
            alert(cfgLogTamMinQtdLog);
            $("#quantLog").focus();
            return;
        }
        if ($("#tempoGravaDado").val() <= 0) {
            alert(cfgLogTamMinGrvDado);
            $("#tempoGravaDado").focus();
            return;
        }
    }

    if ($("#checkRot").prop("checked")) {
        if ($("#labelQuant").val() <= 0) {
            alert(cfgLogRotacionarLog);
            $("#labelQuant").focus();
            return;
        }
    }
    var dados = $(f).serialize();
    incluirPagina("/salvarConfiguracoesLogs.action", "conteudo-ajax", dados, "inicializaFormCfgLogs();", null);
}
