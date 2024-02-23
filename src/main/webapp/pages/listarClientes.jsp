<%@ taglib prefix="s" uri="/struts-tags" %>
<script>
    try {
        paginaAtual = parseInt('<s:property value="controleBean.paginaAtual" />');
    } catch (e) {
    }
</script>
<h4>
    <s:text name="opcoes.clientsConnect"/>
</h4>
<s:set var="funcaoPaginacao" value="'clientes([pagina])'"/>
<jsp:include page="includes/formPaginacao.jsp"/>
<hr class="col-md-13">
<div class="col-ld-4">

    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th><s:text name="cliente.ip"/></th>
                <th><s:text name="cliente.hostname"/></th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="clientes" var="cliente" status="linha">
                <tr>
                    <td>&nbsp;<s:property value="numeroIp"/></td>
                    <td>&nbsp;<s:property value="nome"/></td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>

</div>
<br>
<jsp:include page="includes/paginacao.jsp"/>
<br>
<div class="descricao">
    <s:text name="cliente.texto"/>
</div>
<br>
<div class="col-lg-8">
    <a class="Aplicativo" href="instaladores/setup_cliente.exe"> <s:text
            name="cliente.windows"/>
    </a><br> <a class="Aplicativo"
                href="instaladores/install_SMS_Client.tar.gz"> <s:text
        name="cliente.linux"/>
</a><br> <a class="Aplicativo" href="instaladores/PowerViewClient.dmg">
    <s:text name="cliente.mac"/>
</a><br> <a class="Aplicativo" target="_blank"
            href="instaladores/manual_do_usuario_sms_power_view_client.pdf"> <s:text
        name="cliente.manual"/>
</a>
</div>