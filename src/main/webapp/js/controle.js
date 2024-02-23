function listarAgendaEventos(pagina) {
    var dados = carregaDadosPagina(pagina);
    incluirPagina("/listarAgendaEventos.action", "conteudo-ajax", dados, "preparaPagAgenda();", null);
}

function preparaPagAgenda() {
    ativarPaginacao();
    limparThread();
}

function telaDisparo() {
    incluirPagina("/telaDisparos.action", "conteudo-ajax", null, "iniciaFormDisparo();", null);
}

function iniciaFormDisparo() {
    criarDateTimePicker("dtFim", linguagem);
    limparThread();

    if ($('input[name="dispararEventoForm.tipo"]:checked').val() == DISPARO_DESLIGAR_LIGAR_UPS) {
        $('#ligar').show();
    } else {
        $('#ligar').hide();
    }
}

function submitFormDisparo(f) {
    var dados = $(f).serialize() + "&cache=" + (new Date()).getTime();

    incluirPaginaAposDisparo("/dispararEvento.action", "conteudo-ajax", dados, "iniciaFormDisparo();", null);
}

function validateFormDisparo(f) {
    if ($("input[name='dispararEventoForm\.tipo']:checked") == null || $("input[name='dispararEventoForm\.tipo']:checked").length == 0) {
        alert(msgAgendaFormCampoEvento);
        return false;
    }

    var tipoEvt = $("input[name='dispararEventoForm\.tipo']:checked")[0].value;

    if (tipoEvt == DISPARO_TESTE_POR_TEMPO &&
        (f.tempo.value == "" || f.tempo.value == "0" || f.tempo.value == "00")) {
        alert(msgAgendaFormCampoDuracao);
        return false;
    }
//	if (tipoEvt != DISPARO_TESTE_POR_TEMPO)
//		f.tempo.value = "";

    if (tipoEvt == DISPARO_DESLIGAR_LIGAR_UPS) {
        if (!ehData(f.dataFinal)) {
            alert(msgAgendaFormDataHoraLigarInvaLida);
            return false;
        }
        if (!checaHora(f.dataFinal)) {
            alert(msgAgendaFormDataHoraLigarInvaLida);
            f.dataFinal.focus();
            return false;
        }
    } else {
        f.dataFinal.value = "";
    }

    submitFormDisparo(f);

    return false;
}

function filtroComDelay(strObj) {
    setTimeout('FiltroNum(' + strObj + ')', 200);
}

function datahoraligarDisparo(numeroComando) {
    if (numeroComando == DISPARO_DESLIGAR_LIGAR_UPS) {
        $('#ligar #dataFinal').removeAttr('disabled');
        $('#dtFim span.input-group-addon').removeAttr('disabled');
    } else {
        $('#ligar #dataFinal').val('');
        $('#ligar #dataFinal').attr('disabled', 'disabled');
        $('#dtFim span.input-group-addon').attr('disabled', 'disabled');
    }
}

function exibirDtFimComponent() {
    if ($('input[name="dispararEventoForm.tipo"]:checked').val() == DISPARO_DESLIGAR_LIGAR_UPS) {
        propagaExibicao('dtFim');
    }
}

$(document).ready(function () {
    setInterval(function () {
        $('#dtFim span.input-group-addon, #dtFim span.input-group-addon img').unbind('click');
    }, 1000);
});