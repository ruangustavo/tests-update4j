<%@ taglib prefix="s" uri="/struts-tags" %>
<script>
    // menus
    var menumonitor = "<s:text name="menu.monitor" />";
    var menucontrole = "<s:text name="menu.controle" />";
    var menulog = "<s:text name="menu.log" />";
    var menuopcoes = "<s:text name="menu.opcoes" />";
    var menumobile = "<s:text name="menu.mobile" />";

    // submenus
    //	- Monitor
    var smopcoesdigital = "<s:text name="opcoes.digital" />";
    var smopcoesblock = "<s:text name="opcoes.block" />";
    var smopcoesclients = "<s:text name="opcoes.clients" />";

    //submenus
    //- Mobile
    var smopcoesusuariomobile = "<s:text name="opcoes.usumobile" />";

    //	- Painel de Controle
    var smopcoesagenda = "<s:text name="opcoes.agenda"/>";
    var smopcoescontrole = "<s:text name="opcoes.controle"/>";

    //	 - Log
    var smopcoesdatalog = "<s:text name="opcoes.datalog"/>";
    var smopcoeseventlog = "<s:text name="opcoes.eventlog"/>";
    <% //eh windows
    if (System.getProperty("os.name").indexOf("indow")!= -1){%>
    var smopcoeslogProcesso = "<s:text name="opcoes.logProcesso"/>";
    <%} //fim de windows %>
    <s:if test="tipoNobreak.value != 4">
    //nao eh SQP
    var smopcoestesteAut = "<s:text name="opcoes.testeAut"/>";
    </s:if>
    var smarquivohistorico = "<s:text name="arquivo.historico" />";

    //	- Configurações
    var smopcoesgeral = "<s:text name="opcoes.geral"/>";
    var smopcoesbroadcast = "<s:text name="opcoes.broadcast"/>";
    var smopcoesshutdown = "<s:text name="opcoes.shutdown"/>";
    var smopcoespopup = "<s:text name="opcoes.popup"/>";
    var smopcoesalerta24h = "ALERTA 24H";
    var smopcoesinternet = "INTERNET";
    var smopcoeslog = "LOGS";

</script>
<jsp:include page='menuComum.jsp' flush="true"/>
