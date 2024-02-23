<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>DumpLog</h4>
    </div>
</div>

<s:set var="funcaoPaginacao" value="'filtrarDumpLog([pagina])'"/>
<jsp:include page="includes/formPaginacao.jsp"/>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form id="formulario" action="/dumpLog!enviarPorEmail.action" onsubmit="return false;">
    <div class="col-ld-4">
        <div class="col-md-12" id="divMensagem">
            <s:if test="mensagemErro != null && mensagemErro != \"\"">
                <div class="text-center msgErro">
                    <s:property value="mensagemErro"/>
                </div>
            </s:if>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th class="col-md-1"><s:text name="dumplog.data"/>&nbsp;</th>
                    <th><s:text name="dumplog.numeroEvento"/>&nbsp;</th>
                    <th><s:text name="dumplog.descricao"/>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="listaDumplog" var="log" status="linha">
                    <tr class="linha<s:if test="#linha.odd">0</s:if><s:else>1</s:else>">
                        <td height="21">
                            <s:date name="data" format="dd/MM/yyyy"/>
                            &nbsp;
                        </td>
                        <td>
                            <s:property value="numeroEvento"/>
                            &nbsp;
                        </td>
                        <td>
                            <s:property value="descricao"/>
                            &nbsp;
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="includes/paginacao.jsp"/>

    <br>
    <div class="col-ld-4">
        <div class="col-md-12" style="margin: 10px;">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <label style="font-wheight: normal" for="destino"><s:text name="dumplog.enviarParaEmail"/>:</label>
                <s:textfield cssClass="form-control" name="emailDestino" size="40" maxlength="80" id="destino"
                             cssStyle="margin: 10px"/>
                <button class="btn btn-info btn-lg" onclick="enviarDumpLog(this.form);" style="float: right">
                    <span class="ico_azul ico_enviar"></span>
                    <s:text name="dumplog.enviar"/>
                </button>
            </div>
        </div>
        <div class="col-md-3" style="clear: left"></div>
        <div class="col-md-6 text-center" style="clear: right">
            <button class="btn btn-info btn-lg" onclick="filtrarDumpLog(paginaAtual);">
                <span class="ico_azul ico_filtrar"></span>
                <s:text name="dumplog.botao"/>
            </button>
            <button class="btn btn-info btn-lg" onclick="dump();">
                <span class="ico_azul ico_exportar"></span>
                <s:text name="dumplog.disparar"/>
            </button>
        </div>

    </div>
    <!--// FIM: Conteúdo principal da página -->
</s:form>