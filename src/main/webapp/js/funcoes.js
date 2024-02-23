//<!--
/*-------------------------------------------------------------------*
 | escondeDica/mostraDica  Esconde e retorna dicas de preenchimento  |
 |						   de campos em para formulários             |
 *-------------------------------------------------------------------*/
var UI_PORTUGUES = 1;

function escondeDica(layer) {
    escondeLayer(layer);
}

function escondeLayer(layer) {
    obj = document.getElementById(layer);
    obj.style.display = 'none';
}

function mostraLayer(layer) {
    obj = document.getElementById(layer);
    obj.style.display = 'block';
}

function mostraDica(text, layer) {
    obj = document.getElementById(layer);
    obj.innerHTML = text;
    obj.style.display = 'block';
}

function CheckIP(ip) {
    var reg = /^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})$/;
    return reg.test(ip);
}

/*-----------------------------------------------------------------*
 | validaident  Retorna True se a String dada for CPF,CNPJ OU CEI  |
 |        validos                                            |
 *-----------------------------------------------------------------*/

function validaIdent(campo) {
    var TipoIdent, Ident, Dig;


    Ident = campo.value;
    tamanho = Ident.length;
    if (tamanho != 14 && tamanho != 12 && tamanho != 11) {
        alert("Informe CNPJ com 14 dígitos, CEI com 12 dígitos.");
        return false;
    }
    if (tamanho == 14) {
        TipoIdent = "1"
    }
    if (tamanho == 12) {
        TipoIdent = "2"
    }
    if (tamanho == 11) {
        TipoIdent = "3"
    }

    if (TipoIdent == "1") {
        Dig = Ident.substring(Ident.length - 2, Ident.length);
        Ident = Ident.substring(0, 12);
        if (CalculaDigitoMod11(Ident, 2, 9) != Dig) {
            alert("CNPJ Inválido.");
            campo.focus;
            return false;
        }
    } else if (TipoIdent == "2") {
        if (!gfunCalcCEI(Ident)) {
            alert("CEI Inválido.");
            campo.focus();
            return false;
        }
    } else {
        Dig = Ident.substring(Ident.length - 2, Ident.length);
        Ident = Ident.substring(0, 9);
        if (CalculaDigitoMod11(Ident, 2, 12) != Dig) {
            alert("CPF Inválido.");
            campo.focus();
            return false;
        }
    }

    return true;
}


/* *****************************************************************
 * Valida a entrada dos dados na tela de login de empresas
 *
 *
 *******************************************************************/

function validaEntradaEmp(campo) {
    var cnpj = campo.cnpj;
    var senha = campo.senha;
    if (cnpj.value == "") {
        alert("Por favor, digite o CNPJ/CEI!!!");
        campo.cnpj.focus();
        return false;
    } else if (!validaIdent(cnpj)) {
        return false;
    } else if (senha.value == "") {
        alert("Por favor, digite sua senha!!!");
        campo.senha.focus();
        return false;
    }
    return true;
}

/*-----------------------------------------------------------------*
 | ContidoNoDominio    Retorna True se a String dada só contiver   |
 |                     caracteres do domínio dado                  |
 *-----------------------------------------------------------------*/

function ContidoNoDominio(StrDado, Dominio) {
    var i, j;

    if (StrDado == "") return false;

    for (i = 0; i < StrDado.length; i++) {
        for (j = 0; j < Dominio.length; j++) {
            if (StrDado.substr(i, 1) == Dominio.substr(j, 1)) break;
        }
        if (j >= Dominio.length) return false;
    }
    return true
}

/*-----------------------------------------------------------------*
 | ContemDominio    Retorna True se a String dada contiver algum   |
 |                  caractere do domínio dado                      |
 *-----------------------------------------------------------------*/
function ContemDominio(StrDado, Dominio) {
    var i, j;

    if (StrDado != "") {
        for (i = 0; i < StrDado.length; i++) {
            for (j = 0; j < Dominio.length; j++) {
                if (StrDado.substr(i, 1) == Dominio.substr(j, 1)) return true;
            }
        }
    }

    return false;
}

/*-----------------------------------------------------------------*
 | IsStrNum     Retorna True se a String dada só contiver números  |
 |                                                                 |
 *-----------------------------------------------------------------*/
function IsStrNum(Dado) {
    return ContidoNoDominio(Dado, " 0123456789");
}

/*-----------------------------------------------------------------*
 | IsStrInt	    Retorna True se a String dada só contiver          |
 |              Caracteres para Número inteiro                     |
 *-----------------------------------------------------------------*/
function IsStrInt(Dado) {
    return ContidoNoDominio(Dado, " +-0123456789");
}

