<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>INTERNET</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>
<s:form id="telaConfiguracoesForm" name="telaConfiguracoesForm" cssClass="formulario" onsubmit="return false;">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body">
                <s:if test="(msg != null && msg != \"\") ">
                    <div align="center" class="col-md-12 msgErro">
                        <s:text name="alerta.telaConfiguracaoes.salvar"/>
                    </div>
                </s:if>
                <s:if test="(mensagemErro != null && mensagemErro != \"\") ">
                    <div align="center" class="col-md-12 msgErro">
                        <s:property value="mensagemErro"/>
                    </div>
                </s:if>

                <div class="col-md-6">
                    <div style="float: left">
                        <input type="checkbox" name="configuracoes.habilitadoProxy" id="habilitadoProxy" value="true"
                                <s:if test="%{configuracoes.habilitadoProxy}"> checked </s:if>
                               onchange="habilitaProxy(this)"/>
                        <label style="font-weight: normal;" for="habilitadoProxy"><s:text
                                name="configuracoes.habilitadoProxy"/></label>
                    </div>
                    <div class="control-group" style="clear: left; float: left">
                        <label for="ipProxy"><s:text name="configuracoes.ipPROXY"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" name="configuracoes.ipProxy" id="ipProxy"
                                         onkeyup="FiltroNumIp(this)" size="14" maxlength="15"
                                         disabled="disabled"/>
                        </div>
                    </div>
                    <div class="control-group" style="clear: left; float: left">
                        <label for="portaProxy"><s:text name="configuracoes.portaPROXY"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" cssStyle="margin-bottom: 10px;"
                                         name="configuracoes.portaProxy" id="portaProxy"
                                         onkeyup="FiltroNum(this)" size="5" maxlength="5" disabled="disabled"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div style="clear: left; float: left">
                        <input type="checkbox" name="configuracoes.autenticadoProxy" id="autenticadoProxy" value="true"
                                <s:if test="%{configuracoes.autenticadoProxy}"> checked </s:if>
                               onchange="habilitaUserProxy(this)"/>
                        <label style="font-weight: normal;" for="autenticadoProxy"><s:text
                                name="configuracoes.autenticadoProxy"/></label>
                    </div>
                    <div class="control-group" style="clear: left; float: left">
                        <label for="userProxy"><s:text name="configuracoes.userPROXY"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" name="configuracoes.userProxy" id="userProxy" size="10"
                                         disabled="disabled"/>
                        </div>
                    </div>
                    <div class="control-group" style="clear: left; float: left">
                        <label for="passProxy"><s:text name="configuracoes.senhaPROXY"/>:</label>
                        <div class="controls">
                            <s:password cssClass="form-control" name="configuracoes.passProxy" id="passProxy" size="10"
                                        disabled="disabled"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-info" onClick="salvarFormProxy(this.form);">
                <span class="ico_salvar"></span>
                <s:text name="configuracoes.salvar"/>
            </button>
        </div>
    </div>
</s:form>
