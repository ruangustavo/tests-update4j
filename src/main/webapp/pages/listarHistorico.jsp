<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="(mensagemErro != null && mensagemErro != \"\")">
    <div align="center" class="msgErro">
        <s:text name="mensagemErro"/>
    </div>
</s:if>

<form name="arquivos" id="arquivos" action="<%=request.getContextPath()%>/s2/arquivosLog!download.action" method="post">
    <s:hidden id="tipoLog" name="tipoLog"/>
    <s:hidden id="nomeArquivo" name="nomeArquivo" value=""/>
    <s:hidden id="todos" name="todos" value=""/>
    <div class="col-ld-4 status">
        <div class="table-responsive scroll-container">
            <table class="table table-bordered table-hover table-striped" style="margin-bottom: 0">
                <thead>
                <tr>
                    <th class="col-md-1"><input type="checkbox" id="checkTitle" onclick="checkT();"/></th>
                    <th><label for="checkTitle"><s:text name="listar.arquivos"/></label></th>
                    <th class="col-md-1">&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="listArquivos" status="linha">
                    <tr>
                        <td><input type="checkbox" name="file" id='file<s:property value="%{#linha.index}"/>'
                                   value='<s:property value="name"/>' onclick="verificaCheckTitle(this);"/></td>
                        <td><label for="file<s:property value="%{#linha.index}"/>"><s:property value="name"/></label>
                        </td>
                        <td>
                            <a href="javascript:downloadLog('<s:property value="name"/>')"><span class="Aplicativo"
                                                                                                 title="<s:property value="name"/>"></span></a>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>

    <a href="javascript:deleteLog();" class="btn btn-info" style="margin-bottom: 10px">
        <span class="ico_azul ico_apagar"></span> <s:text name="arquivo.excluir"/>
    </a>
</form>
