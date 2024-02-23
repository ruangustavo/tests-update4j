<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.broadcast"/>
            &gt;
            <s:text name="telaConfiguracoes.testeEmail"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form action="/enviarTesteEmail" cssClass="form form-vertical" onsubmit="return false;">
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
                    </div>
                </s:if>
                <div class="col-md-4">
                    <div class="control-group">
                        <label><s:text name="configuracoes.destinatarioMail"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="destinatarioEmail"
                                         name="configuracoes.destinatarioEmail" size="30"
                                         onblur="ChecaEmail(this, this.value)"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-info" onClick="efetuarEnvioTesteEmail(this.form);">
                <span class="ico_email" aria-hidden="true"></span>
                <s:text name="botao.enviarEmail"/>
            </button>
        </div>
    </div>
</s:form>