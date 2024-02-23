<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.datalog"/>
        </h4>
    </div>
</div>

<s:set var="funcaoPaginacao" value="'filtrarLogDados(document.consultaPorDiaHoraForm, [pagina])'"/>
<jsp:include page="includes/formPaginacao.jsp"/>

<s:form action="/listarLogDados" cssClass="formulario" id="consultaPorDiaHoraForm" onsubmit="return false;">

    <s:if test="%{tipoNobreak.value == 1 || tipoNobreak.value == 4}">
        <jsp:include page="includes/listagemLogDadosTrifasico.jsp"/>
    </s:if>
    <s:else>
        <jsp:include page="includes/listagemLogDados.jsp"/>
    </s:else>

    <jsp:include page="includes/paginacao.jsp"/>

    <jsp:include page="includes/formFiltroPeriodo.jsp"/>

    <div class="row">
        <div class="col-md-7 pull-left">
            <button class="btn btn-info" style="margin: 15px 0;" onclick="filtrarLogDados(this.form, 1);" name="botao">
                <span class="ico_azul ico_filtrar"></span>
                <s:text name="logeventos.filtro"/>
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <button class="btn btn-info" onclick="redirectExportarLogDados();">
                <span class="ico_azul ico_exportar"></span>
                <s:text name="logeventos.gerarcsv"/>
            </button>
            <button class="btn btn-info" onclick="redirectLimparLogDados();">
                <span class="ico_azul ico_apagar"></span>
                <s:text name="logeventos.limpar"/>
            </button>
        </div>
    </div>
</s:form>
<!--// FIM: Conteudo principal da pagina -->

<!--// FIM DO CONTEuDO -->