/*-----------------------------------------------------------------*
 | IsStrFloat   Retorna True se a String dada só contiver          |
 |              Caracteres para Número em Ponto-Flutuante          |
 *-----------------------------------------------------------------*/
function IsStrFloat(Dado) {
    return ContidoNoDominio(Dado, " +-0123456789Ee,.");
}

/*-----------------------------------------------------------------*
 | IsStrCurr    Retorna True se a String dada só contiver          |
 |              Caracteres para Número Currency                    |
 *-----------------------------------------------------------------*/
function IsStrCurr(Dado) {
    return ContidoNoDominio(Dado, " +-0123456789,.");
}

function ehData(obj) {
    try {
        var d, m, a;
        var partes = obj.value.split(" ")[0].split("/");
        if (linguagemUI == UI_PORTUGUES) {
            d = partes[0];
            m = partes[1];
        } else {
            d = partes[1];
            m = partes[0];
        }
        a = partes[2];

        return !((isNaN(parseInt(d)) || isNaN(parseInt(m)) ||
                isNaN(parseInt(a))) ||
            ((a < 1500) || (a > 9999)) ||
            ((m < 1) || (m > 12)) ||
            ((d < 1) || (d > 31)) ||
            ((m == 2) && (d > 28) && (a % 4 != 0)) ||
            ((m == 2) && (d > 29) && (a % 4 == 0)) ||
            ((d > 30) && (m == 4) || (d > 30) && (m == 6) ||
                (d > 30) && (m == 9) || (d > 30) && (m == 11)))
    } catch (e) {
        return false;
    }
}

/*-----------------------------------------------------------------*
 | valData    Retorna True se a String dada for uma data válida  |
 |              no formato DD/MM/AAAA                              |
 *-----------------------------------------------------------------*/
function valdata(valor) {

    var DiasMes = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var Dia, Mes, Ano;
    var Result = false;

    // Pré-analisa o String:
    if (valor != "") {
        if ((valor.length == 10) && (valor.substr(2, 1) == "/") && (valor.substr(5, 1) == "/")) {
            // Levanta Campos:
            if (IsStrNum(valor.substr(0, 2))) Dia = valor.substr(0, 2);
            if (IsStrNum(valor.substr(3, 2))) Mes = valor.substr(3, 2);
            if (IsStrNum(valor.substr(6, 4))) Ano = valor.substr(6, 4);

            // Analisa Ano e Mês:
            if ((Ano > 0) && (Mes >= 1) && (Mes <= 12)) {
                // Analisa Dia:

                if ((Dia >= 1) && (Dia <= DiasMes[Mes - 1])) {
                    // Analisa os casos não-bissextos:

                    if ((Mes == 2) && ((Ano % 4 != 0) || (Ano % 100 == 0) && (Ano % 400 != 0))) {
                        if (Dia <= 28) Result = true;
                    } else {
                        Result = true;
                    }
                }
            }
        }
    }

    return Result;
}

function checaHora(obj) {
    var mskHora = /^(([0-1]?[0-9])|([2][0-3])):([0-5][0-9])$/;
    var hora = obj.value.split(" ");
    hora = (hora.length == 0) ? hora[0] : hora[1];
    return mskHora.test(hora);
}

/*-----------------------------------------------------------------*
 | IsStrHora    Retorna True se a String dada for uma data válida  |
 |              no formato HH:MM ou HH:MM:SS                       |
 *-----------------------------------------------------------------*/
function valHora(Dado) {
    var Hor, Min, Seg;
    var Result = false;

    // Pré-analisa o String:
    if (Dado != "") {
        if (((Dado.length == 5) || (Dado.length == 8)) && (Dado.substr(2, 1) == ":")) {
            // Levanta Campos:
            if (IsStrNum(Dado.substr(0, 2))) Hor = Dado.substr(0, 2); else Hor = -1;
            if (IsStrNum(Dado.substr(3, 2))) Min = Dado.substr(3, 2); else Min = -1;

            // Analisa a Hora:
            if ((Hor >= 0) && (Hor <= 23)) {
                // Analisa o Minuto:
                if ((Min >= 0) && (Min <= 59)) {
                    // Verifica se tem segundo:
                    if (Dado.length == 8) {
                        // Pré-analisa:
                        if (Dado.substr(5, 1) == ":") {
                            // Levanta e verifica segundos:
                            if (IsStrNum(Dado.substr(6, 2))) Seg = Dado.substr(6, 2); else Seg = -1;
                            if ((Seg >= 0) && (Seg <= 59)) {
                                Result = true;
                            }
                        }
                    } else {
                        Result = true;
                    }
                }
            }
        }
    }
    return Result;
}

