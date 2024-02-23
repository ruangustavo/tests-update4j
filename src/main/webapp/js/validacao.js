// Check browser version
var isNav4 = false, isNav5 = false, isIE4 = false
var strSeperator = "/";
// If you are using any Java validation on the back side you will want to use the / because 
// Java date validations do not recognize the dash as a valid date separator.
var vDateType = 3; // Global value for type of date format
//                1 = mm/dd/yyyy
//                2 = yyyy/dd/mm  (Unable to do date check at this time)
//                3 = dd/mm/yyyy
var vYearType = 4; //Set to 2 or 4 for number of digits in the year for Netscape
var vYearLength = 2; // Set to 4 if you want to force the user to enter 4 digits for the year before validating.
var err = 0; // Set the error code to a default of zero
if (navigator.appName == "Netscape") {
    if (navigator.appVersion < "5") {
        isNav4 = true;
        isNav5 = false;
    } else if (navigator.appVersion > "4") {
        isNav4 = false;
        isNav5 = true;
    }
} else {
    isIE4 = true;
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/
/**
 * Filtra as teclas permitidas como entrada.
 * Fun??o usada nas fun??es de formata??o de dados
 * @param tecla integer c?digo ASCII da tecla
 * @return void
 */
function teclaPermitida(tecla) {
    switch (tecla) {
        case 9: //tab
        case 35: //home
        case 36: //end
        case 37: //seta esquerda
        case 38: //seta para cima
        case 39: //seta para direita
        case 40: //seta para baixo
        case 46: //delete
            return true;
            break;
        default:
            return false;
    }
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/
function formataData(campo, prox, evento) {

    var tecla = evento.keyCode;
    if (teclaPermitida(tecla)) return false;

    var re = /[^0-9]/gi;//expressao regular rox! :P
    valor = campo.value;
    valor = valor.replace(re, "");
    tam = valor.length;

    if (tam <= 2) {
        campo.value = valor.substring(0, tam);
    } else if ((tam > 2) && (tam <= 4)) {
        campo.value = valor.substring(0, 2) + "/" + valor.substring(2, tam);
    } else if (tam >= 5) {
        campo.value = valor.substring(0, 2) + "/" + valor.substring(2, 4) + "/" + valor.substring(4, tam);
    }

    if (campo.value.length >= 10) {
        campo.value = campo.value.substring(0, 10);
        if (prox != "") {
            campo.form[prox].focus();
        }
    }

}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/
function DateFormat(vDateName, vDateValue, e, dateCheck, dateType) {
    vDateType = dateType;
// vDateName = object name
// vDateValue = value in the field being checked
// e = event
// dateCheck 
// True  = Verify that the vDateValue is a valid date
// False = Format values being entered into vDateValue only
// vDateType
// 1 = mm/dd/yyyy
// 2 = yyyy/mm/dd
// 3 = dd/mm/yyyy
//Enter a tilde sign for the first number and you can check the variable information.
    if (vDateValue == "~") {
        vDateName.value = "";
        vDateName.focus();
        return true;
    }
    var whichCode = (window.Event) ? e.which : e.keyCode;
// Check to see if a seperator is already present.
// bypass the date if a seperator is present and the length greater than 8
    if (vDateValue.length > 8 && isNav4) {
        if ((vDateValue.indexOf("-") >= 1) || (vDateValue.indexOf("/") >= 1))
            return true;
    }
//Eliminate all the ASCII codes that are not valid
    var alphaCheck = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/-";
    if (alphaCheck.indexOf(vDateValue) >= 1) {
        if (isNav4) {
            vDateName.value = "";
            vDateName.focus();
            vDateName.select();
            return false;
        } else {
            vDateName.value = vDateName.value.substr(0, (vDateValue.length - 1));
            return false;
        }
    }

    if (whichCode == 8) //Ignore the Netscape value for backspace. IE has no value
        return false;
    else {
//Create numeric string values for 0123456789/
//The codes provided include both keyboard and keypad values
        var strCheck = '47,48,49,50,51,52,53,54,55,56,57,58,59,95,96,97,98,99,100,101,102,103,104,105';
        if (strCheck.indexOf(whichCode) != -1) {
            if (isNav4) {
                if (((vDateValue.length < 6 && dateCheck) || (vDateValue.length == 7 && dateCheck)) && (vDateValue.length >= 1)) {
                    vDateName.value = "";
                    vDateName.focus();
                    vDateName.select();
                    return false;
                }
                if (vDateValue.length == 6 && dateCheck) {
                    var mDay = vDateName.value.substr(2, 2);
                    var mMonth = vDateName.value.substr(0, 2);
                    var mYear = vDateName.value.substr(4, 4)
                    //Turn a two digit year into a 4 digit year
                    if (mYear.length == 2 && vYearType == 4) {
                        var mToday = new Date();
                        //If the year is greater than 30 years from now use 19, otherwise use 20
                        var checkYear = mToday.getFullYear() + 30;
                        var mCheckYear = '20' + mYear;
                        if (mCheckYear >= checkYear)
                            mYear = '19' + mYear;
                        else
                            mYear = '20' + mYear;
                    }
                    var vDateValueCheck = mMonth + strSeperator + mDay + strSeperator + mYear;
                    if (!dateValid(vDateValueCheck)) {
                        vDateName.value = "";
                        vDateName.focus();
                        vDateName.select();
                        return false;
                    }
                    return true;
                } else {
// Reformat the date for validation and set date type to a 1
                    if (vDateValue.length >= 8 && dateCheck) {
                        if (vDateType == 1) // mmddyyyy
                        {
                            var mDay = vDateName.value.substr(2, 2);
                            var mMonth = vDateName.value.substr(0, 2);
                            var mYear = vDateName.value.substr(4, 4)
                            vDateName.value = mMonth + strSeperator + mDay + strSeperator + mYear;
                        }
                        if (vDateType == 2) // yyyymmdd
                        {
                            var mYear = vDateName.value.substr(0, 4)
                            var mMonth = vDateName.value.substr(4, 2);
                            var mDay = vDateName.value.substr(6, 2);
                            vDateName.value = mYear + strSeperator + mMonth + strSeperator + mDay;
                        }
                        if (vDateType == 3) // ddmmyyyy
                        {
                            var mMonth = vDateName.value.substr(2, 2);
                            var mDay = vDateName.value.substr(0, 2);
                            var mYear = vDateName.value.substr(4, 4)
                            vDateName.value = mDay + strSeperator + mMonth + strSeperator + mYear;
                        }
//Create a temporary variable for storing the DateType and change
//the DateType to a 1 for validation.
                        var vDateTypeTemp = vDateType;
                        vDateType = 1;
                        var vDateValueCheck = mMonth + strSeperator + mDay + strSeperator + mYear;
                        if (!dateValid(vDateValueCheck)) {
                            vDateType = vDateTypeTemp;
                            vDateName.value = "";
                            vDateName.focus();
                            vDateName.select();
                            return false;
                        }
                        vDateType = vDateTypeTemp;
                        return true;
                    } else {
                        if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >= 1)) {
                            vDateName.value = "";
                            vDateName.focus();
                            vDateName.select();
                            return false;
                        }
                    }
                }
            } else {
                // Non isNav Check
                if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >= 1)) {
                    vDateName.value = "";
                    vDateName.focus();
                    return true;
                }
// Reformat date to format that can be validated. mm/dd/yyyy
                if (vDateValue.length >= 8 && dateCheck) {
// Additional date formats can be entered here and parsed out to
// a valid date format that the validation routine will recognize.
                    if (vDateType == 1) // mm/dd/yyyy
                    {
                        var mMonth = vDateName.value.substr(0, 2);
                        var mDay = vDateName.value.substr(3, 2);
                        var mYear = vDateName.value.substr(6, 4)
                    }
                    if (vDateType == 2) // yyyy/mm/dd
                    {
                        var mYear = vDateName.value.substr(0, 4)
                        var mMonth = vDateName.value.substr(5, 2);
                        var mDay = vDateName.value.substr(8, 2);
                    }
                    if (vDateType == 3) // dd/mm/yyyy
                    {
                        var mDay = vDateName.value.substr(0, 2);
                        var mMonth = vDateName.value.substr(3, 2);
                        var mYear = vDateName.value.substr(6, 4)
                    }
                    if (vYearLength == 4) {
                        if (mYear.length < 4) {
                            vDateName.value = "";
                            vDateName.focus();
                            return true;
                        }
                    }
// Create temp. variable for storing the current vDateType
                    var vDateTypeTemp = vDateType;
// Change vDateType to a 1 for standard date format for validation
// Type will be changed back when validation is completed.
                    vDateType = 1;
// Store reformatted date to new variable for validation.
                    var vDateValueCheck = mMonth + strSeperator + mDay + strSeperator + mYear;
                    if (mYear.length == 2 && vYearType == 4 && dateCheck) {
//Turn a two digit year into a 4 digit year
                        var mToday = new Date();
//If the year is greater than 30 years from now use 19, otherwise use 20
                        var checkYear = mToday.getFullYear() + 30;
                        var mCheckYear = '20' + mYear;
                        if (mCheckYear >= checkYear)
                            mYear = '19' + mYear;
                        else
                            mYear = '20' + mYear;
                        vDateValueCheck = mMonth + strSeperator + mDay + strSeperator + mYear;
// Store the new value back to the field.  This function will
// not work with date type of 2 since the year is entered first.
                        if (vDateTypeTemp == 1) // mm/dd/yyyy
                            vDateName.value = mMonth + strSeperator + mDay + strSeperator + mYear;
                        if (vDateTypeTemp == 3) // dd/mm/yyyy
                            vDateName.value = mDay + strSeperator + mMonth + strSeperator + mYear;
                    }
                    if (!dateValid(vDateValueCheck)) {
                        vDateType = vDateTypeTemp;
                        vDateName.value = "";
                        vDateName.focus();
                        return true;
                    }
                    vDateType = vDateTypeTemp;
                    return true;
                } else {
                    if (vDateType == 1) {
                        if (vDateValue.length == 2) {
                            vDateName.value = vDateValue + strSeperator;
                        }
                        if (vDateValue.length == 5) {
                            vDateName.value = vDateValue + strSeperator;
                        }
                    }
                    if (vDateType == 2) {
                        if (vDateValue.length == 4) {
                            vDateName.value = vDateValue + strSeperator;
                        }
                        if (vDateValue.length == 7) {
                            vDateName.value = vDateValue + strSeperator;
                        }
                    }
                    if (vDateType == 3) {
                        if (vDateValue.length == 2) {
                            vDateName.value = vDateValue + strSeperator;
                        }
                        if (vDateValue.length == 5) {
                            vDateName.value = vDateValue + strSeperator;
                        }
                    }
                    return true;
                }
            }
            if (vDateValue.length == 10 && dateCheck) {
                if (!dateValid(vDateName)) {
                    vDateName.focus();
                    vDateName.select();
                }
            }
            return false;
        } else {
// If the value is not in the string return the string minus the last
// key entered.
            if (isNav4) {
                vDateName.value = "";
                vDateName.focus();
                vDateName.select();
                return false;
            } else {
                vDateName.value = vDateName.value.substr(0, (vDateValue.length - 1));
                return false;
            }
        }
    }
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/
function dateValid(objName) {
    var strDate;
    var strDateArray;
    var strDay;
    var strMonth;
    var strYear;
    var intday;
    var intMonth;
    var intYear;
    var booFound = false;
    var datefield = objName;
    var strSeparatorArray = new Array("-", " ", "/", ".");
    var intElementNr;
    var strMonthArray = new Array(12);
    strMonthArray[0] = "Jan";
    strMonthArray[1] = "Feb";
    strMonthArray[2] = "Mar";
    strMonthArray[3] = "Apr";
    strMonthArray[4] = "May";
    strMonthArray[5] = "Jun";
    strMonthArray[6] = "Jul";
    strMonthArray[7] = "Aug";
    strMonthArray[8] = "Sep";
    strMonthArray[9] = "Oct";
    strMonthArray[10] = "Nov";
    strMonthArray[11] = "Dec";
    strDate = objName;
    if (strDate.length < 1) {
        return true;
    }
    for (intElementNr = 0; intElementNr < strSeparatorArray.length; intElementNr++) {
        if (strDate.indexOf(strSeparatorArray[intElementNr]) != -1) {
            strDateArray = strDate.split(strSeparatorArray[intElementNr]);
            if (strDateArray.length != 3) {
                err = 1;
                return false;
            } else {
                strDay = strDateArray[0];
                strMonth = strDateArray[1];
                strYear = strDateArray[2];
            }
            booFound = true;
        }
    }
    if (booFound == false) {
        if (strDate.length > 5) {
            strDay = strDate.substr(0, 2);
            strMonth = strDate.substr(2, 2);
            strYear = strDate.substr(4);
        }
    }
//Adjustment for short years entered
    if (strYear.length == 2) {
        strYear = '20' + strYear;
    }
    strTemp = strDay;
    strDay = strMonth;
    strMonth = strTemp;
    intday = parseInt(strDay, 10);
    if (isNaN(intday)) {
        err = 2;
        return false;
    }
    intMonth = parseInt(strMonth, 10);
    if (isNaN(intMonth)) {
        for (i = 0; i < 12; i++) {
            if (strMonth.toUpperCase() == strMonthArray[i].toUpperCase()) {
                intMonth = i + 1;
                strMonth = strMonthArray[i];
                i = 12;
            }
        }
        if (isNaN(intMonth)) {
            err = 3;
            return false;
        }
    }
    intYear = parseInt(strYear, 10);
    if (isNaN(intYear)) {
        err = 4;
        return false;
    }
    if (intMonth > 12 || intMonth < 1) {
        err = 5;
        return false;
    }
    if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7 || intMonth == 8 || intMonth == 10 || intMonth == 12) && (intday > 31 || intday < 1)) {
        err = 6;
        return false;
    }
    if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) && (intday > 30 || intday < 1)) {
        err = 7;
        return false;
    }
    if (intMonth == 2) {
        if (intday < 1) {
            err = 8;
            return false;
        }
        if (LeapYear(intYear) == true) {
            if (intday > 29) {
                err = 9;
                return false;
            }
        } else {
            if (intday > 28) {
                err = 10;
                return false;
            }
        }
    }
    return true;
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/
function LeapYear(intYear) {
    if (intYear % 100 == 0) {
        if (intYear % 400 == 0) {
            return true;
        }
    } else {
        if ((intYear % 4) == 0) {
            return true;
        }
    }
    return false;
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/
function currencyFormat(fld, milSep, decSep, e) {
    var sep = 0;
    var key = '';
    var i = j = 0;
    var len = len2 = 0;
    var strCheck = '0123456789';
    var aux = aux2 = '';
    var whichCode = (window.Event) ? e.which : e.keyCode;
    if (whichCode == 13) return true;  // Enter
    key = String.fromCharCode(whichCode);  // Get key value from key code
    if (strCheck.indexOf(key) == -1) return false;  // Not a valid key
    len = fld.value.length;
    for (i = 0; i < len; i++)
        if ((fld.value.charAt(i) != '0') && (fld.value.charAt(i) != decSep)) break;
    aux = '';
    for (; i < len; i++)
        if (strCheck.indexOf(fld.value.charAt(i)) != -1) aux += fld.value.charAt(i);
    aux += key;
    len = aux.length;
    if (len == 0) fld.value = '';
    if (len == 1) fld.value = '0' + decSep + '0' + aux;
    if (len == 2) fld.value = '0' + decSep + aux;
    if (len > 2) {
        aux2 = '';
        for (j = 0, i = len - 3; i >= 0; i--) {
            if (j == 3) {
                aux2 += milSep;
                j = 0;
            }
            aux2 += aux.charAt(i);
            j++;
        }
        fld.value = '';
        len2 = aux2.length;
        for (i = len2 - 1; i >= 0; i--)
            fld.value += aux2.charAt(i);
        fld.value += decSep + aux.substr(len - 2, len);
    }
    return false;
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/
function textCounter(field, maxlimit) {
    if (field.value.length > maxlimit) // if too long...trim it!
        field.value = field.value.substring(0, maxlimit);
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/

var strSeparators = new Array(":"); // separators
var enabledChars = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
enabledChars = enabledChars.concat(strSeparators);
var enabledKeys = '8,13,37,38,39,40';

//M?scara para validar hora (HH)
function Numerico(field, strField, evento) {
    // verifico a tecla pressionada
    // quando ignorando, enters, backspace, etc
    var whichCode = (window.Event) ? evento.which : evento.keyCode;
    if (enabledKeys.indexOf(whichCode) != -1) return;

    for (i = 0; i < strField.length; i++) {
        mudouString = false;
        cDigit = strField.charAt(i);
        if (!pertence(cDigit, enabledChars)) {
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

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/

//Checa se a hora (HH) ? v?lida
function ChecaNumerico(field, strField) {
    error = false;
    if (strField.length < 1) {
        error = true;
    }
    if (error) {
        field.value = "";
        return false;
    } else
        return true;
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        		|
 |      -Parametro2:                                        		|
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/

// funcao auxiliar para verificar se um elemento pertence ao conjunto
function pertence(elemento, conjunto) {
    for (i = 0; i < conjunto.length; i++)
        if (conjunto[i] == elemento) return true;
    return false;
}

/*------------------------------------------------------------------*
 | Nome........:                                                    |
 | Descricao...:                                                    |
 | Paramentros.:                                                    |
 |		-Parametro1:                                        |
 |              -Parametro2:                                        |
 | Exemplo.....:                                                    |
 | Retorno.....:                                                    |
 *------------------------------------------------------------------*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////
////////??????????????????????????? Criado por : Fl?vio Theruo Kaminisse????????????????????????? 
////////
////////???????????????????????????????? email: flavio@japs.etc.br??????????????????????????????? 
////////
////////                                 url: http://www.japs.etc.br
////////
////////????????????????????????????????? Data Cria??o : 30/08/2005?????????????????????????????? 
////////
////////????????????????????????????????????????????????????????????????????????????????????????? 
////////
////////??????????????????????????? - Compat?vel com Firefox, Opera e MSIE.?????????????????????? 
////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//Fun??o que valida a data
function validaData(obj, msg) {
    var date = obj.value;
    if (date != "") {
        var array_data = new Array;
        var ExpReg = new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[2-9][0-9]{3}");
        //vetor que contem o dia o mes e o ano
        array_data = date.split("/");
        erro = false;
        //Valido se a data esta no formato dd/mm/yyyy e se o dia tem 2 digitos e esta entre 01 e 31
        //se o mes tem d2 digitos e esta entre 01 e 12 e o ano se tem 4 digitos e esta entre 2000 e 9999
        if (date.search(ExpReg) == -1)
            erro = true;
        //Valido os meses que nao tem 31 dias com execao de fevereiro
        else if (
            (
                (array_data[1] == 4) ||
                (array_data[1] == 6) ||
                (array_data[1] == 9) ||
                (array_data[1] == 11)
            ) &&
            (array_data[0] > 30)
        ) {
            erro = true;
        }
        //Valido o mes de fevereiro
        else if (array_data[1] == 2) {
            //Valido ano que nao e bissexto
            if ((array_data[0] > 28) && ((array_data[2] % 4) != 0))
                erro = true;
            //Valido ano bissexto
            if ((array_data[0] > 29) && ((array_data[2] % 4) == 0))
                erro = true;
        }
        if (erro) {
            alert(msg);
            obj.value = "";
        }
    }
}

//-->