var threadConexao = null;

const action = '/configuracaoEmailMsg'

function iniciaGerTimeout() {
    threadConexao = setTimeout("alert(cfgFalhaConexao);configBroadcast();", 90000);
}

function prepareNovoEmailMsg() {
    iniciaGerTimeout();
    incluirPagina(action + '!novo.action', "conteudo-ajax", null, "limparThreadConexao();", "limparThreadConexao();");
}

function prepareEditarEmailMsg(id) {
    iniciaGerTimeout();
    var search_params = new URLSearchParams();
    // append parameters
    search_params.append('emailMensagem.id', id);
    // query string
    var dados = search_params.toString();
    incluirPagina(action + '!editar.action', "conteudo-ajax", dados, "limparThreadConexao();", "limparThreadConexao();");
}

function validarForm(form) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var checkedOne = Array.prototype.slice.call(checkboxes).some(x => x.checked);

}

function onloadFormEmailMsg() {
    configCheckbox();
    $('#formEmailMsg').validator({disable: false});
    validadeCheckbox();
}

function configCheckbox() {
    const form = document.querySelector('#formEmailMsg');
    const checkboxes = form.querySelectorAll('input[type=checkbox]');
    const checkboxLength = checkboxes.length;
    const firstCheckbox = checkboxLength > 0 ? checkboxes[0] : null;

    for (let i = 0; i < checkboxLength; i++) {
        checkboxes[i].addEventListener('change', () => {
            validadeCheckbox();
            $('#formEmailMsg').validator('validate');
        });
    }
}

function validadeCheckbox() {
    const form = document.querySelector('#formEmailMsg');
    const checkboxes = form.querySelectorAll('input[type=checkbox]');
    const checkboxLength = checkboxes.length;
    const firstCheckbox = checkboxLength > 0 ? checkboxes[0] : null;

    let count = 0;

    for (let i = 0; i < checkboxLength; i++) {
        if (checkboxes[i].checked) {
            count++;
        }
    }
    document.getElementById("checkbox_hidden").value = count;
}

function confirmDeleteEmailMsg(id, confirmMsg) {
    var ok = confirm(confirmMsg);
    if (ok === true) {
        iniciaGerTimeout();
        var search_params = new URLSearchParams();
        // append parameters
        search_params.append('emailMensagem.id', id);
        // query string
        var dados = search_params.toString();
        incluirPagina(action + '!deletar.action', "conteudo-ajax", dados, "limparThreadConexao();", "limparThreadConexao();");
    }
}

function submitAjax(formElement) {
    $('#erro_content').remove();
    $form = $(formElement);
    if (!formElement.checkValidity()) {
        return false;
    }
    var dados = $form.serialize();
    iniciaGerTimeout();
    incluirPagina($form.attr('action'), "conteudo-ajax", dados, "limparThreadConexao();", "limparThreadConexao();");
    return false;
}