/*-----------------------------------------------------------------*
 | SeparaNomeArq       Separa o Nome de Arquivo do Path completo   |
 |                                                                 |
 *-----------------------------------------------------------------*/
function SeparaNomeArq(PathDado) {
    var i

    if (PathDado.length == 0) return "";

    for (i = PathDado.length - 1; i >= 0; i--) {
        if (PathDado.substr(i, 1) == "\\" || PathDado.substr(i, 1) == ":") {
            return PathDado.substr(i + 1);
        }
    }
    return PathDado;
}

/*-----------------------------------------------------------------*
 | StrD      Acerta a String na Largura dada com                   |
 |           Alinhamento à Direita:                                |
 *-----------------------------------------------------------------*/
function StrD(Dado, Larg) {
    var Result;
    var i;

    if (Dado.length >= Larg) {
        Result = Dado.substr(Dado.length - Larg, Larg);
    } else {
        Result = "";
        for (i = Larg - Dado.length; i > 0; i--) {
            Result = Result + " ";
        }
        Result = Result + Dado;
    }
    return Result;
}

/*-----------------------------------------------------------------*
 | StrE      Acerta a String na Largura dada com                   |
 |           Alinhamento à Esquerda:                               |
 *-----------------------------------------------------------------*/
function StrE(Dado, Larg) {
    var Result;
    var i;

    if (Dado.length >= Larg) {
        Result = Dado.substr(0, Larg);
    } else {
        Result = Dado;
        for (i = Larg - Dado.length; i > 0; i--) {
            Result = Result + " ";
        }
    }
    return Result;
}

/*-----------------------------------------------------------------*
 | StrNum    Retorna o valor Numérico em String Dado,              |
 |           formatado na Largura dada:                            |
 *-----------------------------------------------------------------*/
function StrNum(Dado, Larg) {
    var Result;
    var i;

    if (Dado.length >= Larg) {
        Result = Dado.substr(Dado.length - Larg, Larg);
    } else {
        Result = "";
        for (i = Larg - Dado.length; i > 0; i--) {
            Result = Result + "0";
        }
        Result = Result + Dado;
    }
    return Result;
}

/*-----------------------------------------------------------------*
 | PassaDominio        Retorna a String dada, somente com os       |
 |                     caracteres do domínio dado                  |
 *-----------------------------------------------------------------*/
function PassaDominio(StrDado, Dominio) {
    var i, j, c;
    var Result;

    Result = "";
    for (i = 0; i < StrDado.length; i++) {
        c = StrDado.substr(i, 1);
        for (j = 0; j < Dominio.length; j++) {
            if (c == Dominio.substr(j, 1)) break;
        }
        if (j < Dominio.length) {
            Result = Result + c;
        }
    }
    return Result;
}


/*-----------------------------------------------------------------*
 | BloqueiaDominio     Retorna a String dada retirando os          |
 |                     caracteres do domínio dado                  |
 *-----------------------------------------------------------------*/
function BloqueiaDominio(StrDado, Dominio) {
    var i, j;

    Result = "";
    for (i = 0; i < StrDado.length; i++) {
        c = StrDado.substr(i, 1);
        for (j = 0; j < Dominio.length; j++) {
            if (c == Dominio.substr(j, 1)) break;
        }
        if (j >= Dominio.length) {
            Result = Result + c;
        }
    }
    return Result;
}

/*******************************************************************
 *  Funções de Filtro para uso com Text-Boxes:                     *
 *******************************************************************/
function FiltroCrase(Objeto) {//onkeyup="FiltroCrase(this)"
    Objeto.value = PassaDominio(Objeto.value, "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,;.-()?!@#$%[]{}áéíóúãõàâêô <>/");
}

function FiltroNum(Objeto) {//onkeyup="FiltroNum(this)"
    Objeto.value = PassaDominio(Objeto.value, "0123456789");
}

function FiltroNumIp(Objeto) {//onkeyup="FiltroNum(this)"
    Objeto.value = PassaDominio(Objeto.value, "0123456789.");
}

function FiltroInt(Objeto) {//onkeyup="FiltroInt(this)"
    Objeto.value = PassaDominio(Objeto.value, "0123456789-");
}

function FiltroReal(Objeto) {//onkeyup="FiltroReal(this)"
    Objeto.value = PassaDominio(Objeto.value, "0123456789\,");
}

function FiltroData(Objeto) {//onkeyup="FiltroData(this)"
    Objeto.value = PassaDominio(Objeto.value, "0123456789/");
}

