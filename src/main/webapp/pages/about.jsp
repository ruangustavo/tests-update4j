<%@ taglib prefix="s" uri="/struts-tags" %>
<% String HOSTNAME_ALERTA24H = Optional.ofNullable(System.getenv("HOSTNAME_ALERTA24H")).orElse(System.getProperty("HOSTNAME_ALERTA24H")); %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <div class="logoSMS-Sobre"></div>
    <br/>
    <div class="logoLegrand-Sobre"></div>
</div>
<div class="modal-body padding-none">
    <div class="row-fluid">
        <div class="obs">
            <p>
                <a target="_blank" href="https://<% out.print(HOSTNAME_ALERTA24H); %>/termos-de-uso">Termo de Uso</a> e
                <a target="_blank" href="https://<% out.print(HOSTNAME_ALERTA24H); %>/politica-de-privacidade">Política de Privacidade</a>.
            </p>
            <p>
                E-mail:
                <s:property value="smsEmail"/>
            </p>
            <p>
                Vers&atilde;o:
                <s:property value="pvVersao"/>
            </p>
            <p>
                <a href="https://www.sms.com.br/" target="_blank">https://www.sms.com.br</a>
            </p>
            <p>
                <a href="https://<% out.print(HOSTNAME_ALERTA24H); %>/fale-conosco" target="_blank">Fale Conosco</a>
            </p>
            <p>
                <a href="#" onclick="window.location.href=homeSite+'/exportReportPVD'">Relat&oacute;rio</a>
            </p>
            <br/>
            <p>&reg; SMS Todos os direitos reservados. <s:property value="anoCopyRight"/>.</p>
        </div>
    </div>
</div>