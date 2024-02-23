<%@ taglib prefix="s" uri="/struts-tags" %>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<script language="JavaScript1.3">
    <!--//
        function muda(elemento,status){
            $("#"+elemento).attr("class", "status"+status);
        }
    //-->
</script>

<script>
    $("#mensagemBroadcast").html("<s:property value="textoMensagem"/>");

    <s:if test="statusTeste">
    $("#tituloMensagem").html("<s:text name="configuracoes.swing.tempoAutonomia"/>");
    </s:if>
    <s:else>
    $("#tituloMensagem").html("<s:text name="configuracoes.swing.tempoShutdown"/>");
    </s:else>

    <s:if test="evento != null">
    $("#descricaoEvento").html("<s:property value="evento.textoDescricao"/>");
    var dataStr = "<s:property value="evento.dataLocale"/>";
    // 	var data = dataStr.split(" ");
    $("#dataEvento").html(dataStr.substring(0, dataStr.indexOf(" ")));
    $("#horaEvento").html(dataStr.substring(dataStr.indexOf(" ") + 1));
    $("#statusEvento").show();
    </s:if>
    <s:else>
    $("#statusEvento").hide();
    </s:else>

    <s:if test="valorCronometro != null">
    $("#cronometroShutdown").html("<s:property value="valorCronometro"/>");
    $("#statusShutdown").show();
    </s:if>
    <s:else>
    $("#statusShutdown").hide();
    </s:else>

</script>
<% boolean[] on = new boolean[9]; %>
<s:if test="estadoConexao == \"1\"">
    <%on[0] = true;%>
    <s:if test="!medidoresEstado.upsOk"><% on[1] = true; %></s:if>
    <s:if test="!medidoresEstado.bateriaBaixa"><% on[2] = true; %></s:if>
    <s:if test="!medidoresEstado.bateriaLigada"><% on[3] = true; %></s:if>
    <s:if test="!medidoresEstado.byPass"><% on[4] = true; %></s:if>
    <s:if test="medidoresEstado.testeAtivo"><% on[5] = true; %></s:if>
    <s:if test="medidoresEstado.potenciaSaidaElevada"><% on[8] = true; %></s:if>
</s:if>
<s:if test="produtoAssociado"><% on[6] = true; %></s:if>
<s:if test="gatewayMobileConnected"><% on[7] = true; %></s:if>

<script language="JavaScript1.3">
    muda("statusups",'<%=(on[1] ? "On" : "Off")%>');
	muda("statusbateria",'<%=(on[2] ? "On" : "Off")%>');
	muda("statusredeEletrica",'<%=(on[3] ? "On" : "Off")%>');
    <s:if test="medidoresEstado.tipo == \"UPS online\"">
        muda("statusinversor",'<%=(on[4] ? "On" : "Off")%>');
    </s:if>
    muda("statusteste",'<%=(on[5] ? "On" : "Off")%>');
	muda("statusalerta",'<%=(on[6] ? "On" : "Off")%>');
	muda("statusgatewaymobile",'<%=(on[7] ? "On" : "Off")%>');
	muda("statusPotenciaElevada",'<%=(on[8] ? "On" : "Off")%>');
</script>