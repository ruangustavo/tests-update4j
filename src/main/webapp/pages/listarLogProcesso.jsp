<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.logProcesso"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-body">
            <s:text name="opcoes.logProcesso.nota"/>
        </div>
    </div>
</div>

<s:set var="funcaoPaginacao" value="'filtrarLogProcessos([pagina])'"/>
<jsp:include page="includes/formPaginacao.jsp"/>
<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th class="col-md-2 col-xs-3 col-lg-2"><s:text name="logShutdown.data"/></th>
                    <th class="col-md-2 col-xs-3 col-lg-2"><s:text name="logShutdown.hora"/></th>
                    <th class="col-md-8 col-xs-6 col-lg-8"><s:text name="logShutdown.nomeArquivo"/></th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="listaProcesso" var="log" status="linha">
                    <tr>
                        <td class="col-md-2 col-xs-3 col-lg-2">
                            <s:property value="data"/>
                        </td>
                        <td class="col-md-2 col-xs-3 col-lg-2">
                            <s:property value="hora"/>
                        </td>
                        <td class="col-md-8 col-xs-6 col-lg-8">
                            <s:property value="nomeArquivo"/>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <jsp:include page="includes/paginacao.jsp"/>
    </div>
</div>
