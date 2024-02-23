<%@page import="br.com.sms.powerview.beans.TarefaBean" %>
<%@page import="br.com.sms.powerview.util.Util" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.agenda"/>
        </h4>
    </div>
</div>
<s:set var="funcaoPaginacao" value="'listarAgendaEventos([pagina])'"/>
<jsp:include page="formPaginacao.jsp"/>
<!--// CONTEÚDO PRINCIPAL DA PÁGINA -->

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<div align="center" class="msgErro">
    <s:if test="mensagemErro != null">
        <s:property value="mensagemErro"/>
    </s:if>
</div>

<div class="row">
    <div class="col-md-12">

        <a href="#" class="btn btn-info" onClick="formTarefa()">
            <span class="ico_novatarefa"></span>
            <s:text name="agendaEventos.cadastrarTarefa"/>
        </a>

        <br/><br/>

        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th><s:text name="agendaEventos.dataEvento"/></th>
                    <th><s:text name="agendaEventos.horaEvento"/></th>
                    <th><s:text name="agendaEventos.Evento"/></th>
                    <th><s:text name="agendaEventos.frequencia"/></th>
                    <th><s:text name="agendaEventos.duracao"/></th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="agendaEventos" var="log" status="linha">
                    <tr>
                        <td>
                            <s:property value="dataLocale"/>
                        </td>
                        <td>
                            <s:property value="horaLocale"/>
                        </td>
                        <td>
                            <s:property value="textoTipoEvento"/>
                        </td>
                        <td>
                            <s:property value="textoFrequenciaEvento"/>
                        </td>
                        <td>
                            <s:property value="duracao"/>
                        </td>
                        <td>
                            <a class="btn" href="javascript:editarAgendaEventos(<s:property value="id"/>)">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                            <a class="btn" href="javascript:excluirAgendaEventos(<s:property value="id"/>)">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
                <s:if test="%{controleBean.qtdPaginas > 1}">
                    <tr>
                        <td colspan="6" valign="bottom">
                            <jsp:include page="paginacao.jsp"/>
                        </td>
                    </tr>
                </s:if>
            </table>
        </div>
    </div>
</div>
<!--// FIM: Conteúdo principal da página -->