function FiltroHora(Objeto) {//onkeyup="FiltroHora(this)"
    Objeto.value = PassaDominio(Objeto.value, "0123456789:");
}

function FiltroTel(Objeto) {//onkeyup="FiltroTel(this)"
    Objeto.value = PassaDominio(Objeto.value, "0123456789()-");
}

function toMaior(Objeto) {//onkeyup="toMinus(this)"
    Objeto.value = Objeto.value.toUpperCase();
}

function toMinus(Objeto) {//onkeyup="toMaior(this)"
    Objeto.value = Objeto.value.toLowerCase();
}

function FiltroFloat(Objeto) {
    Objeto.value = PassaDominio(Objeto.value, "0123456789+-Ee,.");
}

function FiltroUp(Objeto) {
    Objeto.value = Objeto.value.toUpperCase();
}

function FiltroMaxValor(Objeto, teto) {
    if (Objeto.value > teto) {
        Objeto.value = teto;
    }
}

//limita tamanho para textarea
//-----------------------------------------------------------------------
function fMaxTamCampo(TamMax, ValCampo) {
    Campo = ValCampo.value
    TamanhoCampo = Campo.length
    if (TamanhoCampo > TamMax) {
        ValorCampo = Campo.substring(0, TamMax)
        ValCampo.value = ValorCampo
        alert("O limite máximo do campo é de " + TamMax + " caracteres.")
    }
}

//-----------------------------------------------------------------------


function ValidaEMail(EMail) {
    var reg2 = /^([0-9a-zA-Z]+([_.-]?[0-9a-zA-Z]+)*@[0-9a-zA-Z]+[0-9,a-z,A-Z,.,-]*(.){1}[a-zA-Z]{2,4})+$/; // valid
    return reg2.test(EMail);
}

/*-----------------------------------------------------------------*
 | isNumber		  Retorna True se o String dada for um número      |
 |                com casas decimais dadas.                        |
 *-----------------------------------------------------------------*/
function isNumber(sNumero, iDecimais) {
    var bRet
    var i
    bRet = true
    if (iDecimais > 0) {
        if (sNumero.length < iDecimais + 2 || (sNumero.indexOf(".", 0) == -1 && sNumero.indexOf(",", 0) == -1))
            bRet = false
    }
    if (bRet) {
        i = 0
        while (i < sNumero.length && bRet) {
            if (iDecimais > 0) {
                if (i == sNumero.length - (iDecimais + 1)) {
                    if (sNumero.charAt(i) != "." && sNumero.charAt(i) != ",")
                        bRet = false
                } else {
                    if (sNumero.charAt(i) < "0" || sNumero.charAt(i) > "9")
                        bRet = false
                }
            } else {
                if (sNumero.charAt(i) < "0" || sNumero.charAt(i) > "9")
                    bRet = false
            }
            i++
        }
    }
    return bRet
}

/*
 Nome........: FmtData
 Descricao...: Insere a máscara de data no campo
 Paramentros.: Dado
 Retorno.....: Retorna o conteúdo formatado em dd/mm/yyyy, não permitindo a digitação
               de caracteres alfa 
*/

function FmtData(Dado) {
    var Result = Dado;

    for (i = 1; i <= Dado.length; i++) {
        if (i == 2) {
            Result = Dado.substr(0, 2) + "/" + Dado.substr(2, i);
        }
        if (i >= 4) {
            Result = Dado.substr(0, 2) + "/" + Dado.substr(2, 2) + "/" + Dado.substr(4, 4);
        }
    }
    return Result;
}

/*
 Nome........: FmtDataMesAno
 Descricao...: Insere a máscara de data no campo
 Paramentros.: Dado
 Retorno.....: Retorna o conteúdo formatado em mm/yyyy, não permitindo a digitação
               de caracteres alfa 
*/
function FmtDataMesAno(Dado) {
    var Result = Dado;

    for (i = 1; i <= Dado.length; i++) {
        if (i == 2) {
            Result = Dado.substr(0, 2) + "/" + Dado.substr(2, i);
        }
        if (i > 2) {
            Result = Dado.substr(0, 2) + "/" + Dado.substr(2, 4);
        }
    }
    return Result;
}

/*
Nome........: FmtHora
Descricao...: Insere a máscara de hora no campo
Paramentros.: Dado
Retorno.....: Retorna o conteúdo formatado em hh:mm, não permitindo a digitação
             de caracteres alfa
*/

function FmtHora(Dado) {
    var Result = Dado;

    for (i = 1; i <= Dado.length; i++) {

        if (i >= 3) {
            Result = Dado.substr(0, 2) + ":" + Dado.substr(2, 2);
        }
    }
    return Result;
}

