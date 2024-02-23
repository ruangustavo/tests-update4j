<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.broadcast"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form action="/salvarTelaConfiguracoesBroadcast" cssClass="form form-vertical" onsubmit="return false;">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body">
                <s:if test="(msg != null && msg != \"\") ">
                    <div align="center" class="col-md-12 msgSucesso">
                        <s:property value="msg"/>
                    </div>
                </s:if>
                <s:if test="(erro != null && erro != \"\") ">
                    <div align="center" class="col-md-12 msgErro">
                        <s:property value="erro"/>
                        <s:if test="(detalhesErro != null && detalhesErro != \"\") ">
                            <p style="font-size: 10px; display: none;">
                                [<s:property value="detalhesErro"/>]
                            </p>
                        </s:if>
                    </div>
                </s:if>

                <div class="col-md-4">
                    <s:checkbox id="emailHabilitado" name="configuracoes.emailHabilitado"/>
                    <label style="font-weight: normal;" for="emailHabilitado"><s:text
                            name="configuracoes.habilitar.email"/></label>
                </div>
                <div class="col-md-4">
                    <s:checkbox id="sslHabilitado" name="configuracoes.sslHabilitado"/>
                    <label style="font-weight: normal;" for="sslHabilitado"><s:text
                            name="configuracoes.habilitar.ssl"/></label>
                </div>
                <div class="col-md-4" style="clear: left">
                    <div class="control-group">
                        <label><s:text name="configuracoes.remetenteMail"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="remetenteEmail" name="configuracoes.remetenteEmail"
                                         size="30"
                                         onblur="ChecaEmail(this, this.value)"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="control-group">
                        <label><s:text name="configuracoes.servidordeMail"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="servidorEmail" name="configuracoes.servidorEmail"
                                         size="30"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-4" style="clear: left">
                    <div class="control-group">
                        <label><s:text name="configuracoes.usuarioSMTP"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="usuarioSMTP" name="configuracoes.usuarioSMTP"
                                         size="30"/>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="control-group">
                        <label><s:text name="configuracoes.senhaSMTP"/>:</label>
                        <div class="controls">
                            <s:password cssClass="form-control" id="senhaSMTP" name="configuracoes.senhaSMTP" size="10"
                                        maxlength="20"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="control-group">
                        <label><s:text name="configuracoes.portaSMTP"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="portaSMTP" name="configuracoes.portaSMTP" size="10"
                                         maxlength="4" onkeyup="FiltroNum(this)"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-info" onClick="salvarConfiguracoesBroadcast(this.form);">
                <span class="ico_salvar"></span>
                <s:text name="configuracoes.salvar"/>
            </button>
            <button class="btn btn-info" onClick="listarMensagensBroadcast();">
                <span class="ico_config"></span>
                <s:text name="botao.configuraMensagens"/>
            </button>
            <button id="btnEmail" class="btn btn-info" onClick="telaTesteEmail(this.form);">
                <span class="ico_email" aria-hidden="true"></span>
                <s:text name="botao.testarEmail"/>
            </button>
        </div>
    </div>
</s:form>