//<!--

function mascaraData(nForm, nElement) {
    var str = document.forms[nForm].elements[nElement].value;

    if ((str.length == 2) || (str.length == 5)) {
        document.forms[nForm].elements[nElement].value = document.forms[nForm].elements[nElement].value + '/';
    }

    return true;
}


function mascaraHora(nForm, nElement) {
    var str = document.forms[nForm].elements[nElement].value;

    if (str.length == 2) {
        document.forms[nForm].elements[nElement].value = document.forms[nForm].elements[nElement].value + ':';
    }

    return true;
}


/* Esta funcao checa se um campo do formulario contem espaços em branco*/
function ChecaEspaco(nForm, nElement) {
    var str = document.forms[nForm].elements[nElement].value;

    for (var i = 0; i < (str.length); i++) {
        if (str.substring(i, i + 1) == ' ') {
            return true;
        }
    }
    return false;
}


/* Esta funcao checa se um campo do formulario foi preenchido */
function ChecaCampoVazio(nForm, nElement) {
    if (document.forms[nForm].elements[nElement].value == '') {
        document.forms[nForm].elements[nElement].focus();
        return true;
    }
    return false;
}

/* Esta funcao checa o tamanho maximo de um campo */
function ChecaTamanhoMaxCampo(formNum, nElemento, nTamMAX) {
    var str = document.forms[formNum].elements[nElemento].value;
    if (str.length > nTamMAX) {
        alert("Por favor, este campo deve conter no m" + String.fromCharCode(225) + "ximo" + nTamMAX + ".\nEle possui " + str.length + ".");
        document.forms[formNum].elements[nElemento].focus();
        return true;
    } else {
        return false;
    }
}

/* Esta funç&atilde;o retorna objeto do tipo data a partir de uma string*/
function str2date(str) { // str = dd/mm/aaaa
    var dia = str.substring(0, 2);
    var mes = str.substring(3, 5);
    var ano = str.substring(6, str.lenght);
    return (new Date(ano, mes, dia));
}

/* Esta funcao checa o tamanho minimo de um campo */
function ChecaTamanhoMinCampo(formNum, nElemento, nTamMIN) {
    var str = document.forms[formNum].elements[nElemento].value;
    if (str.length < nTamMIN) {
        document.forms[formNum].elements[nElemento].focus();
        return true;
    } else {
        return false;
    }
}

/* Esta funcao volta o foco para o campo se o valor dele nao  */

/* for numerico, e da um aviso para o usuario. */
function ChecaNumerico(formNum, elemNum) {
    var parte;
    var str = document.forms[formNum].elements[elemNum].value;
    var i = 0;
    var re = /\d/;
    var Tamanho = str.length - 1;
    if (str != '') {
        do {
            parte = str.substr(i, 1);
            if (parte.search(re) == -1) {
                alert('Este campo deve ser num"+String.fromCharCode(233)+"rico.');
                document.forms[formNum].elements[elemNum].focus();
                document.forms[formNum].elements[elemNum].select();
                return false;
            }
            i++;
        }
        while (i <= Tamanho)
    }
    return true;
}

/*   */
function ChecaValorNumericoMaximo(formNum, elemNum, numero) {
    var str = document.forms[formNum].elements[elemNum].value;
    if (str > numero) {
        document.forms[formNum].elements[elemNum].focus();
        document.forms[formNum].elements[elemNum].select();
        return false;
    }
    return true;
}

/* Esta funcao volta o foco para o campo se o valor dele nao  */

/* for real, e da um aviso para o usuario. */
function ChecaNumericoFloat(formNum, elemNum) {
    var str = document.forms[formNum].elements[elemNum].value;
    var strTOfloat = parseFloat(str);
    if (str != String(strTOfloat)) {
        alert('Este campo deve ser um n"+String.fromCharCode(250)+"mero real.´\nUse ponto ao inv"+String.fromCharCode(233)+"s de v"+String.fromCharCode(237)+"rgula.');
        document.forms[formNum].elements[elemNum].focus();
        document.forms[formNum].elements[elemNum].select();
        return false;
    }
    document.forms[formNum].elements[elemNum].value = strTOfloat;
    return true;
}

/* Esta funcao valida um data no formato dd/mm/aaaa */
function ChecaData(formNum, elemNum) {
    if (!ValidaData(document.forms[formNum].elements[elemNum].value)) {
        alert("Por favor, preencha a data no formato dd/mm/aaaa");
        document.forms[formNum].elements[elemNum].focus();
        document.forms[formNum].elements[elemNum].select();
        return true;
    } else {
        return false;
    }
}

