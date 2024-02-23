<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="opcoes.block"/>
        </h4>
    </div>
</div>
<!--// CONTEUšDO PRINCIPAL DA PA?GINA -->
<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="status">
            <h2>Status</h2>
            <div class="info">
                <p>
                    <s:text name="telaDigital.tensaoEntrada"/>
                    <br>
                    <span id="tensaoEntrada">
						<strong><s:property value="medidoresEstado.tensaoEntrada"/></strong>
					</span>
                    V
                </p>
                <p>
                    <s:text name="telaDigital.tensaoSaida"/>
                    <br>
                    <span id="tensaoSaida">
						<strong><s:property value="medidoresEstado.tensaoSaida"/></strong>
					</span>
                    V
                </p>
                <p>
                    <s:text name="telaDigital.tensaoBateria"/>
                    <br>
                    <span id="porcentagemTensaoBateria">
						<strong><s:property value="medidoresEstado.porcentagemTensaoBateria"/></strong>
					</span>
                    %
                </p>
                <p>
                    <s:text name="telaDigital.potenciaSaida"/>
                    <br>
                    <span id="potenciaSaida">
						<strong><s:property value="medidoresEstado.potenciaSaida"/></strong>
					</span>
                    %
                </p>
            </div>
        </div>
        <div class="control-group"></div>
    </div>
    <div class="col-md-8">
        <div class="status">
            <h2 id="txImagem" class="text-center">
                <s:property value="modo"/>
            </h2>
            <div class="text-center bloco">
                <img id="imagem" class="imagem"
                     src="<%=request.getContextPath()%>/imagens/status/<s:property value="imagem"/>"/>
            </div>
        </div>
        <div class="control-group"></div>
    </div>
</div>
<div id="frameBloco" style="display: none"></div>

