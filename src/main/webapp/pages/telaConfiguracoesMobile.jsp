<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.usumobile"/>
        </h4>
    </div>
</div>
<s:if test="locked">
    <div class="row">
        <div class="col-md-12">
            <s:text name="telaBlock.serial"/>:
            <a href="javascript:redirectConfig()"><s:text name="menu.configuracoes.servidorMobile"/></a>
        </div>
    </div>
</s:if>
<s:if test="!locked">
    <div class="row">
        <div class="col-md-12">
            <button type="button" class="btn btn-interno" style="float: left"
                    onclick="abrirModalCadastro('<s:property value="usuario"/>', '', 'true')">
                <span class="ico_novatarefa"></span>
                <s:text name="botao.novo"/>
            </button>
        </div>
        <br/><br/><br/>
        <div class="col-md-12">

            <div class="col-md-12">
                <div id="divMensagem">
                    <s:if test="mensagemSucesso != null && mensagemSucesso != \"\"">
                        <div class="text-center msgSucesso">
                            <s:property value="mensagemSucesso"/>
                        </div>
                    </s:if>
                    <s:if test="mensagemErro != null && mensagemErro != \"\"">
                        <div class="text-center msgErro">
                            <s:property value="mensagemErro"/>
                        </div>
                    </s:if>
                </div>
            </div>

            <table id="table" class="table table-striped table-bordered" style="background: #f5f5f5">
                <thead style="background: #CCC">
                <tr>
                    <th width="20%"><s:text name="usuario.usuario"/></th>
                    <th width="60%">IP</th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>
                <s:if test="%{listUsuariosMobile.isEmpty()}">
                    <tr>
                        <td colspan="3">
                            <h5><s:text name="geral.lista.nenhum"/></h5>
                        </td>
                    </tr>
                </s:if>
                <s:else>
                    <s:iterator value="listUsuariosMobile" var="log" status="linha">
                        <tr>
                            <td><s:property value="usuario"/></td>
                            <td><s:property value="ip"/></td>
                            <td class="btn-column">
                                <a class="btn"
                                   href="javascript:abrirModalIpsQrCode('<s:property value="usuario"/>', '<s:property value="permissao"/>', '<s:property value="ip"/>')">
                                    <span class="glyphicon glyphicon-qrcode"></span>
                                </a>
                                <a class="btn"
                                   href="javascript:abrirModalCadastro('<s:property value="usuario"/>', '<s:property value="permissao"/>', 'false')">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                                <a class="btn" href="javascript:excluirUsuarioMobile('<s:property value="usuario"/>')">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </a>
                            </td>
                        </tr>
                    </s:iterator>
                </s:else>
                </tbody>
            </table>

        </div>
    </div>
</s:if>

<!-- MODAL PARA CADASTRO E EDICAO DE USUÁRIO MOBILE -->
<div id="modalCadastro" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <s:form id="telaModalCadastro" name="telaModalCadastro" action="/salvarTelaConfiguracoesMobile">
            <input type="hidden" id="novo" name="novo">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="modalCadastroTitulo" class="modal-title">
                        <s:text name="usuario.cadastrar"/>
                    </h4>
                    <h4 id="modalEdicaoTitulo" class="modal-title">
                        <s:text name="usuario.editar"/>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-body" style="margin: 0">
                        <div class="control-group">
                            <label><s:text name="usuario.usuario"/></label>
                            <div class="controls">
                                <s:textfield id="usuario" name="usuarioMobile.usuario" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label><s:text name="usuario.senha"/></label>
                            <s:password id="senha" name="usuarioMobile.senha" maxlength="16" cssClass="form-control"/>
                        </div>
                        <div class="control-group">
                            <label><s:text name="usuario.confirmar.senha"/></label>
                            <div class="controls">
                                <s:password id="confirmeSenha" maxlength="16" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label><s:text name="usuario.perfil"/> </label>
                            <div class="controls">
                                <s:select id="perfil" name="usuarioMobile.permissao" list="usuarioMobile.permissoes"
                                          listKey="key" listValue="value" cssClass="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-body" style="margin: 0">
                        <button type="button"
                                onclick="iniciaCadastroUsuario(document.telaModalCadastro)"
                                class="btn btn-interno" data-toggle="modal"
                                data-target="#modalCadastro">
                            <span class="ico_salvar"></span>
                            <s:text name="usuario.botao.salvar"/>
                        </button>
                    </div>
                </div>
            </div>
        </s:form>
    </div>
</div>

