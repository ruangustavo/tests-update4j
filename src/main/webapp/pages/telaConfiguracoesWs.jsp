<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>ALERTA 24H</h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<%@ include file="includes/message.jsp" %>

<s:form id="telaConfiguracoesForm" cssClass="formulario" onsubmit="iniciaLoginUsuWS(this); return false;" action="/">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body">
                <div class="col-md-12">
                    <p>
                        <b><s:text name="configuracoes.gatewaymobile.textEnable"/></b>
                    </p>
                </div>
                <div class="col-md-8">
                    <input type="checkbox" name="enableGatewayMobile" id="enableGatewayMobile" value="true"
                           style="vertical-align: top;"
                            <s:if test="%{enableGatewayMobile}"> checked </s:if> />
                    <label style="font-weight: normal;" for="enableGatewayMobile">
                        <s:text name="configuracoes.habilitadoGatewaymobile"/>
                    </label>
                </div>
                <div class="container-fluid col-md-4">
                    <button id="enableGatewayMobileButton" type="button" onclick="habilitarGatewayMobile(this.form)"
                            name="enableGatewayMobileButton" class="btn btn-info">
                        <span class="ico_salvar"></span>
                        <s:text name="configuracoes.salvar"/>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <s:if test="!usuarioAlertaAutenticado">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-body">
                    <div class="alerta24h">
                        <p>
                            <s:text name="configuracoes.alerta24h.textoLogin"/>
                            <s:a href='javascript:configInternet()'>
                                <s:text name="configuracoes.conexoes.internet"/>
                            </s:a>
                            .
                        </p>

                        <div class="col-md-3 text-center">
                            <img src="<%=request.getContextPath()%>/imagens/logoAlerta24h.png">
                        </div>

                        <div class="col-md-6">
                            <p>
                                <s:text name="web.ws.usuario"/>
                                :
                                <s:textfield cssClass="form-control" name="configuracoes.usuarioWS" id="usuarioWS"
                                             size="10"/>

                                <s:text name="ws.senha"/>
                                :
                                <s:password cssClass="form-control" name="configuracoes.senhaWS" id="senhaWS"
                                            size="10"/>

                            </p>
                        </div>
                        <div class="col-md-3">
                            <button id="loginAlerta24hButton" name="loginAlerta24hButton" class="btn btn-info"
                                    type="submit">
                                <span class="ico_conectar"></span>
                                <s:text name="alerta.telaConfiguracaoes.conectar"/>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </s:if>
    <s:if test="usuarioAlertaAutenticado">
        <div class="alertalogado">
            <div class="login">
                <s:text name="web.ws.usuario"/>: <span class="bold"><s:property value="configuracoes.usuarioWS"/></span>
            </div>
            <div class="acao">
                <a id="botaoOutroUsuario" href="javascript:efetuaLogOffA24h()"><s:text
                        name="configuracoes.trocarUsuario"/></a>
            </div>
        </div>

        <div class="alerta24h">
            <h4><s:text name="configuracoes.alerta24h.tituloConectado"/></h4>
            <p>&nbsp;</p>
            <div class="col-ld-4">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th><s:text name="configuracoes.produto.serial"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><s:property value="produto.serial"/></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </s:if>

</s:form>
<!--// FIM: Conteúdo principal da página -->
