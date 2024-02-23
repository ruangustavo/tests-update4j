var strSeparators = new Array(":"); // separators
var enabledChars = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
enabledChars = enabledChars.concat(strSeparators);
var enabledKeys = '8,13,37,38,39,40';

function FormatHour(field, strField, evento, ignoreEvent) {
    // verifico a tecla pressionada
    // quando ignorando, enters, backspace, etc
    var whichCode;
    if (ignoreEvent != null && ignoreEvent)
        whichCode = "1";
    else
        whichCode = (window.Event) ? evento.which : evento.keyCode;

    if (enabledKeys.indexOf(whichCode) != -1) return;

    for (i = 0; i < strField.length; i++) {
        mudouString = false;
        cDigit = strField.charAt(i);
        if (!(cDigit in enabledChars)) {
            preFix = strField.substring(0, i);
            suFix = strField.substring(i + 1, strField.length);
            str = "";
            str = str.concat(preFix, suFix);
            field.value = str;
            mudouString = true;
        }
        if (mudouString) strField = str;
    }
    if (strField.length > 1) {
        preFix = strField.substring(0, 2) + ":";
        for (i = 0; i < strField.length; i++) {
            mudouString = false;
            cDigit = strField.charAt(i);
            if (!(cDigit in enabledChars)) {
                preFix = strField.substring(0, i);
                suFix = strField.substring(i + 1, strField.length);
                str = "";
                str = str.concat(preFix, suFix);
                field.value = str;
                mudouString = true;
            }
            if (mudouString) strField = str;
        }
        suFix = strField.substring(2, strField.length);
        strField = "";
        field.value = strField.concat(preFix, suFix);
    }
    field.focus();
}

// function just to check the hour format
function CheckFormatHour(field, strField) {
    error = false;
    if (strField.length < 5) {
        error = true;
    } else {
        hourElements = strField.split(strSeparators[0]);
        if ((parseInt(hourElements[0]) > 23) || (parseInt(hourElements[1]) > 59)) error = true;
    }
    if (error) {
        field.value = "";
        return false;
    } else
        return true;
}


//Máscara para validar hora (HH)
function FormatHH(field, strField, evento) {
    // verifico a tecla pressionada
    // quando ignorando, enters, backspace, etc
    var whichCode = (window.Event) ? evento.which : evento.keyCode;
    if (enabledKeys.indexOf(whichCode) != -1) return;

    for (i = 0; i < strField.length; i++) {
        mudouString = false;
        cDigit = strField.charAt(i);
        if (!(cDigit in enabledChars)) {
            preFix = strField.substring(0, i);
            suFix = strField.substring(i + 1, strField.length);
            str = "";
            str = str.concat(preFix, suFix);
            field.value = str;
            mudouString = true;
        }
        if (mudouString) strField = str;
    }

    field.focus();
}

//Checa se a hora (HH) é válida
function CheckFormatHH(field, strField) {
    error = false;
    if (strField.length < 1) {
        error = true;
    } else {
        if (parseInt(strField) > 23) error = true;
    }
    if (error) {
        field.value = "";
        return false;
    } else
        return true;
}


//-->