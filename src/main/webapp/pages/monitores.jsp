<%@ taglib prefix="s" uri="/struts-tags" %>

<s:set var="contItem" value="0"/>

<s:if test="medidores.size() > 0">
    <div class="row">
        <s:iterator value="medidores" status="item">

            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <img src="/sms/imagens/ico_<s:property value="%{tipo.toString()}"/>.png" height="34"><br>
                        <div class="nomeDigital">
                            <s:text name="%{tipo.toString()}"/>
                        </div>

                    </div>
                    <div class="panel-body">
                        <div class="DigitalMin">
                            <s:property value="minimoInt"/>
                        </div>
                        <div class="DigitalValor">
                            <s:property value="valorInt"/>
                            <span>
								<s:property value="medida"/>
							</span>
                        </div>
                        <div class="DigitalMax">
                            <s:property value="maximoInt"/>
                        </div>
                    </div>
                </div>
            </div>
            <s:set var="contItem" value="%{#contItem + 1}"/>
        </s:iterator>
    </div>
    <jsp:include page="includes/legenda.jsp"/>
</s:if>
<s:else>
    <s:text name="telaDigital.semvalor"/>
</s:else>