var bPula = true;

function fAtuPulaBlur() {
    bPula = false;
}

function fAtuPulaKeyPress() {
    bPula = true;
    return;
}


function fPulaCampo(campo1, campo2, iTam, tpcampo) {
    if (bPula) {

        if (tpcampo == "data") {
            Filtro(campo1, 'data');
        }
        if (tpcampo == "hora") {
            Filtro(campo1, 'hora');
        }
        if (campo1.value.length >= iTam) {
            campo2.focus();
        }

    }

    return;

}


/*-----------------------------------------------------------------*
 | CalculaDigitoMod11(Dado, NumDig, LimMult)             |
 |    Retorna o(s) NumDig Dígitos de Controle Módulo 11 do	   	   |
 |	  Dado, limitando o Valor de Multiplicação em LimMult:         |
 |                                     |
 |		    Números Comuns::   			iDigSaida	 iCod          |
 |        CGC               2        9       |
 |        CPF               2       12       |
 |        C/C,Age - CAIXA       1        9           |
 |			  habitação/bloqueto		  1 		   9           |
 *-----------------------------------------------------------------*/
function CalculaDigitoMod11(Dado, NumDig, LimMult) {
    var Mult, Soma, i, n;

    for (n = 1; n <= NumDig; n++) {
        Soma = 0;
        Mult = 2;
        for (i = Dado.length - 1; i >= 0; i--) {
            Soma += (Mult * parseInt(Dado.charAt(i)));
            if (++Mult > LimMult) Mult = 2;
        }
        Dado += ((Soma * 10) % 11) % 10;
    }
    return Dado.substr(Dado.length - NumDig, NumDig);
}

function CalculaDigitoMod10(sValor) {
    mult = 2
    soma = 0
    str = new String()
    sValor = sZapDummy(sValor)

    for (t = sValor.length; t >= 1; t--) {
        str = (mult * parseInt(sMid(sValor, t, 1))) + str
        mult--
        if (mult < 1) mult = 2
    }

    for (t = 1; t <= str.length; t++)
        soma = soma + parseInt(sMid(str, t, 1))
    soma = soma % 10
    if (soma != 0)
        soma = 10 - soma
    str = soma   //casting
    return str
}


function Mod10(valor) {
    val = valor.substring(0, valor.length - 1)
    dig = valor.substring(valor.length - 1, valor.length)
    str = new String
    fator = 2
    soma = 0
    for (i = val.length; i > 0; i--) {
        str = fator * parseInt(val.substring(i, i - 1)) + str
        fator--
        if (fator < 1) fator = 2
    }
    for (i = 0; i < str.length; i++) soma = soma + parseInt(str.charAt(i))
    soma = soma % 10
    if (soma != 0) soma = 10 - soma
    str = soma //aqui existe uma espécie de "casting" (conversão)
    return str == dig
}

function isBissexto(iAno) {
    var bRet
    bRet = false
    if (iAno % 4 == 0 && (iAno % 100 != 0 || iAno % 400 == 0))
        bRet = true
    return bRet
}

function sRight(sExpressao, iNumeros) {
    if (sExpressao.length >= iNumeros) return sExpressao.substring(sExpressao.length - iNumeros, sExpressao.length)
}

function sLeft(sExpressao, iNumeros) {
    if (sExpressao.length >= iNumeros) return sExpressao.substring(0, iNumeros)
}

function sMid(sExpressao, iNumeros, iTamanho) {
    var aux = new String()
    if ((sExpressao.length >= iNumeros) && (iNumeros >= 0) && (iTamanho > 0)) {
        iNumeros--
        aux = sExpressao.substring(iNumeros, iNumeros + iTamanho)
    }
    return aux
}

function sZapDummy(sStringNum) {
    var sAux = new String()
    for (t = 1; t <= sStringNum.length; t++)
        if (!isNaN(parseInt(sMid(sStringNum, t, 1))))
            sAux = sAux + sMid(sStringNum, t, 1)
    return sAux
}

function Filtro(Objeto, tpCampo) {

    if (navigator.appName.substr(0, 9) == "Microsoft") {
        Objeto.value = PassaDominio(Objeto.value, "0123456789");
        if (tpCampo == "data") {
            Objeto.value = FmtData(Objeto.value);
        }
        if (tpCampo == "DataMesAno") {
            Objeto.value = FmtDataMesAno(Objeto.value);
        }

        if (tpCampo == "valor") {
            Objeto.value = FmtCurr(Objeto.value);
        }
        if (tpCampo == "hora") {
            Objeto.value = FmtHora(Objeto.value);
        }
    }
}


