<%@ taglib prefix="s" uri="/struts-tags" %>
<!--// CONTE�DO -->
<!--// CONTEښDO PRINCIPAL DA P��GINA -->
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.popup"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form id="telaConfiguracoesForm" name="telaConfiguracoesForm" action="/salvarTelaConfiguracoesPopup"
        cssClass="formulario"
        onsubmit="return false;">
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
                <div class="shutdown">
                    <p>
                        <s:checkbox id="popUpHabilitado" name="configuracoes.popUpHabilitado" fieldValue="true"
                                    onchange="updateFrequencia()"/>
                        <label style="font-weight: normal;" for="popUpHabilitado"><s:text
                                name="configuracoes.habilitar.pop-up"/></label>
                    </p>
                    <p>
                        <s:text name="configuracoes.popup.frequencia"/>
                    </p>
                    <p class="resposta-shutdown">
                        <s:textfield cssClass="form-control" type="number" min="30" max="9999" id="tempoFrequenciaPopup"
                                     name="configuracoes.tempoFrequenciaPopup" size="2" maxlength="4"
                                     onkeyup="FiltroNum(this)"/>
                        <s:text name="configuracoes.segundos"/>
                    </p>

                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-info" type="button"
                    onClick="salvarConfiguracoesPopup(document.telaConfiguracoesForm);">
                <span class="ico_salvar"></span>
                <s:text name="configuracoes.salvar"/>
            </button>
        </div>
    </div>
</s:form>