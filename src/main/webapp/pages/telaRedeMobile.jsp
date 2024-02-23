<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    .alerta24h {
        padding: 15px 50px 20px 50px;
        margin-bottom: 40px;
    }
</style>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <h4>Mobile</h4>
            <hr class="col-md-13">
            <div class="panel panel-body">
                <div class="row">
                    <s:if test="(mensagemErro != null && mensagemErro != \"\") ">
                        <div align="center" class="col-md-12 msgErro">
                            <s:property value="mensagemErro"/>
                        </div>
                    </s:if>
                    <div class="alerta24h">
                        <h4>Opções de rede</h4>
                        <div class="col-md-4 QR">
                            <s:iterator value="listRedePV" var="beanRede">
                                <div class="panel panel-default">
                                    <div class="panel-footer text-center">
                                        <img class="center"
                                             src="/sms/imagens/qrmobile/<s:property value="nomeArquivoQR"/>" width="80"
                                             height="80"> <br/>
                                        <br/> Conexão:
                                        <s:property value="tipoRede"/>
                                        <br/> Porta:
                                        <s:property value="porta"/>
                                        <br/> Ip:
                                        <s:property value="ip"/>
                                    </div>
                                </div>
                            </s:iterator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