<!-- MODAL PARA LISTA DE IPS E QRCODE -->
<div id="modalIpsQrCode" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <s:form id="telaModalIpQrCode" name="telaModalIpQrCode" action="/salvarTelaConfiguracoesMobile">
            <s:hidden id="usuarioHidden" name="usuarioMobile.usuario"/>
            <s:hidden id="permissaoHidden" name="usuarioMobile.permissao"/>
            <div class="modal-content">

                <div id="painelIps">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">
                            <s:text name="qrcode.cadastro"/>
                        </h4>
                        <span class="badge">
						<span id="usuarioDisplayPainelIp"></span>
						-
						<span id="ipDisplayPainelIp"></span>
					</span>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-body" style="margin: 0">
                            <div class="control-group">
                                <p><b><s:text name="qrcode.ip.filtro"/></b></p>
                                <div class="col-md-3" style="padding-left: 0">
                                    <s:checkbox id="ipv4" name="filtroIpv4" value="true" onchange="filtrarIPs('')"/>
                                    <label style="font-weight: normal; vertical-align: text-top;" for="ipv4"><s:text
                                            name="IPv4"/></label>
                                </div>
                                <div class="col-md-3">
                                    <s:checkbox id="ipv6" name="filtroIpv6" onchange="filtrarIPs('')"/>
                                    <label style="font-weight: normal; vertical-align: text-top;" for="ipv6"><s:text
                                            name="IPv6"/></label>
                                </div>
                            </div>
                            <br/><br/>
                            <div class="control-group">
                                <p><b><s:text name="qrcode.ip.selecione"/></b></p>
                                <div id="filtroIpv4">
                                    <ul style="list-style: none; padding-left: 10px;">
                                        <s:iterator value="usuarioMobile.ipsTipoIpv4" status="status">
                                            <li>
                                                <input type="radio" name="ip"
                                                       id="ipv4<s:property value="%{#status.index}"/>"
                                                       value="<s:property/>" onclick="selecionarIP(this.value)">
                                                <label for="ipv4<s:property value="%{#status.index}"/>"><s:property/></label>
                                            </li>
                                        </s:iterator>
                                    </ul>
                                </div>
                                <div id="filtroIpv6">
                                    <ul style="list-style: none; padding-left: 10px;">
                                        <s:iterator value="usuarioMobile.ipsTipoIpv6" status="status">
                                            <li>
                                                <input type="radio" name="ip"
                                                       id="ipv6<s:property value="%{#status.index}"/>"
                                                       value="<s:property/>" onclick="selecionarIP(this.value)">
                                                <label for="ipv6<s:property value="%{#status.index}"/>"><s:property/></label>
                                            </li>
                                        </s:iterator>
                                    </ul>
                                </div>
                                <s:hidden id="ipSelecionadoHidden" name="usuarioMobile.ip"/>
                            </div>
                        </div>
                        <div class="panel panel-body" style="margin: 0">
                            <button id="btnQrCode"
                                    type="button"
                                    onclick="mostrarPainelQrCodeEGerar(document.telaModalIpQrCode);"
                                    class="btn btn-interno" data-toggle="modal"
                                    data-target="#modalIp">
                                <span class="glyphicon glyphicon-qrcode"></span>
                                <s:text name="qrcode.geracao"/>
                            </button>
                        </div>
                    </div>
                </div>

                <div id="painelQrCode">
                    <div class="modal-header">
                        <button type="button" class="close" onclick="javascript:fecharModalQrcode()">&times;</button>
                        <h4 class="modal-title">
                            <s:text name="qrcode.cadastro"/>
                        </h4>
                        <span class="badge">
						<span id="usuarioDisplayPainelQrCode"></span>
						-
						<span id="ipDisplayPainelQrCode"></span>
					</span>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-body" style="margin: 0">
                            <div class="col-md-5">
                                <div id="qrcode"></div>
                            </div>
                            <div class="col-md-7">
                                <div id="qrcode-text">
                                    <h3 style="text-align: center">
                                        <s:text name="qrcode.instrucoes"/>
                                    </h3>
                                    <ol>
                                        <li><s:text name="qrcode.instrucao1"/></li>
                                        <li><s:text name="qrcode.instrucao2"/></li>
                                        <li><s:text name="qrcode.instrucao3"/></li>
                                        <li><s:text name="qrcode.instrucao4"/></li>
                                    </ol>
                                </div>
                                <br/><br/>
                                <div class="extra4" style="text-align: center">
                                    <s:text name="qrcode.expires"/> 15 <s:text name="qrcode.minutos"/>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-body" style="margin: 0">
                            <div class="col-md-6">
                                <button
                                        type="button"
                                        class="btn btn-interno"
                                        style="float: left"
                                        onclick="javascript:mostrarPainelIps()">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <s:text name="botao.voltar"/>
                                </button>
                            </div>
                            <div class="col-md-6">
                                <button
                                        type="button"
                                        class="btn btn-interno"
                                        onclick="javascript:fecharModalQrcode()">
                                    <span class="glyphicon glyphicon-check"></span>
                                    <s:text name="qrcode.ok"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </s:form>
    </div>
</div>