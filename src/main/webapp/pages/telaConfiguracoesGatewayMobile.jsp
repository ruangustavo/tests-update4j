<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btnSerialEdit').on('click', function () {
            $('#serial').removeAttr("disabled");
            $('#btnSerial').removeAttr("disabled");
        });
    });
</script>

<div class="row">
    <div class="col-md-12">
        <h4>SERVIDOR MOBILE</h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<%@ include file="includes/message.jsp" %>

<s:form id="telaConfiguracoesGatewayMobileForm" action="/salvarTelaConfiguracoesGatewayMobile" cssClass="formulario"
        onsubmit="return false">
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
                    <label style="font-weight: normal;" for="enableGatewayMobile"><s:text
                            name="configuracoes.habilitadoGatewaymobile"/></label>
                </div>
                <div class="container-fluid col-md-4">
                    <button id="enableGatewayMobileButton" onclick="setEnableGatewayMobile(this.form)"
                            name="enableGatewayMobileButton" class="btn btn-info">
                        <span class="ico_salvar"></span>
                        <s:text name="configuracoes.salvar"/>
                    </button>
                </div>
            </div>

            <div class="panel panel-body">
                <div class="col-md-12">
                    <label><s:text name="configuracoes.gatewaymobile.serial"/></label>
                </div>
                <div class="col-md-8">
                    <s:textfield id="serial" name="configuracoes.serial" onkeypress="return onlynumber();"
                                 disabled="%{hasSerial}" cssClass="form-control" maxLength="12"/>
                </div>
                <div class="col-md-4">
                    <button id="btnSerialEdit" onclick="" name="serialEdit" class="btn btn-info"
                        ${!hasSerial ? "disabled" : ""}>
                        <span class="ico_editar"></span>
                        <s:text name="configuracoes.editar"/>
                    </button>
                    <button id="btnSerial" onclick="salvarSerialGatewayMobile(this.form)" name="btnSerial"
                        ${hasSerial ? "disabled" : ""} class="btn btn-info" type="button">
                        <span class="ico_salvar"></span>
                        <s:text name="configuracoes.salvar"/>
                    </button>
                </div>
                <div class="col-md-12">
                    <div class="extra4">
                        <s:text name="configuracoes.gatewaymobile.serial.info"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</s:form>

