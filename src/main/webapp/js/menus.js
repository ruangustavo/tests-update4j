var menus = {};
// Menus monofásicos
var menuMono = [{
    id: "menumonitor", container: "menu", classe: "active", efeito: "tab", acao: "#menu-monitor-submenu",
    submenus: [
        {
            id: "smopcoesdigital",
            container: "monitor-submenu",
            classe: "active",
            efeito: "",
            acao: "javascript:monitoresDigitais();"
        },
        {id: "smopcoesblock", container: "monitor-submenu", classe: "", efeito: "", acao: "javascript:blocos();"},
        {id: "smopcoesclients", container: "monitor-submenu", classe: "", efeito: "", acao: "javascript:clientes();"},
    ]
},
    {
        id: "menucontrole", container: "menu", classe: "", efeito: "tab", acao: "#menu-controle-submenu",
        submenus: [
            {
                id: "smopcoesagenda",
                container: "controle-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:listarAgendaEventos(1);"
            },
            {
                id: "smopcoescontrole",
                container: "controle-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:telaDisparo();"
            }
        ]
    },
    {
        id: "menulog", container: "menu", classe: "", efeito: "tab", acao: "#menu-log-submenu",
        submenus: [
            {
                id: "smopcoesdatalog",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:listarLogDados();"
            },
            {
                id: "smopcoeseventlog",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:listarLogDisparos();"
            },
            {
                id: "smopcoeslogProcesso",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:listarLogProcesso();"
            },
            {
                id: "smopcoestesteAut",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:listarTestesAutonomia();"
            },
            {
                id: "smarquivohistorico",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:historico();"
            }
        ]
    },
    {
        id: "menuopcoes", container: "menu", classe: "", efeito: "tab", acao: "#menu-opcoes-submenu",
        submenus: [
            {
                id: "smopcoesgeral",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configGeral();"
            },
            {
                id: "smopcoesbroadcast",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configBroadcast();"
            },
            {
                id: "smopcoesshutdown",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configShutdown();"
            },
            {
                id: "smopcoesalerta24h",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configAlerta24h();"
            },
            {
                id: "smopcoespopup",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configPopup();"
            },
            {
                id: "smopcoesinternet",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configInternet();"
            },
            {id: "smopcoeslog", container: "opcoes-submenu", classe: "", efeito: "", acao: "javascript:configLogs();"},
        ]
    },
    {
        id: "menumobile", container: "menu", classe: "", efeito: "tab", acao: "#menu-mobile-submenu",
        submenus: [
            {
                id: "smopcoesusuariomobile",
                container: "mobile-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configUsuarioMobile();"
            }
        ]
    }];

//Menus trifásicos
var menuTri = [{
    id: "menumonitor", container: "menu", classe: "active", efeito: "tab", acao: "#menu-monitor-submenu",
    submenus: [
        {
            id: "smopcoesdigital",
            container: "monitor-submenu",
            classe: "active",
            efeito: "",
            acao: "javascript:monitoresDigitais();"
        },
        {id: "smopcoesclients", container: "monitor-submenu", classe: "", efeito: "", acao: "javascript:clientes();"},
    ]
},
    {
        id: "menulog", container: "menu", classe: "", efeito: "tab", acao: "#menu-log-submenu",
        submenus: [
            {
                id: "smopcoesdatalog",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:listarLogDados();"
            },
            {
                id: "smopcoeseventlog",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:listarLogDisparos();"
            },
            {
                id: "smopcoeslogProcesso",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:listarLogProcesso();"
            },
            {
                id: "smarquivohistorico",
                container: "log-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:historico();"
            },
            {id: "smdumplog", container: "log-submenu", classe: "", efeito: "", acao: "javascript:dump();"}
        ]
    },
    {
        id: "menuopcoes", container: "menu", classe: "", efeito: "tab", acao: "#menu-opcoes-submenu",
        submenus: [
            {
                id: "smopcoesgeral",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configGeral();"
            },
            {
                id: "smopcoesbroadcast",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configBroadcast();"
            },
            {
                id: "smopcoesshutdown",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configShutdown();"
            },
            {
                id: "smopcoesalerta24h",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configAlerta24h();"
            },
            {
                id: "smopcoespopup",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configPopup();"
            },
            {
                id: "smopcoesinternet",
                container: "opcoes-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configInternet();"
            },
            {id: "smopcoeslog", container: "opcoes-submenu", classe: "", efeito: "", acao: "javascript:configLogs();"},
        ]
    },
    {
        id: "menumobile", container: "menu", classe: "", efeito: "tab", acao: "#menu-mobile-submenu",
        submenus: [
            {
                id: "smopcoesusuariomobile",
                container: "mobile-submenu",
                classe: "",
                efeito: "",
                acao: "javascript:configUsuarioMobile();"
            }
        ]
    }];