/* Esta funcao valida um data no formato dd/mm/aaaa */
function ValidaData(sdata) {
    day2 = sdata.substr(0, 2);
    month2 = sdata.substr(3, 2);
    year2 = sdata.substr(6, 4);

    if ((sdata.substr(2, 1) != "/") || (sdata.substr(5, 1) != "/")) {
        day2 = "";
        month2 = "";
        year2 = "";
    }

    var DayArray = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var MonthArray = new Array("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12");
    var inpDate = day2 + month2 + year2;
    var filter = /^[0-9]{2}[0-9]{2}[0-9]{4}$/;

    /* Check ddmmyyyy date supplied */
    if (!filter.test(inpDate)) {
        return false;
    }
    /* Check Valid Month */
    filter = /01|02|03|04|05|06|07|08|09|10|11|12/;
    if (!filter.test(month2)) {
        return false;
    }
    /* Check For Leap Year */
    var N = Number(year2);
    if ((N % 4 == 0 && N % 100 != 0) || (N % 400 == 0)) {
        DayArray[1] = 29;
    }
    /* Check for valid days for month */
    for (var ctr = 0; ctr <= 11; ctr++) {
        if (MonthArray[ctr] == month2) {
            if (day2 <= DayArray[ctr] && day2 > 0) {
                inpDate = day2 + '/' + month2 + '/' + year2;
                return true;
            } else {
                return false;
            }
        }
    }
}

/* Funcao para checar se o e-mail foi preenchido corretamente */
function ChecaEmail(nForm, nElement) {
    var field = document.forms[nForm].elements[nElement]; // email field
    var str = document.forms[nForm].elements[nElement].value; // email string
    var reg1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; // not valid
    var reg2 = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; // valid
    if (!reg1.test(str) && reg2.test(str)) { // if syntax is valid
        return true;
    }
    alert("\"" + str + "\" n" + String.fromCharCode(227) + "o " + String.fromCharCode(233) + " um e-mail v" + String.fromCharCode(225) + "lido."); // this is also optional
    field.focus();
    field.select();
    return false;
}

/* Esta funcao valida o cadastro de uma senha */
function ValidaSenha(formNum, nElemento1, nElemento2, nTamMaxSenha, nTamMinSenha) {
    if (ChecaCampoVazio(formNum, nElemento1)) {
        alert('Por favor, preencha o campo senha.');
        return false;
    }
    if (nTamMaxSenha == nTamMinSenha) {
        if (ChecaTamanhoMaxCampo(formNum, nElemento1, nTamMaxSenha) || ChecaTamanhoMinCampo(formNum, nElemento1, nTamMinSenha)) {
            alert('Por favor, sua senha deve conter ' + nTamMaxSenha + ' caracteres.');
            return false;
        }
    } else {
        if (ChecaTamanhoMaxCampo(formNum, nElemento1, nTamMaxSenha)) {
            alert('Por favor, sua senha deve conter no m' + String.fromCharCode(225) + 'ximo ' + nTamMaxSenha + ' caracteres.');
            return false;
        } else {
            if (ChecaTamanhoMinCampo(formNum, nElemento1, nTamMinSenha)) {
                alert('Por favor, sua senha deve conter no m' + String.fromCharCode(237) + 'nimo ' + nTamMinSenha + ' caracteres.');
                return false;
            }
        }
    }
    if (document.forms[formNum].elements[nElemento1].value != document.forms[formNum].elements[nElemento2].value) {
        alert('Por favor, verifique a senha digitada, os campos da senha digitada est' + String.fromCharCode(227) + 'o diferentes.\n');
        return false;
    }
    return true;
}

/* Esta funcao valida o CNPJ */
function ValidaCNPJ(formNum, nElemento, nTamMAX) {
    var str = document.forms[formNum].elements[nElemento].value;
    if (str.length != nTamMAX) {
        alert('Por favor, informe o CNPJ com  ' + nTamMAX + ' d"+String.fromCharCode(237)+"gitos.');
        document.forms[formNum].elements[nElemento].focus();
        return true;
    }
    if (!VerificaCNPJ(document.forms[formNum].elements[nElemento].value)) {
        alert('CNPJ inv"+String.fromCharCode(225)+"lido. Por favor, informe o CNPJ corretamente.');
        document.forms[formNum].elements[nElemento].focus();
        return true;
    } else {
        return false;
    }
}

