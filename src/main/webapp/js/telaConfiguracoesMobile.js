function iniciaCadastroUsuario(f) {
    if ($("#novo").val() == "true") {
        if (!validaCamposAutenticarUsuarioMobile(f) || !validaSenha(f)) {
            $("#usuario").val("");
            $("#senha").val("");
            $("#confirmeSenha").val("");
            $("#perfil").val("");
            return false;
        }
        cadastrarUsuarioMobile(f);
    } else {
        editarUsuarioMobile(f, $("#usuario").val());
    }
}

function cadastrarUsuarioMobile(f) {
    $("#senha").val(btoa($("#senha").val()));
    var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
    incluirPagina("/telaUsuariosMobile!salvar.action", "conteudo-ajax", dados, "limparThread();", null);
}

function editarUsuarioMobile(f, id) {
    if (validaSenha(f)) {
        f["usuarioMobile.senha"].value = btoa(f["usuarioMobile.senha"].value);
        var dados = $(f).serialize() + "&cache=" + (new Date()).getTime() + "&usuarioMobile.usuario=" + id;
        incluirPagina("/telaUsuariosMobile!editar.action", "conteudo-ajax", dados, "preparaPagAgenda();", null);
    }
}

function excluirUsuarioMobile(id) {
    var dados = "cache=" + (new Date()).getTime() + "&usuarioMobile.usuario=" + id;
    dados += "&" + carregaDadosPagina(paginaAtual);
    incluirPagina("/telaUsuariosMobile!remover.action", "conteudo-ajax", dados, "preparaPagAgenda();", null);
}

function salvarDelay(f) {
    var er = /^\d+$/;
    if (!er.test(f.elements["delay.delay"].value)) {
        alert(msgDelayInvalido);
        f.elements["delay.delay"].focus();
        return;
    }
    var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
    incluirPagina("/telaSMSMobile!salvarDelay.action", "conteudo-ajax", dados, "preparaPagAgenda();", null);
}


function validaCamposAutenticarUsuarioMobile(f) {
    if ($.trim($("#usuario").val()) == "") {
        alert(cfgUsuarioA24hObrig);
        $("#usuario").focus();
        return false;
    }
    return true;
}

function eventosUsuariosMobile() {
    limparThread();
    $("#usuarios").on("shown.bs.collapse", ".collapse", function () {
        $(this).find("[type='password']:first").focus();
    });
}

function limparMensagensMobile() {
    $("#divMensagem").find(".msgSucesso, .msgErro").fadeOut('slow', function () {
        $("#divMensagem").find(".msgSucesso, .msgErro").remove();
    });
}

function validaSenha(f) {
    f["usuarioMobile.senha"].value = $.trim(f["usuarioMobile.senha"].value);
    f["confirmeSenha"].value = $.trim(f["confirmeSenha"].value);
    return validaSenhaPadrao(f["usuarioMobile.senha"].value, f["confirmeSenha"].value);
}

function limparCadastroUsuario() {
    $("#usuario").val("");
    $("#senha").val("");
    $("#confirmeSenha").val("");
    $("#perfil").val("");
}

function abrirModalCadastro(id, permissao, novo) {
    limparCadastroUsuario();
    $("#modalCadastro").modal('show');
    $("#modalCadastroTitulo").hide();
    $("#modalEdicaoTitulo").hide();
    $("#novo").val(novo);
    if (novo == 'true') {
        $("#modalCadastroTitulo").show();
        $("#modalEdicaoTitulo").hide();
        $("#usuario").prop('disabled', false);
    } else {
        $("#modalCadastroTitulo").hide();
        $("#modalEdicaoTitulo").show();
        $("#usuario").prop('disabled', true);
        $("#usuario").val(id);
    }
    if (permissao != "") {
        $("#perfil option[value=" + permissao + "]").attr('selected', 'selected');
    }

    $("#modalCadastro").off("hidden");
    $("#modalCadastro").on("hidden", function () {
        removeModalFade();
        incluirPagina("/telaUsuariosMobile!form.action", "conteudo-ajax", null, "limparThread();", null);
    });
}

function removeModalFade() {
    $(".modal-backdrop, .modal-scrollable").remove();
    $("body").removeClass();
}

function abrirModalIpsQrCode(id, permissao, ip) {

    $("#btnQrCode").prop('disabled', true);
    $("#painelQrCode").prop('disabled', true);

    limparMensagensMobile();
    addUsuarioDisplay(id, permissao, ip);
    mostrarPainelIps();

    $("#modalIpsQrCode").modal('show');

    filtrarIPs(ip);
}

function filtrarIPs(ip) {
    $("#filtroIpv4").hide();
    $("#filtroIpv6").hide();
    if ($("#ipv4").prop("checked")) {
        $("#filtroIpv4").show();
    }
    if ($("#ipv6").prop("checked")) {
        $("#filtroIpv6").show();
    }

    if (!$("#ipv4").prop("checked") && !$("#ipv6").prop("checked")) {
        $("#btnQrCode").prop('disabled', true);

        $('input:radio').each(function () {
            var $this = $(this);
            $(this).prop('checked', false);
        });
    }

    if (ip) {
        selecionarIP(ip);

        $("#ipv4").prop("checked", true);
        $("#filtroIpv4").show();
        $("#ipv6").prop("checked", true);
        $("#filtroIpv6").show();

        $('input:radio').each(function () {
            var $this = $(this);
            $(this).prop('checked', false);
            if ($(this).val() === ip) {
                $(this).prop('checked', true);
            }
        });
    }
}

function selecionarIP(value) {
    if (typeof $('input[type="radio"][name="ip"][value="' + value + '"]').val() !== 'undefined') {
        $('input#ipSelecionadoHidden').val(value);
        $("#btnQrCode").prop('disabled', false);
        $('#ipDisplayPainelIp').html(value);
        $('#ipDisplayPainelQrCode').html(value);
    }
}

function mostrarPainelIps() {
    $("#painelIps").show();
    $("#painelQrCode").hide();
}

function mostrarPainelQrCodeEGerar(f) {

    gerarQrcodeUsuarioMobile(f, "qrcode");

    $("#painelIps").hide();
    $("#painelQrCode").show();
}

function addUsuarioDisplay(id, permissao, ip) {
    $('input#usuarioHidden').val(id);
    $('input#permissaoHidden').val(permissao);

    $('#usuarioDisplayPainelIp').html(id);
    $('#ipDisplayPainelIp').html(ip);
    $('#usuarioDisplayPainelQrCode').html(id);
    $('#ipDisplayPainelQrCode').html(ip);
}

function gerarQrcodeUsuarioMobile(f, idElementoHtml) {
    var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
    incluirPagina("/telaUsuariosMobile!qrcode.action", idElementoHtml, dados, null, null);
}

function fecharModalQrcode() {
    $("#modalIpsQrCode").modal('hide');
    incluirPagina("/telaUsuariosMobile!form.action", "conteudo-ajax", null, "limparThread();", null);
}