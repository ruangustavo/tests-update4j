/* Funcao para checar se o e-mail foi preenchido corretamente */
function ChecaEmail(field, strField) {
    var reg1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; // not valid
    var reg2 = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; // valid
    if (!reg1.test(strField) && reg2.test(strField)) { // if syntax is valid
        return true;
    }
    field.focus();
    field.value = "";
    field.select();
    return false;
}

//-->