function FmtCurr(Dado) {
    var Result, i;

    if (Dado.length > 2) {
        Result = "," + Dado.substr(Dado.length - 2, 2);
        for (i = 5; i <= Dado.length; i += 3) {
            Result = Dado.substr(Dado.length - i, 3) + Result;
            if (Dado.length > i) Result = "." + Result;
        }
        Result = Dado.substr(0, Dado.length - i + 3) + Result;
    } else {
        Result = Dado;
    }
    return Result;
}

function TiraPontos(NumeroFormatado) {
    var s
    s = NumeroFormatado.split(".");
    return s.join("");
}

function TiraVirgula(NumeroFormatado) {
    var s
    s = NumeroFormatado.split(",");
    return s.join("");
}

/* 
  Nome: gfunCalcCEI
  Descricao: Verifica se o nro do CEI eh valido
  Parametros: Numero do CEI sem Formatacao
*/
function gfunCalcCEI(VsCEI) {
    var vsAux;
    var vsNumVerCalc;
    var vsAuxCEI;
    var vsAuxNumVer;
    var vsMult;
    var viConcat;
    var viDigitoAux;
    var viDigito;
    var i;

    //gfunCalcCEI = False
    //CEI tem que ter 12 caracteres
    if (VsCEI.length != 12)
        return false;

    vsNumVerCalc = "74185216374";
    viConcat = 0
    for (i = 0; i < 11; i++) {
        vsAuxCEI = VsCEI.charAt(i);
        vsAuxNumVer = vsNumVerCalc.charAt(i);
        vsMult = eval(vsAuxCEI) * eval(vsAuxNumVer);
        viConcat = viConcat + vsMult;

    }

    //tranforma para string
    viConcat = viConcat + ""

    //Pega o Último(1) e o Penultimo(2) número da variavel concatenada para formar digito
    viDigitoAux = eval(viConcat.charAt(viConcat.length - 1)) + eval(viConcat.charAt(viConcat.length - 2))

    if ((viDigitoAux >= 11) && (viDigitoAux <= 18))
        viDigito = 20 - viDigitoAux;
    else {
        if (viDigitoAux == 10)
            viDigito = 1;
        else
            viDigito = 10 - viDigitoAux;
    }


    //Condição para atender ao SFG. Aceitar o digito informado (0 ou 1),
    //mesmo que o resultado do calculo seja igual a 1.
    if ((viDigitoAux == 10) && (VsCEI.charAt(11) < "2"))
        viDigito = VsCEI.charAt(11);


    //verifica se o CEI informado é = ao calculo efetuado
    if (VsCEI.charAt(11) != viDigito)
        return false;

    return true
}

function printit() {
    if (window.print) {
        window.print();
    } else {
        var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
        document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
        WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box
        WebBrowser1.outerHTML = "";
    }
}

function fechar(thislayer) {
    document.location.href = "nada.htm";
    menu = window.parent.document.all[thislayer];
    menu.style.visibility = "hidden";
    menu.style.width = 0;
    menu.style.height = 0;
    window.parent.execScript("ShowCombos(true)", "javascript");
    if (window.parent.document.location.href.indexOf("atendimento.asp") != -1) {
        if (window.parent.document.f.cpf.disabled == false) {
            window.parent.document.f.cpf.focus();
            window.parent.document.f.cpf.select();
        }
    }
}

function abrir(url, tit, w, h, sc) {
    jan = window.open(url, tit, "toolbar=0,scrollbars=" + sc + ",status=0,width=" + w + ",height=" + h + ",resizable=0");
    if (parseInt(navigator.appVersion) >= 4) {
        jan.moveTo((window.screen.width - w) / 2, (window.screen.height - h) / 2);
    }
}


function SaltaCampo(campo, prox, tammax, teclapres) {
    var tecla = teclapres.keyCode;
    var vr, tam
    vr = document.forms[0].elements[campo].value;
    tam = vr.length;
    if (tecla != 0 && tecla != 9 && tecla != 16) {
        if (tam == tammax)
            document.forms[0].elements[prox].focus();
    }
}

function FormataData(campo, teclapres) {
    var tecla = teclapres.keyCode;
    var vr, tam;
    vr = document.forms[0].elements[campo].value;
    vr = vr.replace("/", "");
    vr = vr.replace("/", "");
    tam = vr.length + 1;
    if (tecla != 9 && tecla != 8) {
        if (tam > 2 && tam < 5)
            document.forms[0].elements[campo].value = vr.substr(0, tam - 2) + '/' + vr.substr(tam - 2, tam);
        if (tam >= 5 && tam <= 10)
            document.forms[0].elements[campo].value = vr.substr(0, 2) + '/' + vr.substr(2, 2) + '/' + vr.substr(4, 4);
    }
}

