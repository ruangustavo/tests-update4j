<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>LOGS</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>
<s:form id="telaConfiguracoesForm" cssClass="formulario" onsubmit="return false;">
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
                <s:if test="(mensagemSucesso != null && mensagemSucesso != \"\") ">
                    <div align="center" class="col-md-12 msgSucesso">
                        <s:property value="mensagemSucesso"/>
                    </div>
                </s:if>

                <div class="col-md-6">
                    <div style="float: left">
                        <input type="checkbox" name="configuracoes.gravaDadosUpsHabilitado" id="checkGrava" value="true"
                                <s:if test="%{configuracoes.gravaDadosUpsHabilitado}"> checked </s:if> />
                        <label style="font-weight: normal;" for="checkGrava"><s:text
                                name="configuracoes.habilitar.gravacao"/></label>
                    </div>
                    <div class="control-group" style="clear: left; float: left" id="quantLogs">
                        <label for="quantLog"><s:text name="configuracoes.quantidade.log"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="quantLog" name="configuracoes.quantLog" size="5"
                                         onkeyup="FiltroNum(this);"
                                         onblur="reloadTempo();"/>
                        </div>
                    </div>
                    <div class="control-group" style="clear: left; float: left" id="intervalo">
                        <label for="tempoGravaDado"><s:text name="configuracoes.intervalo"/> (<s:text
                                name="configuracoes.segundos"/>):</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" cssStyle="margin-bottom: 10px;"
                                         name="configuracoes.tempoGravaDado" id="tempoGravaDado"
                                         onkeyup="FiltroNum(this)" size="5" maxlength="5" onblur="reloadTempo();"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div style="clear: left; float: left" id="gravar">
                        <input type="checkbox" id="checkRot" name="configuracoes.gravarArquivoHabilitado" value="true"
                               onclick="disableLabel();"
                                <s:if test="%{configuracoes.gravarArquivoHabilitado}"> checked </s:if> />
                        <label style="font-weight: normal;" for="checkRot"><s:text
                                name="configuracoes.rotacionar.log"/></label>
                    </div>
                    <div class="control-group" style="clear: left; float: left" id="quantArq">
                        <label for="labelQuant"><s:text name="configuracoes.quantidade.arquivos"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" name="configuracoes.quantArquivos" size="5"
                                         onkeyup="FiltroNum(this);" id="labelQuant"/>
                        </div>
                    </div>
                </div>
                <div class="obs" style="clear: left; float: left" id="obs" id="infoTempo">
                    <p>
                        <s:text name="configuracoes.info.texto"/>
                        &nbsp;
                        <span id="tempo"></span>
                        h.
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-info" onClick="salvarConfigLogs(this.form);">
                <span class="ico_salvar"></span>
                <s:text name="configuracoes.salvar"/>
            </button>
        </div>
    </div>
</s:form>
<!--// FIM: Conteúdo principal da página -->
