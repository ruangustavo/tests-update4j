<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12">
        <label for="dataInicio"><s:text name="logeventos.dataInicio"/>:</label>
        <div class='input-group date' id='inicio'>
            <input name="dataInicio" id="dataInicio" value="<s:property value="dataInicio"/>"
                   class="form-control item-group date" readonly
                   style="cursor: pointer; min-width: 150px; padding: 1px 0;" type="text" size="10" maxlength="10"
                   data-date-format="DD/MM/YYYY HH"
                   onchange="propagaAlteracao('inicio')" onclick="propagaExibicao('inicio')"/>
            <span class="input-group-addon">
				<img src="/sms/imagens/ico_agenda.png" width="17" height="16">
			</span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12">
        <div style="clear: left; padding-top: 10px;">
            <label for="dataFim"><s:text name="logeventos.dataFim"/>:</label>
            <div class='input-group date' id='fim'>
                <input name="dataFim" id="dataFim" value="<s:property value="dataFim"/>"
                       class="form-control item-group date" readonly
                       style="cursor: pointer; min-width: 150px; padding: 1px 0;" type="text" size="10" maxlength="10"
                       data-date-format="DD/MM/YYYY HH"
                       onchange="propagaAlteracao('fim')" onclick="propagaExibicao('fim')"/>
                <span class="input-group-addon">
					<img src="/sms/imagens/ico_agenda.png" width="17" height="16">
				</span>
            </div>
        </div>
    </div>
</div>
