<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('#btnSerialEdit').on('click', function () {
            $('#serial').removeAttr("disabled");
            $('#btnSerial').removeAttr("disabled");
        });
    });
    if ("<s:property value="mudouLingua" />" === "true") {
        document.location.reload(true);
    }
</script>

<!--// CONTEÚDO PRINCIPAL DA PÁGINA -->
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.geral"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<s:form method="post" id="salvarTelaConfiguracoesGeral" action="/s2/salvarTelaConfiguracoesGeral" cssClass="formulario"
        enctype="multipart/form-data" onsubmit="return false">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body">
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

                <div class="col-md-6">
                    <div class="control-group">
                        <label><s:text name="configuracoes.ip.servidor"/>:</label>
                        <div class="controls">
                            <s:textfield id="ipServidor" name="configuracoes.ipServidor" size="15"
                                         onkeyup="FormatIP(this,this.value,event)"
                                         onblur="CheckFormatIP(this,this.value)" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label><s:text name="configuracoes.porta.http"/>:</label>
                        <div class="controls">
                            <s:textfield id="portaServidor" maxlength="5" name="configuracoes.portaTomcat" size="5"
                                         cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label><s:text name="configuracoes.porta.https"/>:</label>
                        <div class="controls">
                            <s:textfield id="portaServidorHttps" maxlength="5" name="configuracoes.portaTomcatHttps"
                                         size="5" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label><s:text name="configuracoes.lingua"/>:</label>
                        <div class="controls">
                            <s:select cssClass="form-control" value="configuracoes.lingua" list="listaLinguas"
                                      listKey="value" listValue="label"
                                      name="configuracoes.lingua"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label><s:text name="configuracoes.gatewaymobile.serial"/>:</label>
                        <div class="controls">
                            <s:textfield id="serial" name="configuracoes.serial" onkeypress="return onlynumber();"
                                         cssClass="form-control" maxlength="12"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="control-group">
                        <label><s:text name="configuracoes.senha"/>:</label>
                        <div class="controls">
                            <s:password cssClass="form-control" id="senha" name="configuracoes.senha" size="10"
                                        maxlength="16"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label><s:text name="configuracoes.confSenha"/>:</label>
                        <div class="controls">
                            <input class="form-control" type="password" name="confSenha" size="10" maxlength="16"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label><s:text name="configuracoes.name"/>:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="deployName" name="configuracoes.deployName"
                                         maxlength="12"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label>Script Shutdown:</label>
                        <div class="controls">
                            <s:textfield cssClass="form-control" id="script" name="configuracoes.script"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label><s:text name="configuracoes.tempoConsultaNobreak"/> (<s:text
                                name="configuracoes.segundos"/>):</label>
                        <div class="controls">
                            <s:select cssClass="form-control" value="configuracoes.tempoConsultaNobreak"
                                      list="listaTemposConsultaNobreak" listKey="value" listValue="label"
                                      name="configuracoes.tempoConsultaNobreak"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-body">
            <div class="col-md-12">
                <div class="extra4">
                    <s:text name="configuracoes.gatewaymobile.serial.info"/>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <button onclick="salvarConfiguracoes(this.form)" class="btn btn-info">
                <span class="ico_salvar"></span>
                <s:text name="configuracoes.salvar"/>
            </button>
        </div>
    </div>
</s:form>
