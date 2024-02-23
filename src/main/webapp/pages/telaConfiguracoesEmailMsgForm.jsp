<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
    $(document).ready(function () {
        onloadFormEmailMsg();
    });
</script>

<div class="row">
    <div class="col-md-12">
        <h4>EMAIL > <s:text name="configuracoes.email.title"/> >
            <s:if test="emailMensagem.id == null">
                <s:text name="new"/>
            </s:if>
            <s:else>
                <s:text name="edit"/>
            </s:else>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form id="formEmailMsg" name="formEmailMsg" action="/configuracaoEmailMsg!salvar" onsubmit="return submitAjax(this);">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body">
                <s:if test="validationMsg != null && validationMsg != \"\"">
                    <div id="erro_content" class="text-center msgErro">
                        <s:property value="validationMsg"/>
                    </div>
                </s:if>
                <s:hidden type="hidden" name="emailMensagem.id"></s:hidden>
                <div class="form-group">
                    <label for="emailInput">Email:</label>
                    <input type="email" name="emailMensagem.email" size="50" id="emailInput" class="form-control"
                           placeholder="email@example.com"
                           style="width: auto" value='<s:property value="emailMensagem.email" />'
                           data-error="<s:text name="configuracoes.email.validation.required" />" required>
                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label><s:text name="configuracoes.email.label.mensagens"/>:</label>
                    <div class="controls checkboxlist-vertical">
                        <s:checkboxlist list="mensagensDisponiveis" name="mensagensCheckbox" value="defaultValue"
                                        listKey="constante" listValue="getText(label)"/>
                    </div>
                </div>
                <div class="form-group">
                    <input type="number" id="checkbox_hidden" data-validate="true" style="display: none" min="1"
                           data-error="<s:text name="configuracoes.email.validation.atLeastOne" />" required/>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
    </div>

    <button id="voltarEmailMsgButton" type="button" name="voltarEmailMsgButton" class="btn btn-info"
            onclick="listarMensagensBroadcast()">
        <s:text name="back"/>
    </button>
    <button id="newEmailMsgButton" type="submit" name="method:salvar" class="btn btn-info">
        <span class="ico_salvar"></span>
        <s:text name="save"/>
    </button>
</s:form>

<!--// FIM: Conteúdo principal da página -->