// Menus principais
menus ["monofasico"] = menuMono;
menus ["trifasico"] = menuTri;

function criaMenu(id) {
    var obj = menus[id];
    if (obj == null) {
        return;
    }
    for (var i = 0; i < obj.length; i++) {
        var menu = obj[i];
        var texto = null;
        try {
            texto = eval(menu.id);
        } catch (e) {
            continue;
        }
        if (texto == null || texto == "") {
            continue;
        }
        var elem = $('<li/>'); // class="dropdown"
        var expandido = (menu.classe == "active");
        elem.addClass(menu.classe);
        var link = $('<a role="button" aria-expanded="' + expandido + '"/>'); // data-toggle="dropdown"
        if (menu.efeito != null && menu.efeito != '') {
            link.attr("data-toggle", menu.efeito);
        }
        link.attr("href", menu.acao);
        link.html(texto);
        elem.append(link);
        $("#" + menu.container).append(elem);
        if (menu.submenus && menu.submenus.length > 0) {
            criaSubmenus(menu.submenus, menu.acao.substring(1));
        }
    }
    limparConteudo();
}

//<li><a href="javascript:gcGrupo()">Categorias</a></li>
function criaSubmenus(submenus, idSubmenu) {
    var divNav = $("#" + idSubmenu + " nav");
    if (divNav.length == 0) {
        divNav = criaSubmenu(idSubmenu);
    }
    for (var i = 0; i < submenus.length; i++) {
        var item = submenus[i];
        var texto = null;
        try {
            texto = eval(item.id);
        } catch (e) {
            continue;
        }
        if (texto == null || texto == "") {
            continue;
        }
        var subMenu = $("#" + item.container);
        if (subMenu.length == 0) {
            subMenu = criaContainer(item.container, divNav);
        }
        var elem = $("<li />");
        elem.attr("id", item.id);
        elem.addClass(item.classe);

        var link = $('<a/>');
        link.attr("href", item.acao);
        link.text(texto);

        elem.append(link);
        subMenu.append(elem);
    }
    ativaSubmenus();
}

var primeiroSubMenu = "in active";

function criaSubmenu(id) {
    var subMenu = $('<div/>');
    subMenu.addClass("tab-pane fade " + primeiroSubMenu + " pull-left");
    primeiroSubMenu = "";
    subMenu.attr("id", id);
    var nav = $("<nav />");
    nav.addClass("menu pull-left");
    subMenu.append(nav);
    $("#conteudo-menu").append(subMenu);

    return $("#" + id + " nav");
}

function criaContainer(id, divSubmenu) {
    var container = $('<ul/>'); //role="menu"
    container.attr("id", id);
    divSubmenu.append(container);
    return $("#" + id);
}

function limparConteudo() {
    limparThread();

    $("#menu a:first").tab('show');
    $("#menu a:first").addClass('active');
    var link = $("#menu a:first")[0].hash;
    $(link).tab('show');
    disparaClick($(link + " a:first")[0]);
    ativaSubMenu($(link + " a:first")[0])

    $("#menu li a").click(function () {
        if ($(this).attr("data-toggle") == "modal") {
            return;
        }
        $("#conteudo-ajax").html("");
        limparThread();
        disparaClick($(this.hash + " a:first")[0]);
        ativaSubMenu($(this.hash + " a:first")[0])
    });
}

function limparThread() {
    if (mainThread != null) {
        clearInterval(mainThread);
        mainThread = null;
    }
}

function disparaClick(obj) {
    try {
        eval($(obj).attr('href'));
    } catch (e) {
    }
}


function ativaSubmenus() {
    $("#monitor\-submenu li a, #controle\-submenu li a, #log\-submenu li a, #opcoes\-submenu li a").click(function () {
        ativaSubMenu(this);
    });
}

function ativaSubMenu(item) {
    $(item).parent().parent().find("li a").removeClass("active");
    $(item).addClass("active");
}
