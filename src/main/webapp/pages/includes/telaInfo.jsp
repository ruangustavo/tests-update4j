<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    boolean[] on = new boolean[9];
%>
<!-- tela de informação -->
<s:if test="estadoConexao == \"1\"">
    <% on[0] = true; %>
    <s:if test="!medidoresEstado.upsOk">
        <% on[1] = true; %>
    </s:if>
    <s:if test="!medidoresEstado.bateriaBaixa">
        <% on[2] = true; %>
    </s:if>
    <s:if test="!medidoresEstado.bateriaLigada">
        <% on[3] = true; %>
    </s:if>
    <s:if test="!medidoresEstado.byPass">
        <% on[4] = true; %>
    </s:if>
    <s:if test="medidoresEstado.testeAtivo">
        <% on[5] = true; %>
    </s:if>
    <s:if test="medidoresEstado.potenciaSaidaElevada">
        <% on[8] = true; %>
    </s:if>
</s:if>
<s:if test="produtoAssociado">
    <% on[6] = true; %>
</s:if>

<div class="row">
    <div class="col-md-12">
        <div id="status" class="status">
            <h2>Status</h2>
            <div id="statusups" class="status<%=(on[1] ? "On" : "Off")%>">
                <s:text name="status.ups"/>
            </div>
            <div id="statusbateria" class="status<%=(on[2] ? "On" : "Off")%>">
                <s:text name="status.bateria"/>
            </div>
            <div id="statusredeEletrica" class="status<%=(on[3] ? "On" : "Off")%>">
                <s:text name="status.redeEletrica"/>
            </div>
            <div id="statusPotenciaElevada" class="status<%=(on[8] ? "On" : "Off")%>">
                <s:text name="status.potenciaElevada"/>
            </div>
            <s:if test="medidoresEstado.tipo == \"UPS online\"">
                <div id="statusinversor" class="status<%=(on[4] ? "On" : "Off")%>">
                    <s:text name="status.inversor"/>
                </div>
            </s:if>
            <div id="statusteste" class="status<%=(on[5] ? "On" : "Off")%>">
                <s:text name="status.teste"/>
            </div>
            <div id="statusalerta" class="status<%=(on[6] ? "On" : "Off")%>">
                <s:text name="status.alerta"/>
            </div>
            <div id="statusgatewaymobile" class="status<%=(on[7] ? "On" : "Off")%>">
                <s:text name="status.gatewaymobile"/>
            </div>
        </div>
    </div>
</div>

<div class="row" id="statusEvento" style="display: none">
    <div class="col-md-12">
        <div class="status" style="text-align: center;">
            <h2><s:text name="agendaEventos.Evento"/>: <span id="descricaoEvento" style="color: #5d99ce;"></span></h2>
            <div class="infoEvento">
                <span id="dataEvento"></span>
                <br>
                <span id="horaEvento"></span>
            </div>
        </div>
    </div>
</div>

<div class="row" id="statusShutdown" style="display: none">
    <div class="col-md-12">
        <div class="status" style="text-align: center;">
            <h2 id="tituloMensagem"></h2>
            <div class="infoEvento">
                <span id="cronometroShutdown"></span>
                <br>
                <span id="mensagemBroadcast">
					<s:property value="%{textoMensagem}"/>
				</span>
            </div>
        </div>
    </div>
</div>

<div id="frameInfo" style="display: none" name="frameInfo"></div>

<script>
    $("#frameInfo").load("<%=request.getContextPath()%>/s2/atualizaInfo.action");
</script>
