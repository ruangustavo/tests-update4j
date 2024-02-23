<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.controle"/>
        </h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:if test="msgErro == true || msgErroTeste == true || msgFalhaAC == true || (mensagemErro != null && mensagemErro != \"\")">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body">
                <div align="center" class="msgErro">
                    <s:if test="msgErro == true">
                        <s:text name="disparos.msgErro"/>
                    </s:if>
                    <s:if test="msgErroTeste == true">
                        <s:text name="disparos.msgErroTeste"/>
                    </s:if>
                    <s:if test="msgFalhaAC == true">
                        <s:text name="disparos.msgFalhaAC"/>
                    </s:if>
                    <s:if test="mensagemErro != null">
                        <s:property value="mensagemErro"/>
                    </s:if>
                </div>
            </div>
        </div>
    </div>
</s:if>

<s:form action="/dispararEvento" cssClass="formulario" onsubmit="return false">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-body">
                <div class="col-md-12">
                    <h4>
                        <s:text name="telaDisparo.EventoBateria"/>
                    </h4>
                    <s:iterator value="disparosBateria" status="evento">
                        <div class="radio">
                            <s:radio theme="simple" id="tipo" name="dispararEventoForm.tipo" list="#{value:label}"
                                     onclick="datahoraligarDisparo(this.value);"/>
                            <s:if test="value == tipoTestePorTempo">
                                <label for="tipo<s:property value="tipoTestePorTempo" />"> <input type="text" id="tempo"
                                                                                                  name="dispararEventoForm.tempo"
                                                                                                  class="form-control"
                                                                                                  style="float: none; display: inline;"
                                                                                                  size="5" maxlength="2"
                                                                                                  onkeyup="FiltroNum(this)"
                                                                                                  onmouseup="FiltroNum(this)"
                                                                                                  onchange="filtroComDelay('document.dispararEventoForm.tempo')"/>
                                    <s:text
                                            name="telaDisparo.selftesteMinutos"/>
                                </label>
                            </s:if>
                        </div>
                    </s:iterator>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="panel panel-body">
                <div class="col-md-12">
                    <h4>
                        <s:text name="telaDisparo.EventoUps"/>
                    </h4>
                    <s:iterator value="disparosUps" status="evento">
                        <div class="radio">
                            <s:radio theme="simple" id="tipo" name="dispararEventoForm.tipo" list="#{value:label}"
                                     onclick="datahoraligarDisparo(this.value);"/>
                            <s:if test="value == tipoTestePorTempo">
                                <label for="tipo<s:property value="tipoTestePorTempo" />"> <input type="text" id="tempo"
                                                                                                  name="dispararEventoForm.tempo"
                                                                                                  class="form-control"
                                                                                                  style="float: none; display: inline;"
                                                                                                  size="5" maxlength="2"
                                                                                                  onkeyup="FiltroNum(this)"
                                                                                                  onmouseup="FiltroNum(this)"
                                                                                                  onchange="filtroComDelay('document.dispararEventoForm.tempo')"/>
                                    <s:text
                                            name="telaDisparo.selftesteMinutos"/>
                                </label>
                            </s:if>
                        </div>
                    </s:iterator>
                    <div class="col-md-12" id="ligar" style="padding-left: 0px;">
                        <p>
                            <label for="dataFinal"><s:text name="agendaEventos.ligar"/></label>
                        </p>
                        <label class="pull-left" style="line-height: 32px; margin-right: 5px; margin-bottom: 0px;"
                               for="dataFinal"><s:text
                                name="agendaEventos.dataEventomenu"/></label>
                        <div class='input-group date' id='dtFim'>
                            <input name="dispararEventoForm.dataFinal" id="dataFinal"
                                   value="<s:property value="dispararEventoForm.dataFinal"/>" size="16"
                                   maxlength="16" style="cursor: pointer" data-date-format="DD/MM/YYYY HH:mm"
                                   class="item-group date form-control"
                                   disabled="disabled" onchange="propagaAlteracao('dtFim')"
                                   onclick="exibirDtFimComponent()"/>
                            <span class="input-group-addon" onclick="exibirDtFimComponent()">
								<img src="/sms/imagens/ico_agenda.png" width="17" height="16">
							</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-body">
                <div class="col-md-12">
                    <h4>
                        <s:text name="telaDisparo.EventoMute"/>
                    </h4>
                    <s:iterator value="disparosMute" status="evento">
                        <div class="radio">
                            <s:radio theme="simple" id="tipo" name="dispararEventoForm.tipo" list="#{value:label}"
                                     onclick="datahoraligarDisparo(this.value);"/>
                            <s:if test="value == tipoTestePorTempo">
                                <label for="tipo<s:property value="tipoTestePorTempo" />"> <input type="text" id="tempo"
                                                                                                  name="dispararEventoForm.tempo"
                                                                                                  class="form-control"
                                                                                                  style="float: none; display: inline;"
                                                                                                  size="5" maxlength="2"
                                                                                                  onkeyup="FiltroNum(this)"
                                                                                                  onmouseup="FiltroNum(this)"
                                                                                                  onchange="filtroComDelay('document.dispararEventoForm.tempo')"/>
                                    <s:text
                                            name="telaDisparo.selftesteMinutos"/>
                                </label>
                            </s:if>
                        </div>
                    </s:iterator>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <button onclick="validateFormDisparo(this.form)" class="btn btn-info">
                <span class="ico_disparo"></span>
                <s:text name="botao.disparaEvento"/>
            </button>
        </div>
    </div>
</s:form>

