<%@page import="br.com.sms.powerview.beans.TarefaBean" %>
<%@page import="br.com.sms.powerview.util.Util" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="container" id="serie-blocked">
    <p>
        TESTE
    </p>
</div>
<div class="container" id="serie-ok">
    <div class="row">
        <div class="col-md-9">
            <h4>Mobile</h4>
            <hr/>
            <div class="panel-body">
                <div class="row">
                    <div class="alerta24h">
                        <h4>Cadastrar novo usuário</h4>
                        <div class="col-md-3">
                            <br> <img src="img/ico_mobile.png">
                        </div>
                        <br>
                        <div class="col-md-9">
                            <p>
                                Usuário
                                <input type="text" class="form-control">
                                Senha
                                <input type="text" class="form-control">
                                Confirmar Senha
                                <input type="text" class="form-control">
                            </p>
                        </div>
                        <a href="configAlertaLogado.html" class="btn btn-interno" style="margin-top: 15px;">
                            <span class="ico_salvar"></span>
                            Salvar
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="alerta24h">
                        <h4>Lista de usuários</h4>
                        <div class="col-ld-4">
                            <div class="table-responsive" style="width: 100%; overflow-y: no;">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th>Usuário</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>

                                <div class="listausuario">
                                    <div class="usuario" value="usuario"></div>
                                    <div class="icones">
                                        <button type="button" class="btn btn-info" data-toggle="collapse"
                                                data-target="#demo1">
                                            <img src="img/ico_editar.png" width="17" height="16">
                                        </button>
                                        <img src="img/ico_excluir.png"
                                             onclick="excluirUsuarioMobile('<s:property value="usuario"/>')">
                                    </div>
                                    <div id="demo1" class="collapse">
                                        <div class="configsenha">
                                            <p>
                                                Nova Senha
                                                <input type="text" class="form-control">
                                                Confirmar Senha
                                                <input type="text" class="form-control">
                                            </p>
                                            <a href="configAlertaConectado.html">
                                                <span class="ico_salvar"></span>
                                                salvar
                                            </a>
                                        </div>
                                    </div>
                                </div>