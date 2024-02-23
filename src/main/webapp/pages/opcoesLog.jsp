<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-md-12">
        <h4>
            <s:text name="arquivo.historico"/>
        </h4>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <hr/>
    </div>
</div>

<div class="row">
    <div class="col-md-4 col-xs-6" style="line-height: 23px;">
        <input type="radio" name="log" value="dado" checked="checked" id="radioDado" onclick="setDisplay(this);">
        <label for="radioDado"><s:text name="arquivo.historico.dados"/></label>
    </div>
    <div class="col-md-4 col-xs-6" style="line-height: 23px;">
        <input type="radio" name="log" value="evento" id="radioEvento" onclick="setDisplay(this);">
        <label for="radioEvento"><s:text name="arquivo.historico.eventos"/></label>
    </div>
</div>
<div class="row">
    <div class="col-md-8" id="frame" style="clear: left; margin-top: 10px"></div>
</div>
