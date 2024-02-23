<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="medidores.size() > 0 || medidoresTri.size() > 0">
    <s:if test="medidoresTri.size() > 0">
        <s:iterator status="item" value="%{medidoresTri}">
            <s:set var="contItem" value="0"/>
            <s:set var="benMedidor" value="%{medidoresTri[top.key].get(0)}"/>
            <div class="col-md-13 Gtrifasico">
                <h4>
                    <!--div class="ico_<s:property value="%{#benMedidor.tipo.toString()}"/>"></div -->
                    <s:text name="%{#benMedidor.tipo.toString()}"/>
                </h4>
                <s:iterator value="%{medidoresTri[top.key]}" status="valor">
                    <div class="col-md-4 medidor">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <div class="nomeDigital"><s:property value="%{labelFases.get(#valor.index)}"/></div>
                            </div>
                            <div class="panel-body">
                                <div class="DigitalMin"><s:property value="minimoInt"/></div>
                                <div class="DigitalValor"><s:property value="valorInt"/><span><s:property
                                        value="%{#benMedidor.medida}"/></span></div>
                                <div class="DigitalMax"><s:property value="maximoInt"/></div>
                            </div>
                        </div>
                    </div>
                </s:iterator>
            </div>
            <br>
        </s:iterator>
        <s:if test="medidores.size() == 0">
            <jsp:include page="includes/legenda.jsp"/>
            <br>
        </s:if>
    </s:if>

    <s:if test="medidores.size() > 0">
        <s:iterator value="medidores" status="item">

            <div class="col-md-4 medidor">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <!--img src="/sms/imagens/ico_<s:property value="%{tipo.toString()}"/>.png" height="34"><br-->
                        <div class="nomeDigital"><s:text name="%{tipo.toString()}"/></div>

                    </div>
                    <div class="panel-body">
                        <div class="DigitalMin"><s:property value="minimoInt"/></div>
                        <div class="DigitalValor"><s:property value="valorInt"/><span><s:property
                                value="medida"/></span></div>
                        <div class="DigitalMax"><s:property value="maximoInt"/></div>
                    </div>
                </div>
            </div>
        </s:iterator>
        <jsp:include page="includes/legenda.jsp"/>
        <br>
    </s:if>

</s:if>
<s:else>
    <s:text name="telaDigital.semvalor"/>
</s:else>
