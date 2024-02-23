function excluirAgendaEventos(id) {
    var dados = "cache=" + (new Date()).getTime() + "&tarefaBean.id=" + id;
    dados += "&" + carregaDadosPagina(paginaAtual);
    incluirPagina("/listarAgendaEventos!remover.action", "conteudo-ajax", dados, "preparaPagAgenda();", null);
}

function editarAgendaEventos(id) {
    var dados = "cache=" + (new Date()).getTime() + "&agendaTarefaForm.id=" + id;
    dados += "&" + carregaDadosPagina(paginaAtual);
    incluirPagina("/salvarTarefa", "conteudo-ajax", dados, "preparaPagAgenda();", null);
}

function cadastrarTarefa(f) {
    if (!validateAgendaTarefaForm(f))
        return;

    var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();
    dados += "&" + carregaDadosPagina(1);
    incluirPagina("/salvarTarefa!salvar.action", "conteudo-ajax", dados, "preparaPagAgenda();iniciaFormTarefa();", null);
}

function formTarefa() {
    var dados = "cache=" + (new Date()).getTime();

    incluirPagina("/salvarTarefa.action", "conteudo-ajax", dados, "iniciaFormTarefa();", null);
}

function iniciaFormTarefa() {
    limparThread();
    criarDateTimePicker("dtFim", linguagem);
    criarDateTimePicker("dt", linguagem);

    if ($('input[name="agendaTarefaForm.tipoEvento"]:checked').val() == TAREFA_DESLIGAR_LIGAR_UPS) {
        $('#ligar').show();
    } else {
        $('#ligar').hide();
    }
}

function validateAgendaTarefaForm(f) {
    if ($("input[name='agendaTarefaForm\.tipoEvento']:checked") == null ||
        $("input[name='agendaTarefaForm\.tipoEvento']:checked").length == 0) {
        alert(msgAgendaFormCampoEvento);
        return false;
    }
    if ($("input[name='agendaTarefaForm\.frequencia']:checked") == null ||
        $("input[name='agendaTarefaForm\.frequencia']:checked").length == 0) {
        alert(msgAgendaFormCampoFrequencia);
        return false;
    }
    var tipoEvt = $("input[name='agendaTarefaForm\.tipoEvento']:checked")[0].value;
    var freq = $("input[name='agendaTarefaForm\.frequencia']:checked")[0].value;

    if (tipoEvt == TAREFA_TESTE_POR_TEMPO && (f.duracao.value == "" || f.duracao.value == "0" || f.duracao.value == "00")) {
        alert(msgAgendaFormCampoDuracao);
        return false;
    }
    if (tipoEvt != TAREFA_TESTE_POR_TEMPO)
        f.duracao.value = "";

    return true;
}

function datahoraligarDisparo(numeroComando) {
    if (numeroComando == DISPARO_DESLIGAR_LIGAR_UPS) {
        $('#ligar #dataFinal').removeAttr('disabled');
        $('#dtFim span.input-group-addon').removeAttr('disabled');
        $('#ligar').show();
    } else {
        $('#ligar #dataFinal').val('');
        $('#ligar #dataFinal').attr('disabled', 'disabled');
        $('#dtFim span.input-group-addon').attr('disabled', 'disabled');
        $('#ligar').hide();
    }
}

function datahoraligar(numeroComando) {
    if (numeroComando == TAREFA_DESLIGAR_LIGAR_UPS) {
        $('#dataFinal').removeAttr('disabled');
        $('#dtFim span.input-group-addon').removeAttr('disabled');
        $('#dataFinal').attr('readonly', 'readonly');
        $('#ligar').show();
    } else {
        $('#dataFinal').val('');
        $('#dataFinal').removeAttr('readonly');
        $('#dataFinal').attr('disabled', 'disabled');
        $('#dtFim span.input-group-addon').attr('disabled', 'disabled');
        $('#ligar').hide();
    }
}

function exibirDtFimComponent() {
    if ($('input[name="dispararEventoForm.tipo"]:checked').val() == DISPARO_DESLIGAR_LIGAR_UPS) {
        propagaExibicao('dtFim');
    }
}

function exibirDtComponent() {
    if ($('input[name="agendaTarefaForm.tipoEvento"]:checked').val() == TAREFA_DESLIGAR_LIGAR_UPS) {
        propagaExibicao('dtFim');
    }
}

function exibirDtFrequenciaComponent() {
    propagaExibicao('dt');
}

$(document).ready(function () {
    setInterval(function () {
        $('#dtFim span.input-group-addon, #dtFim span.input-group-addon img').unbind('click');
    }, 1000);
});
