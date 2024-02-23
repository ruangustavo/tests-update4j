<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="col-md-12" id="divMensagem">
    <s:if test="msg != null && msg != \"\"">
        <div class="text-center msgErro">
            <s:property value="msg"/>
        </div>
    </s:if>

    <s:if test="(mensagemErro != null && mensagemErro != \"\") ">
        <div align="center" class="col-md-12 msgErro">
            <s:property value="mensagemErro"/>
        </div>
    </s:if>
    <s:if test="(mensagemSucesso != null && mensagemSucesso != \"\") ">
        <div align="center" class="col-md-12 msgSucesso">
            <s:property value="mensagemSucesso"/>
        </div>
    </s:if>
</div>

