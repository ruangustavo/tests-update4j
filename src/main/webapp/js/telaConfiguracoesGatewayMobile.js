function iniciaGerTimeout() {
    threadConexao = setTimeout("alert(cfgFalhaConexao);configGatewayMobile();", 90000);
}

function setEnableGatewayMobile(f) {
    var dados = $(f).serialize();

    $("#divMensagem").html("");
    iniciaGerTimeout();

    incluirPagina('/salvarConfiguracoesGatewayMobile!salvarEnableGatewayMobile.action', "conteudo-ajax", dados, "limparThreadConexao();", "limparThreadConexao();");
}

function salvarSerialGatewayMobile(f) {
    if (hasSerial()) {
        if (isSerialValido()) {
            var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
            incluirPagina('/salvarConfiguracoesGatewayMobile!salvarSerial.action', "conteudo-ajax", dados, "limparThreadConexao();", "limparThreadConexao();");
        } else {
            alert(msgCampoSerialInvalido);
            $("#serial").focus();
        }
    } else {
        alert(msgCampoSerialVazio);
        $("#serial").focus();
    }
}

function salvarSerialConfiguracoes(f) {
    if (hasSerial()) {
        if (isSerialValido()) {
            var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
            incluirPagina('/salvarTelaConfiguracoesGeral!salvarSerial.action', "conteudo-ajax", dados, "limparThreadConexao();", "limparThreadConexao();");
        } else {
            alert(msgCampoSerialInvalido);
            $("#serial").focus();
        }
    } else {
        alert(msgCampoSerialVazio);
        $("#serial").focus();
    }
}

function hasSerial() {
    if ($.trim($("#serial").val()) == "") {
        return false;
    }
    return true;
}

function isSerialValido() {
    if ($.trim($("#serial").val()).length == 12 && $.isNumeric($("#serial").val())) {
        return true;
    }
    return false;
}

function onlynumber(evt) {
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode(key);
    //var regex = /^[0-9.,]+$/;
    var regex = /^[0-9.]+$/;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault) theEvent.preventDefault();
    }
}
