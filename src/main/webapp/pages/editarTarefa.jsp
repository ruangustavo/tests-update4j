<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm");
%>
<script type="text/javascript">
    var dataAtual = '<%=df.format(new java.util.Date())%>';
    testTarefa = ${tarefaBean};
</script>
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="telaEditarTarefa.titulo"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form action="/salvarTarefa" focusElement="data" cssClass="formulario" onsubmit="return false;">
    <div class="row">
        <div class="col-md-12">
            <div align="center" class="msgErro">
                <s:if test="mensagemErro != null">
                    <s:property value="mensagemErro"/>
                </s:if>
            </div>
        </div>
    </div>

    <div class="row">
        <input type="text" name="tarefa.id"/>
        <div class="col-md-6">
            <div class="panel panel-body">
                <div class="col-md-12">
                    <h4>
                        <s:text name="agendaEventos.EventoBateria"/>
                    </h4>
                    <s:iterator value="eventosBateria" status="evento">
                        <div class="radio">
                            <s:radio theme="simple" id="tipoEvento" name="agendaTarefaForm.tipoEvento"
                                     list="#{value:label}" onclick="datahoraligar(this.value);"
                                     cssStyle="margin-top: 2px;"/>
                            <s:if test="value == tipoTestePorTempo">
                                <input type="text" class="form-control" style="float: none; display: inline;"
                                       id="duracao" name="agendaTarefaForm.duracao" size="3"
                                       maxlength="2" onkeyup="maskIt(this, event, '#####')"/>&nbsp;
                                <label for="duracao"><s:text name="telaDisparo.selftesteMinutos"/></label>
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
                        <s:text name="agendaEventos.EventoUps"/>
                    </h4>
                    <s:iterator value="eventosUps" status="evento">
                        <div class="radio">
                            <s:radio theme="simple" id="tipoEvento" name="agendaTarefaForm.tipoEvento"
                                     list="#{value:label}" onclick="datahoraligar(this.value);"
                                     cssStyle="margin-top: 2px;"/>
                        </div>
                    </s:iterator>
                    <div id="ligar" class="col-md-12" style="padding-left: 0px;">
                        <p>
                            <label for="dataFinal"><s:text name="agendaEventos.ligar"/></label>
                        </p>
                        <label class="pull-left" style="line-height: 32px; margin-right: 5px; margin-bottom: 0px;"
                               for="dataFinal"><s:text
                                name="agendaEventos.dataEventomenu"/></label>
                        <div class='input-group date' id='dtFim'>
                            <input name="agendaTarefaForm.dataFinal" id="dataFinal"
                                   value="<s:property value="agendaTarefaForm.dataFinal"/>" size="16"
                                   maxlength="16" style="cursor: pointer" data-date-format="DD/MM/YYYY HH:mm"
                                   class="item-group date form-control"
                                   disabled="disabled" onchange="propagaAlteracao('dtFim')"
                                   onclick="exibirDtComponent()"/>
                            <span class="input-group-addon" onclick="exibirDtComponent()">
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
                        <s:text name="agendaEventos.frequencia"/>
                    </h4>

                    <s:iterator value="frequencias" status="frequencia">
                        <div class="radio">
                            <s:radio theme="simple" id="frequencia" name="agendaTarefaForm.frequencia"
                                     list="#{value:label}" cssStyle="margin-top: 2px;"/>
                        </div>
                    </s:iterator>
                </div>

                <div class="col-md-12" style="clear: left; margin-bottom: 10px; margin-top: 10px; padding-left: 0px;">
                    <label class="pull-left" style="line-height: 32px; margin-right: 5px;" for="data"><s:text
                            name="agendaEventos.dataEventomenu"/>:</label>
                    <div class='input-group date' id='dt'>
                        <input name="agendaTarefaForm.data" id="data"
                               value="<s:property value="agendaTarefaForm.data"/>" readonly type="text" size="16"
                               maxlength="16" style="cursor: pointer" data-date-format="DD/MM/YYYY HH:mm"
                               class="item-group date form-control"
                               onchange="propagaAlteracao('dt')" onclick="exibirDtFrequenciaComponent()"/>
                        <span class="input-group-addon" onclick="exibirDtFrequenciaComponent()">
							<img src="/sms/imagens/ico_agenda.png" width="17" height="16">
						</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <button onCLick="salvarTarefa(this.form)" class="btn btn-info">
                <span class="ico_salvar"></span>
                <s:text name="configuracoes.salvar"/>
            </button>
        </div>
    </div>
</s:form>
<s:if test="agendaTarefaForm.tipoEvento == '1'">
    <script>
        datahoraligar(1);
    </script>
</s:if>