function FormataHora(campo, teclapres) {
    var tecla = teclapres.keyCode;
    var vr, tam;
    vr = document.forms[0].elements[campo].value;
    vr = vr.replace(":", "");
    tam = vr.length + 1;
    if (tecla != 9 && tecla != 8) {
        if (tam > 2 && tam < 4)
            document.forms[0].elements[campo].value = vr.substr(0, tam - 1) + ':' + vr.substr(tam - 1, tam);
    }
}

function dataMenor(dInicio, dFim) {
    try {
        var a1 = dInicio.split("/");
        var a2 = dFim.split("/");
        if (a1.length < 3 || a2.length < 3)
            return false;
        var dtIni = a1[2] + "/" + ((a1[1].length < 2) ? "0" : "") + a1[1] + "/" + ((a1[0].length < 2) ? "0" : "") + a1[0];
        var dtFim = a2[2] + "/" + ((a2[1].length < 2) ? "0" : "") + a2[1] + "/" + ((a2[0].length < 2) ? "0" : "") + a2[0];

        return (dtIni <= dtFim);
    } catch (e) {
        return false;
    }
}

function horaMenor(hIni, hFim) {
    try {
        var a1 = hIni.split(":");
        var a2 = hFim.split(":");
        if (a1.length < 2 || a2.length < 2)
            return false;
        var dtIni = ((a1[1].length < 2) ? "0" : "") + a1[1] + ":" + ((a1[0].length < 2) ? "0" : "") + a1[0];
        var dtFim = ((a2[1].length < 2) ? "0" : "") + a2[1] + ":" + ((a2[0].length < 2) ? "0" : "") + a2[0];
        if (a1.length == 3 && a2.length == 3) {
            dtIni = ((a1[2].length < 2) ? "0" : "") + a1[2] + dtIni
            dtFim = ((a2[2].length < 2) ? "0" : "") + a2[2] + dtFim
        }

        return (dtIni <= dtFim);
    } catch (e) {
        return false;
    }
}

