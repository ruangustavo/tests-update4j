//Log de dados
function listarLogDados(pagina) {
    var dados = carregaDadosPagina(pagina);
    incluirPagina("/listarLogDados.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoLog();', null);
}

function criaThreadAtualizacaoLog() {
    ativarPaginacao();
    limparThread();
    carregaDatasFiltroCompleto("inicio", "fim", linguagem);
}

function filtrarLogDados(form, pagina) {
    if (validaFiltroLog(form)) {
        var dados = $(form).serialize();
        dados += "&" + carregaDadosPagina(pagina);
        incluirPagina("/listarLogDados.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoLog();', null);
    }
}

function msg() {
    return msgDataInvalida;
}

function redirectExportarLogDados() {
    window.location.href = homeSite + '/export?service=dados';
}

function redirectLimparLogDados() {
    incluirPagina("/removerTodosDados.action", "conteudo-ajax", null, 'criaThreadAtualizacaoLog();', null);
}

//Log de eventos
function listarLogDisparos(pagina) {
    var dados = carregaDadosPagina(pagina);
    incluirPagina("/listarLogDisparos.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoLogDisparos();', null);
}

function criaThreadAtualizacaoLogDisparos() {
    ativarPaginacao();
    limparThread();
    carregaDatasFiltroCompleto("inicio", "fim", linguagem);
}

function filtrarLogDisparos(form, pagina) {
    if (validaFiltroLog(form)) {
        var dados = $(form).serialize();
        dados += "&" + carregaDadosPagina(pagina);
        incluirPagina("/listarLogDisparos.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoLogDisparos();', null);
    }
    ;
}

function validaFiltroLog(f) {

    if (f.dataInicio.value != "" || f.dataFim.value != "") {

        if (f.dataInicio.value == "") {
            alert(msgDataIniInvalida);
            f.dataInicio.focus();
            return false;
        }
        if (f.dataFim.value == "") {
            alert(msgDataFimInvalida);
            f.dataFim.focus();
            return false;
        }

        var dataIni = f.dataInicio.value.split(" ")[0], dataFim = f.dataFim.value.split(" ")[0];

        if (dataIni != dataFim && !dataMenor(dataIni, dataFim)) {
            alert(msgDataInicioAnterior);
            f.dataInicio.focus();
            return false;
        }
    }
    return true;
}

function redirectExportarLogDisparos() {
    window.location.href = homeSite + '/export?service=eventos';
}

function redirectLimparLogDisparos() {
    incluirPagina("/removerTodosEventos.action", "conteudo-ajax", null, 'criaThreadAtualizacaoLogDisparos();', null);
}

//Log de processos
function listarLogProcesso(pagina) {
    var dados = carregaDadosPagina(pagina);
    incluirPagina("/listarLogProcesso.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoLogProcessos();', null);
}

function criaThreadAtualizacaoLogProcessos() {
    ativarPaginacao();
    limparThread();
}

function filtrarLogProcessos(pagina) {
    var dados = carregaDadosPagina(pagina);
    incluirPagina("/listarLogProcesso.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoLogProcessos();', null);
}

//Log de testes de autonomia
function listarTestesAutonomia(pagina) {
    var dados = carregaDadosPagina(pagina);
    dados += "&filter=false"
    incluirPagina("/listarTestesAutonomia.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoTestesAutonomia();', null);
}

function criaThreadAtualizacaoTestesAutonomia() {
    ativarPaginacao();
    limparThread();
    carregaDatasFiltroCompleto("inicio", "fim", linguagem);
}

function filtrarTesteAutonomia(form, pagina) {
    if (validaFiltroLog(form)) {
        var dados = $(form).serialize();
        dados += "&" + carregaDadosPagina(pagina);
        dados += "&filter=true"
        incluirPagina("/listarTestesAutonomia.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoTestesAutonomia();', null);
    }
}

//Histórico
function historico() {
    incluirPagina("/historico.action", "conteudo-ajax", null, 'criaThreadAtualizacaohistorico();', null);
}

function criaThreadAtualizacaohistorico() {
    limparThread();
    setDisplay($("#radioDado")[0]);
}

function setDisplay(obj) {
    incluirPagina("/listarHistorico.action", "frame", "tipoLog=" + obj.value, null, null);
}

function verificaCheckTitle(obj) {
    if (!obj.checked) {
        $("#checkTitle").prop("checked", false);
    } else if ($("#frame input[name='" + obj.name + "']:not(:checked)").length == 0) {
        $("#checkTitle").prop("checked", true);
    }
}

function deleteLog() {
    $("#arquivos #nomeArquivo").val("");
    if ($("#checkTitle").prop("checked")) {
        $("#arquivos #todos").val("true");
        incluirPagina("/arquivosLog!delete.action", "frame", $("#arquivos").serialize(), null, null);
    } else {
        $("#arquivos #todos").val("false");
        var strChecks = $("#arquivos").serialize();
        if ($("#frame input[name='file']:checked").length == 0) {
            alert(arquivoLogSemSelecao);
            return;
        }
        incluirPagina("/arquivosLog!delete.action", "frame", $("#arquivos").serialize(), null, null);
    }
}

function downloadLog(arquivo) {
    $("#arquivos #nomeArquivo").val(arquivo);
    $("#arquivos").submit();

    return;
}

function checkT() {
    var selecionado = $("#checkTitle").prop("checked");
    $("#frame input[name='file']").prop("checked", selecionado);
}

//DumpLog
function dump() {
    var dados = carregaDadosPagina(1);
    incluirPagina("/dumpLog.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoDumpLog();', null);
}

function filtrarDumpLog(pagina) {
    var dados = carregaDadosPagina(pagina);
    incluirPagina("/dumpLog!listar.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoDumpLog();', null);
}

function validaDumpLog(f) {
    if (jQuery.trim($("#destino").val()) == "") {
        alert(dumpLogEmailVazio);
        return false;
    }

    if (!ValidaEMail($("#destino").val())) {
        alert(dumpLogEmailInvalido);
        $("#destino").focus();
        return false;
    }
    return true;
}

function enviarDumpLog(f) {
    if (validaDumpLog(f)) {
        var dados = $(f).serialize() + "&" + carregaDadosPagina(paginaAtual);
        incluirPagina("/dumpLog!enviarPorEmail.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoDumpLog();', null);
    }
    ;
}

function criaThreadAtualizacaoDumpLog() {
    ativarPaginacao();
    limparThread();
}
