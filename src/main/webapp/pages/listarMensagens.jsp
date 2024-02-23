<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.broadcast"/>
            &gt;
            <s:text name="telaConfiguracoes.configuraMensagens"/>
        </h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>
<div class="row">
    <s:if test="(msg != null && msg != \"\") ">
        <div align="center" class="col-md-12 msgSucesso">
            <s:property value="msg"/>
        </div>
    </s:if>
    <s:if test="(erro != null && erro != \"\") ">
        <div align="center" class="col-md-12 msgErro">
            <s:property value="erro"/>
        </div>
    </s:if>

    <div class="col-md-12">
        <ul class="list-unstyled list-mensagem-eventos">
            <s:iterator value="mensagens" status="mensagem">
            <li>
                <a class="btn btn-info" href="javascript:callEditarMensagemAction(<s:property value="value"/>);">
                    <span class="ico_evento ico_evento_<s:property value="value"/>"></span>
                    <s:property value="label"/>
                </a>
                </s:iterator>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-info" href="javascript:configBroadcast();">
            <span class="ico_config"></span>
            <s:text name="configuracoes.console.voltar"/>
        </a>
    </div>
</div>