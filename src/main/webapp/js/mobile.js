function configUsuarioMobile() {
    ativaSubMenu($("#smopcoesusuariomobile a")[0]);
    incluirPagina("/telaUsuariosMobile!form.action", "conteudo-ajax", null, "eventosUsuariosMobile();", null);
}
