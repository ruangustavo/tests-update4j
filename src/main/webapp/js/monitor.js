function monitoresDigitais() {
    incluirPaginaSemAguarde("/Monitores.action", "conteudo-ajax", "", "criaThreadAtualizacaoInfo();", "criaThreadAtualizacaoInfo();");
}

function criaThreadAtualizacaoInfo() {
    limparThread();
    mainThread = setTimeout("monitoresDigitais();", 5000);
}

function atualizaFrameInfo() {
    incluirPaginaSemAguarde("/atualizaInfo.action", "frameInfo");
    setTimeout("atualizaFrameInfo()", 5000);
}

function blocos() {
    incluirPagina("/Bloco.action", "conteudo-ajax", "", "criaThreadAtualizacaoBlocos();", "criaThreadAtualizacaoBlocos();");
}

function criaThreadAtualizacaoBlocos() {
    limparThread();
    mainThread = setTimeout("atualizaFrameBloco();", 5000);
}

function atualizaFrameBloco() {
    incluirPaginaSemAguarde("/atualizaBlock.action", "frameBloco");
    criaThreadAtualizacaoBlocos();
}

function clientes(pagina) {
    var dados = carregaDadosPagina(pagina);
    incluirPagina("/listaClientes.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoClientes();', null);
}

function atualizaClientes() {
    var dados = carregaDadosPagina(pegaPaginaAtual());
    incluirPaginaSemAguarde("/listaClientes.action", "conteudo-ajax", dados, 'criaThreadAtualizacaoClientes();', null);
}

function criaThreadAtualizacaoClientes() {
    ativarPaginacao();
    limparThread();
    mainThread = setTimeout("atualizaClientes();", 5000);
}