//Auxilia ValidaCNPJ
function modulo(str) {
    soma = 0;
    ind = 2;
    for (pos = str.length - 1; pos > -1; pos = pos - 1) {
        soma = soma + (parseInt(str.charAt(pos)) * ind);
        ind++;
        if (str.length > 11) {
            if (ind > 9) ind = 2;
        }
    }
    resto = soma - (Math.floor(soma / 11) * 11);
    if (resto < 2) {
        return 0
    } else {
        return 11 - resto
    }
}

//Auxilia ValidaCNPJ
function VerificaCNPJ(valor) {
    primeiro = valor.substr(1, 1);
    falso = true;
    size = valor.length;
    if (size != 14) {
        return false;
    }
    size--;
    for (i = 2; i < size - 1; ++i) {
        proximo = (valor.substr(i, 1));
        if (primeiro != proximo) {
            falso = false
        }
    }

    if (falso) {
        return;
    }

    if (modulo(valor.substring(0, valor.length - 2)) + "" + modulo(valor.substring(0, valor.length - 1)) != valor.substring(valor.length - 2, valor.length)) {
        return false;
    }
    return true;
}/*Fim da validacao de CNPJ*/

/* Funcao para o selecionameto de varios checkboxes de uma unica vez */
function SelectAll(bool, formNum) {
    var i;
    for (i = 0; i < document.forms[formNum].length; i++) {
        document.forms[formNum].elements[i].checked = bool;
    }
}

/* Funcao para verificar o selecionamento de radioboxes*/
function ChecaCheckBox(formNum, nElemento1, nElemento2) {
    var i;
    for (i = nElemento1; i <= nElemento2; i++) {
        if (document.forms[formNum].elements[i].checked) {
            return true;
        }
    }
    return false;
}

/* Funç&atilde;o que checa a sequência de escolhas em fomrularios de combos do tipo ordem de preferência */
function ChecaSequenciaEscolhas(formNum, nElemento1, nElemento2) {
    for (b = nElemento1; b <= nElemento2; b++) {
        var str1 = document.forms[formNum].elements[b].value;
        for (a = nElemento1; a <= nElemento2; a++) {
            var str = document.forms[formNum].elements[a].value;
            if ((str == str1) && (a != b)) {
                return true;
            }
            ;
        }
    }
    return false;
}

/* Funçao para verificar o CPF feita por Marcos Camada*/
function isCPF(formNum, orderField) {
    var sCPF = document.forms[formNum].elements[orderField].value;
    var c = sCPF.substr(0, 9);
    var dv = sCPF.substr(9, 2);
    var d1 = 0;

    for (i = 0; i < 9; i++) {
        d1 += c.charAt(i) * (10 - i);
    }
    if (d1 == 0) {
        alert("CPF Inv" + String.fromCharCode(225) + "lido");
        document.forms[formNum].elements[orderField].focus();
        return false;
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) {
        d1 = 0;
    }
    if (dv.charAt(0) != d1) {
        alert("CPF Inv" + String.fromCharCode(225) + "lido");
        document.forms[formNum].elements[orderField].focus();
        return false;
    }
    d1 *= 2;
    for (i = 0; i < 9; i++) {
        d1 += c.charAt(i) * (11 - i);
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) {
        d1 = 0;
    }
    if (dv.charAt(1) != d1) {
        alert("CPF Inv" + String.fromCharCode(225) + "lido");
        document.forms[formNum].elements[orderField].focus();
        return false;
    }
    return true;
}

/* Esta funcao valida a hora no formato hh:mm:ss */
function ChecaHora(formNum, elemNum) {
    if (!ValidaHora(document.forms[formNum].elements[elemNum].value)) {
        alert("Por favor, preencha a hora no formato HH:mm");
        document.forms[formNum].elements[elemNum].focus();
        document.forms[formNum].elements[elemNum].select();
        return true;
    } else {
        return false;
    }
}

function ValidaHora(horaStr) {
    var datePat = /^(\d{1,2})(\/)(\d{1,2})(\/)(\d{4})$/;
    var horaPat = /^(\d{1,2})(\:)(\d{1,2})$/;
    var matchArray = horaStr.match(horaPat);

    if (matchArray == null) {
        return false;
    }
    // parse date into variables  
    minuto = matchArray[3];
    hora = matchArray[1];
    seg = matchArray[5];

    if (minuto < 0 || minuto > 59) { // check month range
        alert("Minuto Inv" + String.fromCharCode(225) + "lido!.");
        return false;
    }
    if (hora < 0 || hora > 23) {
        alert("Hora inv" + String.fromCharCode(225) + "lido.");
        return false;
    }
    if (seg < 0 || seg > 59) {
        alert("Segundo inv" + String.fromCharCode(225) + "lido.");
        return false;
    }
    return true;  // hora valida
}

//-->