<%@ taglib prefix="s" uri="/struts-tags" %>

<script>
    // menus
    var menumonitor = "<s:text name="menu.monitor" />";
    var menulog = "<s:text name="menu.log" />";
    var menuopcoes = "<s:text name="menu.opcoes" />";
    var menustatus = "Status";
    var menumobile = "<s:text name="menu.mobile" />";
    // submenus
    //	- Monitor
    var smopcoesdigital = "<s:text name="opcoes.digital" />";
    var smopcoesclients = "<s:text name="opcoes.clients" />";

    //submenus
    //- Mobile
    var smopcoesusuariomobile = "<s:text name="opcoes.usumobile" />";

    //	 - Log
    var smopcoesdatalog = "<s:text name="opcoes.datalog"/>";
    var smopcoeseventlog = "<s:text name="opcoes.eventlog"/>";
    <% if (System.getProperty("os.name").indexOf("indow")!= -1){  //eh windows %>
    var smopcoeslogProcesso = "<s:text name="opcoes.logProcesso"/>";
    <%} //fim de windows %>
    <s:if test="tipoNobreak.value != 4">//nao eh SQP
    var smopcoestesteAut = "<s:text name="opcoes.testeAut"/>";
    </s:if>
    var smarquivohistorico = "<s:text name="arquivo.historico" />";
    var smdumplog = "DumpLog";

    //	- Configurações
    var smopcoesgeral = "<s:text name="opcoes.geral"/>";
    var smopcoesbroadcast = "<s:text name="opcoes.broadcast"/>";
    var smopcoesshutdown = "<s:text name="opcoes.shutdown"/>";
    var smopcoespopup = "<s:text name="opcoes.popup"/>";
    var smopcoesalerta24h = "Alerta 24h";
    var smopcoesinternet = "Internet";
    var smopcoeslog = "Logs";

    //	- Status
    var smstatusgeral = "<s:text name="menu.status.geral"/>";
    var smstatusentrada = "<s:text name="menu.status.entrada"/>";
    var smstatusbypass = "<s:text name="menu.status.bypass"/>";
    var smstatusinversor = "<s:text name="menu.status.inversor"/>";
    var smstatusbateria = "<s:text name="menu.status.bateria"/>";
    <s:if test="tipoNobreak.value == 1">//eh TRIFASICO
    var smstatussaida = "<s:text name="menu.status.saida"/>";
    var smstatusteste = "<s:text name="menu.status.teste"/>";
    </s:if>

</script>
<jsp:include page='menuComum.jsp' flush="true"/>
