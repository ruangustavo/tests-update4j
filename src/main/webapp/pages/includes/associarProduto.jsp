<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- input type="hidden" value="ambienteLocal" name="configuracoes.ativoWS" id="ativoWS" / -->

<h4>ALERTA 24H</h4>
<hr class="col-md-13">
<s:form id="telaConfiguracoesForm" action="/salvarConfiguracoesAlerta" cssClass="formulario" onsubmit="return false">
    <s:hidden name="configuracoes.ativoWS" id="ativoWS" value="true"/>
    <s:hidden name="configuracoes.enviarAmbienteWS" id="enviaAmbienteWS" value="true"/>
    <div class="panel-body">
        <div class="alertalogado">
            <div class="login">
                <s:text name="web.ws.usuario"/>
                :
                <s:property value="configuracoes.usuarioWS"/>
            </div>
            <div class="acao">
                <a id="botaoOutroUsuario" href="javascript:efetuaLogOffA24h()"><s:text name="configuracoes.logout"/></a>
            </div>
        </div>
        <div class="alertaSerialNaoCadastrado">
            <div>
                <s:text name="alerta.serial.naoCadastrado.erro"/>
            </div>
        </div>
    </div>
    <br>
</s:form>