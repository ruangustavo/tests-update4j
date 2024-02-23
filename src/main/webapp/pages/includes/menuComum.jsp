<%@ taglib prefix="s" uri="/struts-tags" %>
<script>

    var msgAguarde = '<s:text name="web.mensagem.aguarde"/>';
    var linguagem = "<%=(String)session.getAttribute("LINGUA_JS")%>";
    //Paginação
    var pageFirst = "<s:text name="page.first"/>";
    var pagePrev = "<s:text name="page.prev"/>";
    var pageNext = "<s:text name="page.next"/>";
    var pageLast = "<s:text name="page.last"/>";
    var pageCurr = "<s:text name="page.curr"/>";
    var pagePage = "<s:text name="page.page"/>";

    //Agendamentos
    var msgAgendaFormCampoEvento = '<s:text name="alerta.salvarTarefa.evento"/>';
    var msgAgendaFormCampoFrequencia = '<s:text name="alerta.salvarTarefa.frequencia"/>';
    var msgAgendaFormCampoDuracao = '<s:text name="alerta.salvarTarefa.duracao"/>'
    var msgAgendaFormDataHoraInvaLida = '<s:text name="alerta.salvarTarefa.dataInvalida"/>';
    var msgAgendaFormDataHoraAnterior = '<s:text name="alerta.salvarTarefa.dataInferior"/>';
    var msgAgendaFormDataHoraLigarInvaLida = '<s:text name="alerta.salvarTarefa.dataLigarInvalida"/>';

    var DISPARO_TESTE_POR_TEMPO = "<%=(String)session.getAttribute("DISPARO_TESTE_POR_TEMPO")%>";
    var DISPARO_DESLIGAR_LIGAR_UPS = "<%=(String)session.getAttribute("DISPARO_DESLIGAR_LIGAR_UPS")%>";
    var TAREFA_TESTE_POR_TEMPO = "<%=(String)session.getAttribute("TAREFA_TESTE_POR_TEMPO")%>";
    var TAREFA_DESLIGAR_LIGAR_UPS = "<%=(String)session.getAttribute("TAREFA_DESLIGAR_LIGAR_UPS")%>";
    var TAREFA_UMA_VEZ = "<%=(String)session.getAttribute("TAREFA_UMA_VEZ")%>";
    var TEMPO_BATERIA_BAIXA = "<%=(String)session.getAttribute("TEMPO_BATERIA_BAIXA")%>";

    //Configuracoes
    var msgConfigBroadcastCampoServidorEmail = '<s:text name="alerta.confBroadcast.servidor"/>';
    var msgConfigBroadcastCampoRemetenteEmail = '<s:text name="alerta.confBroadcast.remetente"/>';
    var msgConfigBroadcastCampoUsuarioSMTP = '<s:text name="alerta.confBroadcast.usuarioSMTP"/>';
    var msgConfigBroadcastCampoSenhaSMTP = '<s:text name="alerta.confBroadcast.senhaSMTP"/>';
    var msgConfigBroadcastCampoPortaSMTP = '<s:text name="alerta.confBroadcast.portaSMTP"/>';
    var msgConfigBroadcastCampoRemetenteEmail = '<s:text name="alerta.editarMensagens.emailinvalido"/>';
    var msgConfigSalvaSucesso = '<s:text name="configuracoes.mobile.salvo"/>';

    var msgConfigMsgBroadcastCampoDescricao = '<s:text name="alerta.editarMensagens.descricao"/>';
    var msgConfigMsgBroadcastCampoEmail = '<s:text name="alerta.editarMensagens.email"/>';
    var msgConfigMsgBroadcastEmailInvalido = '<s:text name="alerta.editarMensagens.emailinvalido"/>';

    var msgConfigTesteEmailCheck = '<s:text name="alerta.telaTesteEmail.check"/>';

    var msgConfigShutdownErro = '<s:text name="alerta.configuracoesShutdown.erro"/>';
    var msgConfigShutdownUpsMax10Min = '<s:text name="alerta.configuracoes.shutdown.ups.max.10min"/>';

    //Validacao form serial
    var msgCampoSerialVazio = '<s:text name="configuracoes.gatewaymobile.serial.vazio"/>';
    var msgCampoSerialInvalido = '<s:text name="configuracoes.gatewaymobile.serial.invalido"/>';

    // Validacao form nome
    var msgCampoNomeVazio = '<s:text name="alerta.telaConfiguracaoes.erro.deployName"/>';

    // validações form log
    var msgDataInvalida = '<s:text name="log.data.invalida"/>';
    var msgDataObrig = '<s:text name="alerta.listarLogDado.data"/>';
    var msgHoraObrig = '<s:text name="alerta.listarLogDado.hora"/>';

    //validações form disparos
    var msgDataIniInvalida = '<s:text name="alerta.listarLogDisparo.datainicio"/>';
    var msgDataFimInvalida = '<s:text name="alerta.listarLogDisparo.datafim"/>';
    var msgHoraIniInvalida = '<s:text name="alerta.listarLogDisparo.horainicio"/>';
    var msgHoraFimInvalida = '<s:text name="alerta.listarLogDisparo.horafim"/>';
    var msgDataInicioAnterior = '<s:text name="alerta.listarLogDado.dataInicioAnterior"/>';

    // historico
    var arquivoLogSemSelecao = '<s:text name="arquivo.nao.informado"/>';

    //Dumplog
    var dumpLogPesquisando = '<s:text name="dumplog.pesquisando"/>';
    var dumpLogEmailVazio = '<s:text name="dumplog.erro.email.vazio"/>';
    var dumpLogEmailInvalido = '<s:text name="alerta.editarMensagens.emailinvalido"/>';

    //Configurações Alerta24h
    var cfgFalhaConexao = "<s:text name="alerta.telaConfiguracaoes.falhaConexao"/>";
    var cfgLogOffUsuarioA24h = "<s:text name="configuracoes.MensagemTrocarUsuario"/>";
    var cfgUsuarioA24hObrig = "<s:text name="alerta.telaConfiguracaoes.usuario"/>";
    var cfgSenhaA24hObrig = "<s:text name="alerta.telaConfiguracaoes.senha"/>";
    var cfgSenhaA24hDiff = "<s:text name="alerta.telaConfiguracaoes.confSenha"/>";
    var cfgSenhaA24hMin = "<s:text name="alerta.telaConfiguracaoes.minSenha"><s:param >9</s:param></s:text>";
    var cfgSenhaA24hIncorreta = "<s:text name="alerta.telaConfiguracaoes.confSenhaIncorreta"/>";
    var cfgSenhaA24hInvalida = "<s:text name="alerta.telaConfiguracaoes.confSenhaInvalida"/>";
    var cfgSemCodigoProdA24h = "<s:text name="alerta.telaConfiguracaoes.semCodigoProduto"/>";
    var cfgCodigoProdNaoSelA24h = "<s:text name="alerta.telaConfiguracaoes.codigoProduto"/>";

    //Valida��o de senhas
    var validacaoSenha_InformeASenha = "<s:text name="validacaoSenha.informeASenha"/>";
    var validacaoSenha_ConfirmeASenha = "<s:text name="validacaoSenha.confirmeASenha"/>";
    var validacaoSenha_SenhasN�oCoincidem = "<s:text name="validacaoSenha.senhasNaoCoincidem"/>";
    var validacaoSenha_SenhaInvalida = '<s:text name="validacaoSenha.senhaInvalida"/>' + " ! # $ % ' ( ) + - . / \\ : ? @ [ ] ^ _ ` { } ~";

    //Configurações internet (Proxy)
    var cfgIpProxyObrig = "<s:text name="alerta.telaConfiguracaoes.proxy.proxy"/>";
    var cfgIpProxyInvalido = '<s:text name="alerta.telaConfiguracaoes.proxy.proxy.invalido"/>';
    var cfgPortaProxyObrig = '<s:text name="alerta.telaConfiguracaoes.porta.proxy"/>';
    var cfgPortaProxyInvalida = '<s:text name="alerta.telaConfiguracaoes.porta.proxy.numerica"/>';
    var cfgUserProxyObrig = '<s:text name="alerta.telaConfiguracaoes.usuario.proxy"/>';
    var cfgPassProxyObrig = '<s:text name="alerta.telaConfiguracaoes.senha.proxy"/>';

    //Configurações logs
    var cfgLogTamMinQtdLog = '<s:text name="alerta.telaConfiguracaoes.erro.tamanhoMinimoQtdLog"/>';
    var cfgLogTamMinGrvDado = '<s:text name="alerta.telaConfiguracaoes.erro.tamanhoMinimoGravaDado"/>';
    var cfgLogRotacionarLog = '<s:text name="alerta.telaConfiguracaoes.erro.rotacionarLog"/>';

    //Sobre
    var menusobre = '<span class="ico_sobre"></span><s:text name="menu.sobre"/>';
</script>