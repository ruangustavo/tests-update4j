function carregaDatasFiltro(dtIni, dtFim, lang, mostrarMinutos) {
    criarDateTimePicker(dtIni, lang);
    criarDateTimePicker(dtFim, lang);

    if (mostrarMinutos) {
        $("#" + dtIni).on("dp.change", function (e) { // changeDate
            $('#' + dtFim).data("DateTimePicker").setMinDate(e.date);
        });
        $("#" + dtFim).on("dp.change", function (e) { // changeDate
            $('#' + dtIni).data("DateTimePicker").setMaxDate(e.date);
        });
    }
}

function carregaDatasFiltroCompleto(dtIni, dtFim, lang) {
    criarDateTimePicker(dtIni, lang);
    criarDateTimePicker(dtFim, lang);

    $("#" + dtIni).on("dp.change", function (e) { // changeDate
        $('#' + dtFim).data("DateTimePicker").setMinDate(e.date);
    });
    $("#" + dtFim).on("dp.change", function (e) { // changeDate
        $('#' + dtIni).data("DateTimePicker").setMaxDate(e.date);
    });
}

function criarDatePicker(id, lang) {
    $('#' + id).datetimepicker({
        language: lang,
        pickTime: false,
        useStrict: true,
        useCurrent: false,
        forceParse: true,
        todayHighlight: true
    });
}

function criarDateTimePicker(id, lang, usarMinutos) {
    $('#' + id).datetimepicker({
        language: lang,
        sideBySide: true,
        useCurrent: false,
        useMinutes: (usarMinutos != null) ? usarMinutos : true,
        useSeconds: false,
        clearBtn: true,
        todayHighlight: true
    });
}

function appendClearButton(id) {
    $("#" + id).append("<span id='limpaData" + id + "' class='input-group-addon'><img src=\"/sms/imagens/ico_excluir.png\" width=\"17\" height=\"16\"/></span>");
    $("#limpaData" + id).on("click", function () {
        $("#" + id).data("DateTimePicker").setDate(null);
    })
}

function propagaDtAlteracao(idDdt, idInput) {
    $("#" + idDdt).on("dp.change", function (event) {
        var valor = $("#" + idInput).val();
        formataDataComHora(idInput, valor);
    });
    $("#" + idDdt).on("dp.hide", function (event) {
        var valor = $("#" + idInput).val();
        formataDataComHora(idInput, valor);
    });
    $("#" + idDdt).on("dp.show", function (event) {
        var valor = $("#" + idInput).val();
        formataDataComHora(idInput, valor);
    });
}

function formataDataComHora(idInput, valor) {
    if (valor != null && valor != "" && valor.indexOf(":") > 0) {
        $("#" + idInput).val(valor.substring(0, valor.indexOf(":")));
    }
}

function propagaAlteracao(id) {
    $("#" + id).trigger("dp.change");

}

function propagaExibicao(id) {
    $("#" + id).data("DateTimePicker").show();
}