<%@ taglib prefix="s" uri="/struts-tags" %>
<form id="frmDadosPaginacao">
    <s:hidden value="%{controleBean.paginaAtual}" name="paginaAtual"/>
    <s:hidden value="%{controleBean.qtdPaginas}" name="totalPaginas"/>
    <input type="hidden" name="idDiv" value="conteudo-ajax"/>
    <input type="hidden" name="urlPaginacao" value="<s:property value="%{#urlPaginacao}"/>"/>
    <input type="hidden" name="funcaoPaginacao" value="<s:property value="%{#funcaoPaginacao}"/>"/>
</form>
