<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.testeAut"/>
        </h4>
    </div>
</div>

<s:set var="funcaoPaginacao" value="'filtrarTesteAutonomia(document.filtroPorDataForm, [pagina])'"/>
<jsp:include page="includes/formPaginacao.jsp"/>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form action="/listarTestesAutonomia" cssClass="formulario" id="filtroPorDataForm" onsubmit="return false">
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
                    <s:iterator value="logsTestes" var="log" status="linha">
                        <tr>
                            <td>
                                <s:date name="data" format="dd/MM/yyyy HH:mm:ss"/>
                            </td>
                            <td>
                                <s:text name="descricao"/>

                                <s:if test="tipoTeste == null || tipoTesteCodigo == 0">
                                    :&nbsp;
                                    <s:date name="duracao" format="HH:mm:ss"/>
                                </s:if>
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

    <div class="row">
        <div class="col-md-12">
            <div class="pull-left" style="margin: 15px 0;">
                <button class="btn btn-info" onclick="filtrarTesteAutonomia(this.form, 1);" name="botao">
                    <span class="ico_azul ico_filtrar"></span>
                    <s:text name="logeventos.filtro"/>
                </button>
            </div>
        </div>
    </div>
</s:form>