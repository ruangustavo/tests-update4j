var threadConexao = null;

function limparThreadConexao() {
    clearTimeout(threadConexao);
    threadConexao = null;
}

function incluirPagina(urlPagina, idDiv, dados, funcao, funcaoErro) {
    if (dados == null)
        dados = '';

    $.ajax({
            type: 'POST',
            url: homeSite + '/s2' + urlPagina,
            cache: false,
            processData: true,
            contentTypeString: 'application/x-ww w-form-urlencoded; charset=UTF-8',
            data: dados + ((dados == '') ? '' : '&') + 'cache=' + ((new Date).getTime()),
            beforeSend: function () {
                aguarde(idDiv);
            },
            success: function (data, status, request) {

                $("#" + idDiv).html(request.responseText);
                if (funcao) {
                    eval(funcao);
                }
            },
            error: function (request, status, thrown) {
                if (funcaoErro) {
                    eval(funcaoErro);
                }
            }, statusCode: {
                403: function () {
                    window.open(homeSite, "_top");
                }
            }
        }
    );
}

function incluirPaginaAposDisparo(urlPagina, idDiv, dados, funcao, funcaoErro) {

    if (dados == null)
        dados = '';

    $.ajax({
            type: 'POST',
            url: homeSite + '/s2' + urlPagina,
            cache: false,
            processData: true,
            contentTypeString: 'application/x-ww w-form-urlencoded; charset=UTF-8',
            data: dados + ((dados == '') ? '' : '&') + 'cache=' + ((new Date).getTime()),
            beforeSend: function () {
                aguarde(idDiv);
            },
            success: function (data, status, request) {

                $("#" + idDiv).html(request.responseText);
                $('input[type=radio]').prop("checked", false);
                if (funcao) {
                    eval(funcao);
                }
            },
            error: function (request, status, thrown) {
                if (funcaoErro) {
                    eval(funcaoErro);
                }
            }, statusCode: {
                403: function () {
                    window.open(homeSite, "_top");
                }
            }
        }
    );
}

function aguarde(idDiv) {
    $("#" + idDiv).html($("#templ_aguarde").html());
}

function incluirPaginaSemAguarde(urlPagina, idDiv, dados, funcao, funcaoErro) {

    if (dados == null)
        dados = '';

    $.ajax({
            type: 'POST',
            url: homeSite + '/s2' + urlPagina,
            cache: false,
            processData: true,
            contentTypeString: 'application/x-ww w-form-urlencoded; charset=UTF-8',
            data: dados + ((dados == '') ? '' : '&') + 'cache=' + ((new Date).getTime()),
            success: function (data, status, request) {

                $("#" + idDiv).html(request.responseText);
                if (funcao) {
                    eval(funcao);
                }
            },
            error: function (request, status, thrown) {
                if (funcaoErro) {
                    eval(funcaoErro);
                }
            }, statusCode: {
                403: function () {
                    window.open(homeSite, "_top");
                }
            }
        }
    );
}

function ativarPaginacao() {
    var f = $("#frmDadosPaginacao")[0];
    if (f == null)
        return;
    var pgAtual = f.paginaAtual.value;
    var totPaginas = f.totalPaginas.value;
    if (isNaN(totPaginas) || parseInt(totPaginas) <= 1) {
        $('#paginacao').html("");
        return;
    }
    if (isNaN(pgAtual) || parseInt(pgAtual) <= 0) {
        pgAtual = 1;
    }
    var url = f.urlPaginacao.value;
    var funcao = f.funcaoPaginacao.value;
    var idDiv = f.idDiv.value;

    var options = {
        bootstrapMajorVersion: 3,
        currentPage: pgAtual,
        totalPages: totPaginas,
        numberOfPages: 10,
        size: 'normal',
        alignment: 'center',
        itemContainerClass: function (type, page, current) {
            return (page === current) ? "active" : "pointer-cursor";
        },
        onPageClicked: function (e, originalEvent, type, page) {
            if (funcao != null && funcao != "") {
                funcao = funcao.replace("[pagina]", page);
                try {
                    eval(funcao);
                } catch (e) {
                    alert("Função de paginação não definida.\n" + e.message);
                }
            } else {
                incluirPagina(url, idDiv, carregaDadosPagina(page), null, null);
            }

        },
        tooltipTitles: function (type, page, current) {
            switch (type) {
                case"first":
                    return pageFirst;
                case"prev":
                    return pagePrev;
                case"next":
                    return pageNext;
                case"last":
                    return pageLast;
                case"page":
                    return page === current ? pageCurr : pagePage + " " + page;
            }
        }
    };
    $('#paginacao').html("");
    var ctrl = $("<ul id='controle' class='pagination pagination-sm'/>");
    $('#paginacao').append(ctrl);
    $('#paginacao ul').bootstrapPaginator(options);
}

function carregaDadosPagina(pagina) {
    if (pagina != null && !isNaN(pagina)) {
        paginaAtual = pagina;
    } else if (paginaAtual == null) {
        paginaAtual = 1;
    }
    return "controleBean.paginaAtual=" + paginaAtual;
}

function pegaPaginaAtual() {
    var f = $("#frmDadosPaginacao")[0];
    if (f == null)
        return 1;
    return (isNaN(f.paginaAtual.value) ? 1 : parseInt(f.paginaAtual.value))
}