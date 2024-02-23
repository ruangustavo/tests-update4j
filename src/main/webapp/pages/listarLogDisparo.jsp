<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.eventlog"/>
        </h4>
    </div>
</div>

<s:set var="funcaoPaginacao" value="'filtrarLogDisparos(document.filtroPorDataForm, [pagina])'"/>
<jsp:include page="includes/formPaginacao.jsp"/>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form action="/listarLogDisparos" cssClass="formulario" id="filtroPorDataForm" onsubmit="return false">
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th><s:text name="logeventos.datal"/>/<s:text name="logeventos.hora"/></th>
                        <th><s:text name="logeventos.descricao"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="logDisparos" var="log" status="linha">
                        <tr>
                            <td>
                                <s:property value="dataLocale"/>
                            </td>
                            <td>
                                <s:property value="textoDescricao"/>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <jsp:include page="includes/paginacao.jsp"/>

    <jsp:include page="includes/formFiltroPeriodo.jsp"/>

    <div class="row" style="margin-top: 15px;">
        <div class="col-md-12 pull-left">
            <button class="btn btn-info" onclick="filtrarLogDisparos(this.form, 1);" name="botao">
                <span class="ico_azul ico_filtrar"></span>
                <s:text name="logeventos.filtro"/>
            </button>
        </div>
    </div>

    <div class="row" style="margin-top: 15px; margin-bottom: 15px;">
        <div class="col-md-12">
            <button class="btn btn-info" onclick="redirectExportarLogDisparos();">
                <span class="ico_azul ico_exportar"></span>
                <s:text name="logeventos.gerarcsv"/>
            </button>
            <button class="btn btn-info" onclick="redirectLimparLogDisparos();">
                <span class="ico_azul ico_apagar"></span>
                <s:text name="logeventos.limpar"/>
            </button>
        </div>
    </div>
</s:form>
<!--// FIM: Conteúdo principal da página -->