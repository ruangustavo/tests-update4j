<%@ taglib prefix="s" uri="/struts-tags" %>
<!--// CONTEÚDO -->
<!--// CONTEÚDO PRINCIPAL DA PÁGINA -->
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.shutdown"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form id="telaConfiguracoesForm" name="telaConfiguracoesForm" action="/salvarTelaConfiguracoesShutdown"
        cssClass="formulario"
        onsubmit="return false;">
    <input type="hidden" name="configuracoes.shutdownBateriaBaixaHabilitado" value="true"/>
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
                        <s:text name="configuracoes.percentual"/>
                    </p>
                    <p class="resposta-shutdown">
                        <s:textfield type="number" cssClass="form-control" id="tempoBateriaBaixa" size="2"
                                     maxlength="2" min="0" max="33" name="configuracoes.tempoBateriaBaixa"
                                     onkeyup="FiltroNum(this); FiltroMaxValor(this, TEMPO_BATERIA_BAIXA)"/>%
                    </p>
                    <div class="extra4">
                        <s:text name="configuracoes.bateriaBaixa.sequencia.limiarBateria"/>
                    </div>
                    <p>
                        <input type="checkbox" name="configuracoes.shutdownHabilitado" id="shutdownHabilitado"
                               value="true"
                                <s:if test="%{configuracoes.shutdownHabilitado}"> checked </s:if>
                               onchange="habilitaShutdown(this)"/>
                        <s:text name="configuracoes.falhaAC.sequencia.shutdown.ativar"/>
                    </p>
                    <p class="resposta-shutdown">
                        <s:textfield cssClass="form-control" id="tempoShutdownFalhaAC"
                                     name="configuracoes.tempoShutdownFalhaAC"
                                     size="2" maxlength="4" onkeyup="FiltroNum(this)"
                                     disabled="%{!configuracoes.shutdownHabilitado}"/>
                        <s:text name="configuracoes.minutos"/>
                    </p>
                    <div class="extra4">
                        <s:text name="configuracoes.bateriaBaixa.sequencia.shutdown"/>
                    </div>
                    <p>
                        <input type="checkbox" name="configuracoes.shutdownHabilitadoUps" id="shutdownHabilitadoUps"
                               value="true"
                                <s:if test="%{configuracoes.shutdownHabilitadoUps}"> checked </s:if>
                               onchange="habilitaShutdownUps(this)"/>
                        <s:text name="configuracoes.desligarUPS.sequencia.shutdown"/>
                    </p>
                    <p class="resposta-shutdown">
                        <s:textfield cssClass="form-control" id="tempoSequenciaShutdown"
                                     name="configuracoes.tempoSequenciaShutdown" size="2" maxlength="4"
                                     onkeyup="FiltroNum(this)" disabled="%{!configuracoes.shutdownHabilitadoUps}"/>
                        <s:text name="configuracoes.minutos"/>
                    </p>
                    <div class="extra4">
                        <s:text name="configuracoes.shutdown.maximo.10min"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-info" onClick="salvarConfiguracoesShutdown(document.telaConfiguracoesForm);">
                <span class="ico_salvar"></span>
                <s:text name="configuracoes.salvar"/>
            </button>
        </div>
    </div>
</s:form>