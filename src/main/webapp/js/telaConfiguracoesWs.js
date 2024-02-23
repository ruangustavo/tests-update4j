var threadConexao = null;

function iniciaGerTimeout() {
    threadConexao = setTimeout("alert(cfgFalhaConexao);configAlerta24h();", 90000);
}

function confirmaLogoutUsuario() {
    return confirm(cfgLogOffUsuarioA24h);
}

function validaCamposAutenticarUsuario(f) {
    if ($.trim($("#usuarioWS").val()) == "") {
        alert(cfgUsuarioA24hObrig);
        $("#usuarioWS").focus();
        return false;
    } else if ($.trim($("#senhaWS").val()) == "") {
        alert(cfgSenhaA24hObrig);
        $("#senhaWS").focus();
        return false;
    }

    return true;
}

function habilitarGatewayMobile(f) {
    var dados = $(f).serialize();

    $("#divMensagem").html("");
    iniciaGerTimeout();

    incluirPagina('/configuracoesAlerta!salvarEnableGatewayMobile.action', "conteudo-ajax", dados, "limparThreadConexao();", "limparThreadConexao();");
}

function validaCamposAssociarProdutoForm(f) {

    // Não tem produto para associar
    if ($("input[name='configuracoes\.codigoProdutoWS']:radio").length == 0) {
        alert(cfgSemCodigoProdA24h);
        return false;
        // Só tem um produto para associar
    } else if ($("input[name='configuracoes\.codigoProdutoWS']:radio").length == 1) {
        $("input[name='configuracoes\.codigoProdutoWS']:radio:first").prop("checked", true);
        return true;
        // Tem mais de um produto para associar mas não tem nenhum selecionado
    } else if ($("input[name='configuracoes\.codigoProdutoWS']:radio:checked").length == 0) {
        alert(cfgCodigoProdNaoSelA24h);
        $("input[name='configuracoes\.codigoProdutoWS']:radio:first").focus();
        return false;
    }

    return true;
}

function efetuaLogOffA24h() {
    if (!confirmaLogoutUsuario())
        return false;

    logoutUsuario();
}

function logoutUsuario() {
    limparThreadConexao();
    iniciaGerTimeout();
    incluirPagina('/listarProdutosUsuario!logout.action', "conteudo-ajax", null,
        "limparThreadConexao();", "erroConexaoA24h(request);");
}

function erroConexaoA24h(request) {
    limparThreadConexao();
    var html = request.statusText.replace(/&amp;/ig, "&");
    html = acentuaHTML(html);
    $("#divMensagem").html(html);
}

function iniciaLoginUsuWS(f) {
    if (!validaCamposAutenticarUsuario(f))
        return false;

    autenticarUsuarioWS(f);
}

function autenticarUsuarioWS(f) {
    $("#senhaWS").val(btoa($("#senhaWS").val()));
    var dados = $(f).serialize();

    $("#divMensagem").html("");
    iniciaGerTimeout();

    incluirPagina('/listarProdutosUsuario!autenticar.action', "conteudo-ajax", dados,
        "limparThreadConexao();", "limparThreadConexao();");
}

function associarProduto(f) {

    if (!validaCamposAssociarProdutoForm(f))
        return;

    iniciaGerTimeout();
    var dados = $(f).serialize();
    $("#divMensagem").html("");
    incluirPagina("/salvarConfiguracoesAlerta.action", "conteudo-ajax", dados,
        "limparThreadConexao();", "limparThreadConexao();");
}
