<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>
<div class="row">
    <div class="col-md-12 tabelaLogDadosTri">
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th rowspan="2"><s:text name="datalog.datal"/></th>
                    <th rowspan="2"><s:text name="datalog.hora"/></th>
                    <th colspan="3"><s:text name="datalog.tensaoEntrada"/></th>
                    <th colspan="3"><s:text name="datalog.tensaoBypass"/></th>
                    <th colspan="3"><s:text name="datalog.tensaoSaida"/></th>
                    <th colspan="3"><s:text name="datalog.potenciaSaida"/></th>
                    <th rowspan="2"><s:text name="datalog.frequenciaEntrada"/></th>
                    <th rowspan="2"><s:text name="datalog.frequenciaBypass"/></th>
                    <th rowspan="2"><s:text name="datalog.frequenciaSaida"/></th>
                    <th rowspan="2"><s:text name="datalog.tensaoBateria"/></th>
                    <th rowspan="2"><s:text name="datalog.temperatura"/></th>
                </tr>
                <tr>
                    <th>R</th>
                    <th>S</th>
                    <th>T</th>
                    <th class="tipo2">R</th>
                    <th class="tipo2">S</th>
                    <th class="tipo2">T</th>
                    <th>R</th>
                    <th>S</th>
                    <th>T</th>
                    <th class="tipo2">R</th>
                    <th class="tipo2">S</th>
                    <th class="tipo2">T</th>
                </tr>
                </thead>
                <tbody>

                <s:iterator value="logDadosTri" var="log" status="linha">
                    <tr>
                        <td>
                            <s:property value="dataDia"/>
                        </td>
                        <td>
                            <s:property value="dataHora"/>
                        </td>

                        <td>
                            <s:property value="tensaoEntradaR"/>
                        </td>
                        <td>
                            <s:property value="tensaoEntradaS"/>
                        </td>
                        <td>
                            <s:property value="tensaoEntradaT"/>
                        </td>

                        <td>
                            <s:property value="tensaoBypassR"/>
                        </td>
                        <td>
                            <s:property value="tensaoBypassS"/>
                        </td>
                        <td>
                            <s:property value="tensaoBypassT"/>
                        </td>

                        <td>
                            <s:property value="tensaoSaidaR"/>
                        </td>
                        <td>
                            <s:property value="tensaoSaidaS"/>
                        </td>
                        <td>
                            <s:property value="tensaoSaidaT"/>
                        </td>

                        <td>
                            <s:property value="potenciaSaidaR"/>
                        </td>
                        <td>
                            <s:property value="potenciaSaidaS"/>
                        </td>
                        <td>
                            <s:property value="potenciaSaidaT"/>
                        </td>

                        <td>
                            <s:property value="frequenciaEntrada"/>
                        </td>
                        <td>
                            <s:property value="frequenciaBypass"/>
                        </td>
                        <td>
                            <s:property value="frequenciaSaida"/>
                        </td>
                        <td>
                            <s:property value="porcentagemTensaoBateria"/>
                        </td>
                        <td>
                            <s:property value="temperatura"/>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
</div>