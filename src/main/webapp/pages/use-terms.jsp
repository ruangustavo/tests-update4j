<%@ page import="java.util.Optional" %>
<div class="modal-header">
    <div class="logoSMS-Sobre"></div>
</div>
<div class="modal-body padding-none">
    <div class="row-fluid">
        <div class="obs" style="text-align: left; padding-left: 30px;">
            <p>
                <input id="chkInformAge" type="checkbox" class="chkAge" style="position: relative; top: -3px;"
                       onclick="checkAcceptTermsAndAge()"/>
                <label class="lblAge">Informo que possuo mais de 18 anos no momento da utiliza��o do software.</label>
            </p>

            <p>
                <input id="chkAcceptTerms" type="checkbox" class="chkAcceptTerms" style="position: relative; top: -3px;"
                       onclick="checkAcceptTermsAndAge()"/>
                <label class="lblAcceptTerms">Eu li e concordo com os <a target="_blank" href="https://<% out.print(Optional.ofNullable(System.getenv("HOSTNAME_ALERTA24H")).orElse(System.getProperty("HOSTNAME_ALERTA24H"))); %>/termos-de-uso">termos de uso</a>
                    e <a target="_blank" href="https://<% out.print(Optional.ofNullable(System.getenv("HOSTNAME_ALERTA24H")).orElse(System.getProperty("HOSTNAME_ALERTA24H"))); %>/politica-de-privacidade">políticas de privacidade</a>.</label>
            </p>

            <div class="row">
                <div class="col-sm-4">
                    <button id="btnAcceptAndGoToSite" disabled class="btn btn-info" onclick="acceptTermsAndGoToSite();"
                            style="position: relative; top: 25px; margin-left: 15px;">
                        <span class="statusOn"></span>
                        Aceito
                    </button>
                </div>

                <div class="col-sm-8">
                    <div style="position: absolute; bottom: 0px; color: #444; width: 169px; right: 69px;">Aponte a
                        c�mera do seu celular e acesse nossos termos e pol�ticas.
                    </div>

                    <img id="qrcode-termos" src="<%=request.getContextPath()%>/imagens/qrcode-site-alerta.png"
                         style="width: 60px; float: right; position: relative; right: -15px;">
                </div>
            </div>
        </div>
    </div>
</div>