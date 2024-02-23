<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>EMAIL > <s:text name="configuracoes.email.title"/></h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <s:if test="msgSucesso != null && msgSucesso != \"\"">
            <div class="text-center msgSucesso">
                <s:property value="getText(msgSucesso)"/>
            </div>
        </s:if>
        <div class="panel panel-body">
            <s:if test="msg != null && msg != \"\"">
                <div class="text-center msgErro">
                    <s:property value="msg"/>
                </div>
            </s:if>
            <s:if test="emailMensagemBean.listaEmailMensagem == null || emailMensagemBean.listaEmailMensagem.isEmpty() ">
                <s:text name="configuracoes.email.nenhumEmailCadastrado"/>
            </s:if>
            <s:else>
                <table class="table table-striped table-hover" style="width: 100%">
                    <thead>
                    <tr>
                        <th style="width:  35%">Email</th>
                        <th style="width:  0%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="emailMensagemBean.listaEmailMensagem" var="emailMsg">
                        <tr>
                            <td class="vertical-middle">
                                <s:property value="email"/>
                            </td>
                            <td class="col-acoes vertical-middle">
                                <button type="button" class="btn btn-info"
                                        onclick="prepareEditarEmailMsg(<s:property value="id"/>)">
                                    <span class="ico_editar"></span>
                                </button>
                                <button type="button" class="btn btn-info"
                                        onclick="confirmDeleteEmailMsg(<s:property value="id"/>, '<s:text
                                                name="configuracoes.email.confirm.delete"/>')">
                                    <span class="ico_excluir"></span>
                                </button>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </s:else>
        </div>
    </div>
</div>

<div class="actions">
    <button id="voltarEmailMsgButton" type="button" name="voltarEmailMsgButton" class="btn btn-info"
            onclick="configBroadcast()">
        <s:text name="back"/>
    </button>

    <button id="newEmailMsgButton" type="button" name="newEmailMsgButton" class="btn btn-info"
            onclick="prepareNovoEmailMsg()">
        <s:text name="new"/>
    </button>
</div>


<!--// FIM: Conteúdo principal da página -->