function acentuaHTML(str) {
    var ISO8859_1_ARRAY =
        [["&amp;", "&"], // commercial and
            ["&nbsp;", " "], // non-breaking space
            ["&deg;", "°"], // degree sign
            ["&plusmn;", "177"], // plus-minus sign = plus-or-minus sign
            ["&sup2;", "²"], // superscript two = superscript digit two = squared
            ["&sup3;", "³"], // superscript three = superscript digit three = cubed
            ["&ccedil;", "184"], // cedilla = spacing cedilla
            ["&frac14;", "¼"], // vulgar fraction one quarter = fraction one quarter
            ["&frac12;", "½"], // vulgar fraction one half = fraction one half
            ["&frac34;", "¾"], // vulgar fraction three quarters = fraction three quarters
            ["&Agrave;", "À"], // À - uppercase A, grave accent
            ["&Aacute;", "Á"], // Á - uppercase A, acute accent
            ["&Acirc;", "Â"], // Â - uppercase A, circumflex accent
            ["&Atilde;", "Ã"], // Ã - uppercase A, tilde
            ["&Auml;", "Ä"], // Ä - uppercase A, umlaut
            ["&Aring;", "Å"], // Å - uppercase A, ring
            ["&Ccedil;", "Ç"], // Ç - uppercase C, cedilla
            ["&Egrave;", "È"], // È - uppercase E, grave accent
            ["&Eacute;", "É"], // É - uppercase E, acute accent
            ["&Ecirc;", "Ê"], // Ê - uppercase E, circumflex accent
            ["&Euml;", "Ë"], // Ë - uppercase E, umlaut
            ["&Igrave;", "Ì"], // Ì - uppercase I, grave accent
            ["&Iacute;", "Í"], // Í - uppercase I, acute accent
            ["&Icirc;", "Î"], // Î - uppercase I, circumflex accent
            ["&Iuml;", "Ï"], // Ï - uppercase I, umlaut
            ["&Ntilde;", "Ñ"], // Ñ - uppercase N, tilde
            ["&Ograve;", "Ò"], // Ò - uppercase O, grave accent
            ["&Oacute;", "Ó"], // Ó - uppercase O, acute accent
            ["&Ocirc;", "Ô"], // Ô - uppercase O, circumflex accent
            ["&Otilde;", "Õ"], // Õ - uppercase O, tilde
            ["&Ouml;", "Ö"], // Ö - uppercase O, umlaut
            ["&Ugrave;", "Ù"], // Ù - uppercase U, grave accent
            ["&Uacute;", "Ú"], // Ú - uppercase U, acute accent
            ["&Ucirc;", "Û"], // Û - uppercase U, circumflex accent
            ["&Uuml;", "Ü"], // Ü - uppercase U, umlaut
            ["&Yacute;", "Ý"], // Ý - uppercase Y, acute accent
            ["&agrave;", "à"], // à - lowercase a, grave accent
            ["&aacute;", "á"], // á - lowercase a, acute accent
            ["&acirc;", "â"], // â - lowercase a, circumflex accent
            ["&atilde;", "ã"], // ã - lowercase a, tilde
            ["&auml;", "ä"], // ä - lowercase a, umlaut
            ["&aring;", "å"], // å - lowercase a, ring
            ["&ccedil;", "ç"], // ç - lowercase c, cedilla
            ["&egrave;", "è"], // è - lowercase e, grave accent
            ["&eacute;", "é"], // é - lowercase e, acute accent
            ["&ecirc;", "ê"], // ê - lowercase e, circumflex accent
            ["&euml;", "ë"], // ë - lowercase e, umlaut
            ["&igrave;", "ì"], // ì - lowercase i, grave accent
            ["&iacute;", "í"], // í - lowercase i, acute accent
            ["&icirc;", "î"], // î - lowercase i, circumflex accent
            ["&iuml;", "ï"], // ï - lowercase i, umlaut
            ["&ntilde;", "ñ"], // ñ - lowercase n, tilde
            ["&ograve;", "ò"], // ò - lowercase o, grave accent
            ["&oacute;", "ó"], // ó - lowercase o, acute accent
            ["&ocirc;", "ô"], // ô - lowercase o, circumflex accent
            ["&otilde;", "õ"], // õ - lowercase o, tilde
            ["&ouml;", "ö"], // ö - lowercase o, umlaut
            ["&ugrave;", "ù"], // ù - lowercase u, grave accent
            ["&uacute;", "ú"], // ú - lowercase u, acute accent
            ["&ucirc;", "û"], // û - lowercase u, circumflex accent
            ["&uuml;", "ü"], // ü - lowercase u, umlaut
            ["&yacute;", "ý"], // ý - lowercase y, acute accent
            ["&yuml;", "ÿ"], // ÿ - lowercase y, umlaut
        ];

    var tmp = str;
    for (var i = 0; i < ISO8859_1_ARRAY.length; i++) {
        var msk = new RegExp("/" + ISO8859_1_ARRAY[i, 0] + "/ig");
        tmp = tmp.replace(msk, ISO8859_1_ARRAY[i, 1]);
    }
    return tmp;
}

/**
 * Função para aplicar máscara em campos de texto
 * Copyright (c) 2008, Dirceu Bimonti Ivo - http://www.bimonti.net
 * All rights reserved.
 * @constructor
 *
 * Função Principal
 * @param w - O elemento que será aplicado (normalmente this).
 * @param e - O evento para capturar a tecla e cancelar o backspace.
 * @param m - A máscara a ser aplicada.
 * @param r - Se a máscara deve ser aplicada da direita para a esquerda. Veja Exemplos.
 * @param a -
 * @returns null
 *
 * Exemplos
 *
 * onkeyup = maskIt(this,event,'###.###.###,##',true,{pre:'R$'})
 * onkeyup = maskIt(this,event,'###,#',true,{pre:'',pos:'º'})
 * onkeyup = maskIt(this,event,'(##)####-####')
 *
 */
function maskIt(w, e, m, r, a) {

    // Cancela se o evento for Backspace
    if (!e) var e = window.event
    if (e.keyCode) code = e.keyCode;
    else if (e.which) code = e.which;

    // Variáveis da função
    var txt = (!r) ? w.value.replace(/[^\d]+/gi, '') : w.value.replace(/[^\d]+/gi, '').reverse();
    var mask = (!r) ? m : m.reverse();
    var pre = (a) ? a.pre : "";
    var pos = (a) ? a.pos : "";
    var ret = "";

    if (code == 9 || code == 8 || txt.length == mask.replace(/[^#]+/g, '').length) return false;

    // Loop na máscara para aplicar os caracteres
    for (var x = 0, y = 0, z = mask.length; x < z && y < txt.length;) {
        if (mask.charAt(x) != '#') {
            ret += mask.charAt(x);
            x++;
        } else {
            ret += txt.charAt(y);
            y++;
            x++;
        }
    }

    // Retorno da função
    ret = (!r) ? ret : ret.reverse();
    w.value = pre + ret + pos;
}

//-->