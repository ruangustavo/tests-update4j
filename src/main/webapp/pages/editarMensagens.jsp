<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.broadcast"/>
            &gt;
            <s:text name="telaConfiguracoes.configuraMensagens"/>
            &gt;
            <s:text name="telaEditarMensagens.titulo"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form action="/salvarMensagem" cssClass="formulario" onsubmit="return false;">
    <s:hidden name="mensagem.tipo"/>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body">
                <div class="col-md-8" style="margin-bottom: 10px;">
                    <h4>
                        <s:property value="textoTipo"/>
                    </h4>
                </div>
                <div class="col-md-8" style="clear: left; margin-bottom: 10px; line-height: 34px;">
                    <label class="col-md-5" for="descricao"><s:text name="telaEditarMensagens.Descricao"/>:</label>
                    <s:textfield cssClass="campo-form col-md-6" id="descricao" name="mensagem.descricao"/>
                </div>
                <div class="col-md-8" style="line-height: 34px; clear: left">
                    <label class="col-md-5" for="emailDestinatario"><s:text
                            name="telaEditarMensagens.mailDestinatario"/>:</label>
                    <s:textfield cssClass="campo-form col-md-6" id="emailDestinatario"
                                 name="mensagem.emailDestinatario"/>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <button onclick="salvarConfiguracoesMensagensBroadcast(this.form)" class="btn btn-info">
                <span class="ico_salvar"></span>
                <s:text name="configuracoes.salvar"/>
            </button>
            <button onclick="listarMensagensBroadcast();" class="btn btn-info">
                <span class="ico_excluir"></span>
                <s:text name="botao.cancelar"/>
            </button>
        </div>
    </div>
</s:form>
<!--// FIM DO CONTEÚDO -->