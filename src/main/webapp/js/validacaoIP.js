var enabledChars1 = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
var enabledKeys2 = '8,13,37,38,39,40';

function FormatIP(field, strField, evento) {
    // verifico a tecla pressionada
    // quando ignorando, enters, backspace, etc
    var whichCode = (window.Event) ? evento.which : evento.keyCode;
    if (enabledKeys2.indexOf(whichCode) != -1) return;
    var countPoints = 0;

    for (i = 0; i < strField.length; i++) {
        mudouString = false;
        cDigit = strField.charAt(i);
        if (cDigit == '.') countPoints++;
        if (((!(cDigit in enabledChars1)) && (cDigit != '.')) || (countPoints > 3)) {
            preFix = strField.substring(0, i);
            suFix = strField.substring(i + 1, strField.length);
            str = "";
            str = str.concat(preFix, suFix);
            field.value = str;
            mudouString = true;
            if (countPoints > 3) countPoints--;
        }
        if (mudouString) strField = str;
    }

    ipElements = strField.split(".");
    if ((ipElements[(ipElements.length - 1)].length > 2) && (ipElements.length < 4))
        strField = field.value + '.';
    field.value = strField;

    field.focus();
}

// function just to check the hour format
function CheckFormatIP(field, strField) {
    error = false;
    if (strField.length < 7) {
        error = true;
    } else {
        ipElements = strField.split(".");
        if (ipElements.length < 4) error = true;
        for (c = 0; c < ipElements.length; c++)
            if (parseInt(ipElements[c]) > 255)
                error = true;
    }
    if (error) {
        field.value = "";
        field.select();
        return false;
    } else
        return true;
}

//-->