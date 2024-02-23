<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th><s:text name="datalog.datal"/></th>
                    <th><s:text name="datalog.hora"/></th>
                    <th><s:text name="datalog.tensaoEntrada"/></th>
                    <th><s:text name="datalog.tensaoSaida"/></th>
                    <th><s:text name="datalog.frequencia"/></th>
                    <th><s:text name="datalog.temperatura"/></th>
                    <th><s:text name="datalog.potencia"/></th>
                    <th><s:text name="datalog.bateria"/></th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="logDados" var="log" status="linha">
                    <tr>
                        <td>
                            <s:if test="lingua == 1">
                                <s:property value="dataDia"/>
                            </s:if>
                            <s:if test="lingua == 2">
                                <s:property value="dataDiaUS"/>
                            </s:if>
                        </td>
                        <td>
                            <s:if test="lingua == 1">
                                <s:property value="dataHora"/>
                            </s:if>
                            <s:if test="lingua == 2">
                                <s:property value="dataHoraUS"/>
                            </s:if>
                        </td>
                        <td>
                            <s:property value="tensaoEntrada"/>
                        </td>
                        <td>
                            <s:property value="tensaoSaida"/>
                        </td>
                        <td>
                            <s:property value="frequenciaSaida"/>
                        </td>
                        <td>
                            <s:property value="temperatura"/>
                        </td>
                        <td>
                            <s:property value="potenciaSaida"/>
                        </td>
                        <td>
                            <s:property value="porcentagemTensaoBateria"/>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>

</div>