<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="%{controleBean.qtdPaginas > 1}">
    <div class="row">
        <div class="col-md-12">
            <div class="pull-left">
                <s:text name="logeventos.pagina"/>
                <s:property value="controleBean.paginaAtual"/>
                <s:text name="logeventos.de"/>
                <s:property value="controleBean.qtdPaginas"/>
                <br>
            </div>
            <!-- pagination -->
            <div id="paginacao" style="clear: left;"></div>
            <!-- /pagination -->
        </div>
    </div>
</s:if>