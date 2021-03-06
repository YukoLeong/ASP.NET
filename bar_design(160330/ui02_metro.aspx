<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ui02_metro.aspx.cs" Inherits="ui02_metro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu :: Metro UI CSS - The front-end framework for developing projects on the web in Windows Metro Style</title>
    <link href="ui02style/metro-icons.css" rel="stylesheet" />
    <link href="ui02style/metro.css" rel="stylesheet" />
    <link href="ui02style/docs.css" rel="stylesheet" />

    <script src="ui02style/jquery-2.1.3.min.js"></script>
    <script src="ui02style/metro.js"></script>
    <script src="ui02style/docs.js"></script>
    <script src="ui02style/run_prettify.js"></script>
    <script src="ui02style/ga.js"></script>
    <script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

</head>
<body onload="init()">
    <form id="form1" runat="server">
        <div class="container page-content">
            <h1><a href="index.html" class="nav-button transform"><span></span></a>&nbsp;Menu</h1>
            <!-- Google adsense block -->
            <div><ins class="adsbygoogle" style="display: block" data-ad-client="ca-pub-1632668592742327" data-ad-slot="8347181909" data-ad-format="auto"></ins></div>
            <script>
                (adsbygoogle = window.adsbygoogle || []).push({});
            </script>
            <!-- End of gad block -->

            <div class="example" data-text="example">
                <h1>Menu types</h1>
                <div class="grid">
                    <div class="row">
                        <div class="cell">
                            <h5>horizontal-menu</h5>
                            <ul class="horizontal-menu">
                                <li>
                                    <a href="#" class="dropdown-toggle">Products</a>
                                    <ul class="d-menu" data-role="dropdown">
                                        <li>
                                            <a href="#" class="dropdown-toggle">Windows</a>
                                            <ul class="d-menu" data-role="dropdown">
                                                <li><a href="#">Windows 8.1</a></li>
                                                <li><a href="#">Windows 10</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Skype</a></li>
                                        <li><a href="#">Office</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Download</a></li>
                                <li><a href="#">Support</a></li>
                                <li><a href="#">Buy...</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="cell">
                            <h5>horizontal-menu &amp; compact</h5>
                            <ul class="horizontal-menu compact">
                                <li>
                                    <a href="#" class="dropdown-toggle">Products</a>
                                    <ul class="d-menu" data-role="dropdown">
                                        <li><a href="#">Windows</a></li>
                                        <li><a href="#">Skype</a></li>
                                        <li><a href="#">Office</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Download</a></li>
                                <li><a href="#">Support</a></li>
                                <li><a href="#">Buy...</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="cell">
                            <h5>vertical-menu</h5>
                            <ul class="vertical-menu">
                                <li>
                                    <a href="#" class="dropdown-toggle">Products</a>
                                    <ul class="d-menu" data-role="dropdown">
                                        <li><a href="#">Windows</a></li>
                                        <li><a href="#">Skype</a></li>
                                        <li><a href="#">Office</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Download</a></li>
                                <li><a href="#">Support</a></li>
                                <li><a href="#">Buy...</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="cell">
                            <h5>vertical-menu &amp; compact</h5>
                            <ul class="vertical-menu compact">
                                <li>
                                    <a href="#" class="dropdown-toggle">Products</a>
                                    <ul class="d-menu" data-role="dropdown">
                                        <li><a href="#">Windows</a></li>
                                        <li><a href="#">Skype</a></li>
                                        <li><a href="#">Office</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Download</a></li>
                                <li><a href="#">Support</a></li>
                                <li><a href="#">Buy...</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="cell">
                            <h5>m-menu</h5>
                            <nav style="z-index: 1000; margin-bottom: 10px">
                                <ul class="m-menu">
                                    <li><a href="#">Home</a></li>
                                    <li class="active-container">
                                        <a href="#" class="dropdown-toggle">Download</a>
                                        <div class="m-menu-container open" data-role="dropdown">
                                            <ul class="inline-list">
                                                <li><a href="#">Windows</a></li>
                                                <li><a href="#">Office</a></li>
                                                <li><a href="#">Skype</a></li>
                                                <li><a href="#">Internet Explorer</a></li>
                                                <li><a href="#">Visio</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#" class="dropdown-toggle">Devices</a>
                                        <div class="m-menu-container" data-role="dropdown">
                                            <ul class="inline-list">
                                                <li><a href="#">Surface</a></li>
                                                <li><a href="#">Xbox</a></li>
                                                <li><a href="#">PC &amp; Tables</a></li>
                                                <li><a href="#">Phones</a></li>
                                                <li><a href="#">Accessories</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li><a href="#">Support</a></li>
                                    <li><a href="#">Store</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <div class="row">
                        <div class="cell">
                            <h5>m-menu</h5>
                            <nav style="z-index: 1000; margin-bottom: 180px">
                                <ul class="m-menu">
                                    <li><a href="#"><span class="mif-home"></span></a></li>
                                    <li class="active-container">
                                        <a href="#" class="dropdown-toggle">Overview</a>
                                        <div class="m-menu-container open" data-role="dropdown">
                                            <div class="grid no-margin">
                                                <div class="row cells5">
                                                    <div class="cell padding10">
                                                        <img src="ui02style/images/me.jpg">
                                                    </div>
                                                    <div class="cell colspan2">
                                                        <h2 class="fg-white text-bold text-shadow">Metro UI CSS 3.0</h2>
                                                        <p class="padding20 no-padding-top no-padding-left no-padding-bottom fg-white">
                                                            Metro UI CSS a set of styles to create a site with an interface similar to Windows 8.
                                                        </p>
                                                        <p class="fg-white text-bold">
                                                            Sergey Pimenov
                                                        </p>
                                                    </div>
                                                    <div class="cell colspan2">
                                                        <ul class="unstyled-list">
                                                            <li>
                                                                <h3 class="text-shadow">Begin with Metro UI CSS</h3>
                                                            </li>
                                                            <li><a class="fg-white" href="#">Requirements</a></li>
                                                            <li><a class="fg-white" href="#">Doctype</a></li>
                                                            <li><a class="fg-white" href="#">JavaScript</a></li>
                                                            <li><a class="fg-white" href="#">Browsers support</a></li>
                                                            <li><a class="fg-white" href="#">License</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="#">Base CSS</a></li>
                                    <li><a href="#">Widgets</a></li>
                                    <li><a href="#">Templates</a></li>
                                    <li><a href="#">Community</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <div class="row">
                        <div class="cell">
                            <h5>h-menu</h5>
                            <nav>
                                <ul class="h-menu block-shadow-impact">
                                    <li class="active"><a href="#">Главная</a></li>
                                    <li><a href="#">Домены</a></li>
                                    <li><a href="#">Оплата</a></li>
                                    <li><a href="#">Документы</a></li>
                                    <li><a href="#">Хостинг</a></li>
                                    <li>
                                        <a href="#" class="dropdown-toggle">Еще</a>
                                        <ul class="d-menu" data-role="dropdown">
                                            <li><a href="#">О компании</a></li>
                                            <li><a href="#">Партнеры</a></li>
                                        </ul>
                                    </li>
                                    <li class="place-right no-hovered">
                                        <form>
                                            <div class="input-control text" style="width: 250px; margin-right: 10px">
                                                <input type="text" placeholder="Поиск по сайту">
                                                <button class="button"><span class="mif-search"></span></button>
                                            </div>
                                        </form>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="row cells4">
                        <div class="cell">
                            <h5>t-menu & compact</h5>
                            <ul class="t-menu" style="margin-right: 10px">
                                <li><a href="#"><span class="mif-apps icon"></span></a></li>
                                <li><a href="#"><span class="mif-laptop icon"></span></a></li>
                                <li><a href="#"><span class="mif-bubbles icon"></span></a></li>
                                <li><a href="#"><span class="mif-bubble icon"></span></a></li>
                                <li><a href="#">
                                    <img src="ui02style/images/user.png" class="icon"></a></li>
                            </ul>
                            <ul class="t-menu compact" style="margin-right: 10px">
                                <li><a href="#"><span class="mif-apps icon"></span></a></li>
                                <li><a href="#"><span class="mif-laptop icon"></span></a></li>
                                <li><a href="#"><span class="mif-bubbles icon"></span></a></li>
                                <li><a href="#"><span class="mif-bubble icon"></span></a></li>
                                <li><a href="#">
                                    <img src="ui02style/images/user.png" class="icon"></a></li>
                            </ul>
                        </div>

                        <div class="cell">
                            <h5>t-menu with submenu</h5>
                            <ul class="t-menu">
                                <li><a href="#"><span class="icon mif-home"></span></a></li>
                                <li><a href="#" class="dropdown-toggle"><span class="icon mif-compass"></span></a>
                                    <ul class="t-menu horizontal" data-role="dropdown">
                                        <li><a href="#"><span class="icon mif-home"></span></a></li>
                                        <li><a href="#" class="dropdown-toggle"><span class="icon mif-compass"></span></a>
                                            <ul class="t-menu" data-role="dropdown">
                                                <li><a href="#"><span class="icon mif-home"></span></a></li>
                                                <li><a href="#"><span class="icon mif-compass"></span></a></li>
                                                <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                                <li><a href="#"><span class="icon mif-file-empty"></span></a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                <li><a href="#"><span class="icon mif-file-empty"></span></a></li>
                            </ul>
                        </div>

                        <div class="cell">
                            <h5>t-menu with submenu (compact)</h5>
                            <ul class="t-menu compact">
                                <li><a href="#"><span class="icon mif-home"></span></a></li>
                                <li><a href="#" class="dropdown-toggle"><span class="icon mif-compass"></span></a>
                                    <ul class="t-menu horizontal compact" data-role="dropdown">
                                        <li><a href="#"><span class="icon mif-home"></span></a></li>
                                        <li><a href="#" class="dropdown-toggle"><span class="icon mif-compass"></span></a>
                                            <ul class="t-menu compact" data-role="dropdown">
                                                <li><a href="#"><span class="icon mif-home"></span></a></li>
                                                <li><a href="#"><span class="icon mif-compass"></span></a></li>
                                                <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                                <li><a href="#"><span class="icon mif-file-empty"></span></a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                        <li><a href="#"><span class="icon mif-file-empty"></span></a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                <li><a href="#"><span class="icon mif-file-empty"></span></a></li>
                            </ul>
                        </div>

                        <div class="cell">
                            <h5>t-menu with submenu (compact)</h5>
                            <ul class="t-menu horizontal compact">
                                <li><a href="#"><span class="icon mif-home"></span></a></li>
                                <li><a href="#" class="dropdown-toggle"><span class="icon mif-compass"></span></a>
                                    <ul class="t-menu compact" data-role="dropdown">
                                        <li><a href="#"><span class="icon mif-home"></span></a></li>
                                        <li><a href="#" class="dropdown-toggle"><span class="icon mif-compass"></span></a>
                                            <ul class="t-menu horizontal compact" data-role="dropdown">
                                                <li><a href="#"><span class="icon mif-home"></span></a></li>
                                                <li><a href="#"><span class="icon mif-compass"></span></a></li>
                                                <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                                <li><a href="#"><span class="icon mif-file-empty"></span></a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                        <li><a href="#"><span class="icon mif-file-empty"></span></a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><span class="icon mif-bubbles"></span></a></li>
                                <li><a href="#"><span class="icon mif-file-empty"></span></a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="row cells3">
                        <div class="cell">
                            <h5>v-menu, d-menu</h5>
                            <ul class="v-menu block-shadow-impact min-size-required">
                                <li class="menu-title">First Title</li>
                                <li><a href="#"><span class="mif-home icon"></span>Home</a></li>
                                <li class="divider"></li>
                                <li class="menu-title">Second Title</li>
                                <li><a href="#"><span class="mif-user icon"></span>Profile</a></li>
                                <li><a href="#"><span class="mif-calendar icon"></span>Calendar</a></li>
                                <li><a href="#"><span class="mif-image icon"></span>Photo</a></li>
                                <li class="divider"></li>
                                <li class="menu-title">Third Title</li>
                                <li>
                                    <a href="#" class="dropdown-toggle"><span class="mif-my-location icon"></span>Location</a>
                                    <ul class="d-menu" data-role="dropdown">
                                        <li class="menu-title">Title for dropdown</li>
                                        <li><a href="#">Коллеги</a></li>
                                        <li><a href="#">Интересно</a></li>
                                        <li>
                                            <div class="item-block text-center">
                                                <button class="square-button">
                                                    <img class="icon" src="ui02style/images/round.png"></button>
                                                <button class="square-button">
                                                    <img class="icon" src="ui02style/images/location.png"></button>
                                                <button class="square-button">
                                                    <img class="icon" src="ui02style/images/group.png"></button>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#" class="dropdown-toggle">Еще...</a>
                                            <ul class="d-menu" data-role="dropdown">
                                                <li><a href="#">Коллеги</a></li>
                                                <li><a href="#">Интересно</a></li>
                                                <li>
                                                    <div class="item-block text-center bg-grayLighter">
                                                        <button class="round-button">
                                                            <img class="icon" src="ui02style/images/round.png"></button>
                                                        <button class="round-button">
                                                            <img class="icon" src="ui02style/images/location.png"></button>
                                                        <button class="round-button">
                                                            <img class="icon" src="ui02style/images/group.png"></button>
                                                        <button class="round-button">
                                                            <img class="icon" src="ui02style/images/power.png"></button>
                                                    </div>
                                                </li>
                                                <li class="divider"></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#"><span class="mif-bubbles icon"></span>Community</a></li>
                            </ul>
                        </div>

                        <div class="cell">
                            <h5>v-menu & subdown</h5>
                            <ul class="v-menu subdown block-shadow-impact min-size-required">
                                <li><a href="#">
                                    <img src="ui02style/images/home.png">
                                    Лента</a></li>
                                <li class="divider"></li>
                                <li class="active"><a href="#">
                                    <img src="ui02style/images/user.png">
                                    Профиль</a></li>
                                <li><a href="#">Люди</a></li>
                                <li><a href="#">
                                    <img src="ui02style/images/photo_album.png">
                                    Фото</a></li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#" class="dropdown-toggle">
                                        <img src="ui02style/images/location.png">
                                        Локации</a>
                                    <ul class="d-menu" data-role="dropdown">
                                        <li><a href="#">Коллеги</a></li>
                                        <li><a href="#">Интересно</a></li>
                                        <li>
                                            <div class="item-block text-center">
                                                <button class="square-button big-button">
                                                    <img class="icon" src="ui02style/images/round.png"></button>
                                                <button class="square-button big-button">
                                                    <img class="icon" src="ui02style/images/location.png"></button>
                                                <button class="square-button big-button">
                                                    <img class="icon" src="ui02style/images/group.png"></button>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#" class="dropdown-toggle">Еще...</a>
                                            <ul class="d-menu" data-role="dropdown">
                                                <li><a href="#">Коллеги</a></li>
                                                <li><a href="#">Интересно</a></li>
                                                <li>
                                                    <div class="item-block text-center bg-grayLighter">
                                                        <button class="square-button">
                                                            <img class="icon" src="ui02style/images/round.png"></button>
                                                        <button class="square-button">
                                                            <img class="icon" src="ui02style/images/location.png"></button>
                                                        <button class="square-button">
                                                            <img class="icon" src="ui02style/images/group.png"></button>
                                                        <button class="square-button">
                                                            <img class="icon" src="ui02style/images/power.png"></button>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#">
                                    <img src="ui02style/images/group.png">
                                    Сообщества</a></li>
                            </ul>
                        </div>

                        <div class="cell">
                            <h5>v-menu & context</h5>
                            <ul class="v-menu context block-shadow-impact">
                                <li><a href="#"><span class="icon mif-cogs"></span>Расширенные круги</a></li>
                                <li><a href="#"><span class="icon mif-users"></span>Для всех</a></li>
                                <li><a href="#"><span class="icon mif-bullseye"></span>Мои круги</a></li>
                                <li><a href="#"><span class="icon fa fa-lock"></span>Только я</a></li>
                                <li><a href="#">Выбрать...</a></li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#" class="dropdown-toggle">More functions</a>
                                    <ul class="d-menu context drop-left" data-role="dropdown">
                                        <li><a href="#"><span class="icon mif-cogs"></span>Расширенные круги</a></li>
                                        <li><a href="#"><span class="icon mif-users"></span>Для всех</a></li>
                                        <li><a href="#"><span class="icon mif-spinner5"></span>Мои круги</a></li>
                                        <li><a href="#"><span class="icon mif-lock"></span>Только я</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>