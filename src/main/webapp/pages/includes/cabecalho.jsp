<%@ page import="java.util.Optional" %>
<header>
    <div class="container">
        <div class="navbar-header">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                            aria-expanded="false"
                            aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="https://<% out.print(Optional.ofNullable(System.getenv("HOSTNAME_ALERTA24H")).orElse(System.getProperty("HOSTNAME_ALERTA24H"))); %>" target="_blank">
                        <div class="logo logoPV" style="margin-left: 0px"></div>
                    </a>
                    <a href="https://www.sms.com.br" target="_blank">
                        <div class="logo logoLegrand"></div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="navbar-bg">
    <div id="navbar" class="navbar-collapse collapse container in" aria-expanded="true">
        <!-- Abas -->
        <div class="row">
            <div class="col-md-12">
                <a role="button" aria-expanded="false" data-toggle="modal" href="#responsive" class="sobre pull-right">
                    <span class="ico_sobre"></span>
                    <s:text name="menu.sobre"/>
                </a>
                <ul id="menu" class="nav navbar-nav">
                </ul>
            </div>
        </div>
        <!-- Abas -->


        <!-- Conteúdo Abas -->
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div id="conteudo-menu" class="tab-content pull-left"></div>
            </div>
        </div>
        <!--   % @ include file="sobre.jsp" % -->
        <!-- Conteúdo Abas -->
    </div>
</div>