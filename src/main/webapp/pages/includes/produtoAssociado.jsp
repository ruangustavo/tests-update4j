<%@ taglib prefix="s" uri="/struts-tags" %>

<h4>Alerta 24h</h4>
<hr class="col-md-13">
<div class="panel-body">
    <div class="alertalogado">
        <div class="login">
            <s:text name="web.ws.usuario"/>: <span class="bold"><s:property value="configuracoes.usuarioWS"/></span>
        </div>
        <div class="acao">
            <a id="botaoOutroUsuario" href="javascript:efetuaLogOffA24h()"><s:text
                    name="configuracoes.trocarUsuario"/></a>
        </div>
    </div>

    <div class="alerta24h">
        <h4><s:text name="configuracoes.alerta24h.tituloConectado"/></h4>
        <p>&nbsp;</p>
        <div class="col-ld-4">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th><s:text name="configuracoes.produto.serial"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><s:property value="produto.serial"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <s:if test="msg != null && msg != \"\"">
                <h6>
                    <s:property escape="false" value="%{msg}"/>
                </h6>
            </s:if>
            <s:if test="mensagemSucesso != null && mensagemSucesso != \"\"">
                <h6 class="msgSucesso">
                    <s:property escape="false" value="%{mensagemSucesso}"/>
                </h6>
            </s:if>
            <s:if test="mensagemErro != null && mensagemErro != \"\"">
                <h6 class="msgErro">
                    <s:property escape="false" value="%{mensagemErro}"/>
                </h6>
            </s:if>
        </div>
    </div>
</div>
<br>