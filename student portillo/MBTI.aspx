<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MBTI.aspx.cs" Inherits="MBTI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="mbtistyle/bootstrap.min.css" />
    <link rel="stylesheet" href="mbtistyle/main-theme5e1f.css?v=2" />
    <link rel="stylesheet" href="mbtistyle/overrides3860.css?v=1" />
    <link rel="stylesheet" href="mbtistyle/media-queries.css" media="all" />
    <link rel="stylesheet" href="mbtistyle/mmenu.css" media="all" />
    <link href="mbtistyle/international3860.css?v=1" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,400italic&amp;subset=latin,cyrillic,greek,latin-ext' rel='stylesheet' type='text/css' />
    <link href="mbtistyle/local5e1f.css?v=2" rel="stylesheet" />
    <link href="mbtistyle/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="mbtistyle/jquery-ui.css" />




    <style>
        .bigdiv {
            margin: auto;
            max-width: 1200px;
            /*border: solid #808080 1px;*/
        }

        /*popbox plugin*/
        .popbox {
            display: none;
            position: absolute;
            z-index: 99999;
            width: 400px;
            padding: 10px;
            background: #EEEFEB;
            color: #000000;
            border: 1px solid #4D4F53;
            margin: 0px;
            -webkit-box-shadow: 0px 0px 5px 0px rgba(164, 164, 164, 1);
            box-shadow: 0px 0px 5px 0px rgba(164, 164, 164, 1);
        }

            .popbox h2 {
                background-color: #4D4F53;
                color: #E3E5DD;
                font-size: 14px;
                display: block;
                width: 100%;
                margin: -10px 0px 8px -10px;
                padding: 5px 10px;
            }
    </style>

    <%--popbox plugin--%>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            var moveLeft = 0;
            var moveDown = 0;
            $('a.popper').hover(function (e) {

                var target = '#' + ($(this).attr('data-popbox'));

                $(target).show();
                moveLeft = $(this).outerWidth();
                moveDown = ($(target).outerHeight() / 2);
            }, function () {
                var target = '#' + ($(this).attr('data-popbox'));
                $(target).hide();
            });

            $('a.popper').mousemove(function (e) {
                var target = '#' + ($(this).attr('data-popbox'));

                leftD = e.pageX + parseInt(moveLeft);
                maxRight = leftD + $(target).outerWidth();
                windowLeft = $(window).width() - 40;
                windowRight = 0;
                maxLeft = e.pageX - (parseInt(moveLeft) + $(target).outerWidth() + 20);

                if (maxRight > windowLeft && maxLeft > windowRight) {
                    leftD = maxLeft;
                }

                topD = e.pageY - parseInt(moveDown);
                maxBottom = parseInt(e.pageY + parseInt(moveDown) + 20);
                windowBottom = parseInt(parseInt($(document).scrollTop()) + parseInt($(window).height()));
                maxTop = topD;
                windowTop = parseInt($(document).scrollTop());
                if (maxBottom > windowBottom) {
                    topD = windowBottom - $(target).outerHeight() - 20;
                } else if (maxTop < windowTop) {
                    topD = windowTop + 20;
                }
                $(target).css('top', topD).css('left', leftD);
            });
        });
    </script>



</head>
<body>
    <form id="form1" runat="server">
        <div class="bigdiv">
            <br />
            <p>MBTI 是性格分類的一種，由瑞士心理分析家榮格於1921年所提出，經過多年的發展，MBTI 現已成為全球著名的性格測試之一。當中包括教育界、顧員招聘及培訓、領袖訓練及個人發展等領域均有廣泛的應用。 測驗結果分為十六種性格：</p>
            <br />
            <div>

                <div id="pop1" class="popbox">
                    <h2>ESTJ 大男人型</h2>
                    <p>
                        - 喜歡分析，邏輯性強，善于組織，現實<br />
                        - 是所有類型中最具傳統意義“男性性格”的類型<br />
                        - 只要由他們領導，就非常容易相處<br />
                        - 喜歡暢所欲言，有主見但傾向于掌握控制權<br />
                        - 堅強果斷<br />
                        - 朋友多，可靠但容易沖動<br />
                        - 在壓力下, 傾向于過分敏感，容易怒氣爆發，且習慣對他人保留自己内心的想法<br />
                    </p>
                </div>

                <div id="pop2" class="popbox">
                    <h2>ESTP 挑戰型</h2>
                    <p>
                        - 精力充沛，好分析，善于理性解決問題<br />
                        - 喜歡充滿挑戰的環境，不喜歡遵循規則和程序<br />
                        - 常常想辦法繞過先行的規章制度<br />
                        - 現實，實際，創作力強，且足智多謀<br />
                        - 好冒險，是個行動者<br />
                        - 喜歡交朋友，風趣<br />
                        - 在壓力下, 常常被内心中的混亂所困擾。可能産生許多不切實際的幻想<br />
                    </p>
                </div>

                <div id="pop3" class="popbox">
                    <h2>ESFJ 主人型</h2>
                    <p>
                        - 喜歡組織人和事<br />
                        - 對安全感和穩定性很重視<br />
                        - 實際，傳統，對物質擁有有偏好<br />
                        - 在所有性格類型中對例行公事和規則最适應的一個類型<br />
                        - 友好，愛助人，同情心重<br />
                        - 喜歡交朋友，開朗，精力充沛<br />
                        - 在壓力下, 常常變得對他人和自己異常刻薄，同時很嚴肅，且過分拘泥于常規<br />
                    </p>

                </div>

                <div id="pop4" class="popbox">
                    <h2>ESFP 表演型</h2>
                    <p>
                        - 通常有很強的團隊精神，好玩，風趣，靈活機動<br />
                        - 喜歡交朋友和嘗試新的事物，重點在現在的事件上<br />
                        - 對人友善，有同情心，善說服人<br />
                        - 對于一切不涉及類似于抽象的，概念性的新事物都有較強的好奇心<br />
                        - 重視物質享受，但還是比較容易相處<br />
                        - 常常在糾紛中扮演和事佬的角色<br />
                        - 在壓力下, 容易把外界一些偶然發生的事件認真看待，再理解成是一些負面可能性的象征。或者沉浸于找尋這些事件的非常規解釋<br />
                    </p>
                </div>

                <div id="pop5" class="popbox">
                    <h2>ENTJ 將軍型</h2>
                    <p>
                        - 喜歡分析，邏輯性強，做決定快<br />
                        - 行動型的思考者，通常具備較好的領導能力<br />
                        - 尖銳，果斷，考慮全面<br />
                        - 精力充沛，喜歡快節奏<br />
                        - 重視智力發展，對新觀點感興趣<br />
                        - 關心長遠的發展和可能性<br />
                        - 在壓力下, 往往會對事情過度反應，表現出感到孤獨和不被重視。傾向保留自己内心的想法<br />
                    </p>
                </div>

                <div id="pop6" class="popbox">
                    <h2>ENTP 發明家</h2>
                    <p>
                        - 喜歡嘗試新方法做事情。幸運的是，他們似乎總可以找到新方法<br />
                        - 不喜歡例行公事和規章制度<br />
                        - 創造性強，想象力豐富，聰明<br />
                        - 自信，善言，精力充沛<br />
                        - 獨立，喜歡分析，而且常采用客觀的態度對人<br />
                        - 有進取心，足智多謀，喜歡挑戰和解決難題<br />
                        - 在壓力下, 容易被細節和具體所淹沒，而失去他們平時擅長找尋事物可能性的能力。接下來把注意力完全放在不重要的細節上<br />
                    </p>
                </div>

                <div id="pop7" class="popbox">
                    <h2>ENFJ 教育家</h2>
                    <p>
                        - 對新思想和可能性好奇<br />
                        - 有語言天才，但通常講方面比寫方面好<br />
                        - 善良，有同情心，忠誠，可信賴<br />
                        - 好交際，積極回應和善于說服人<br />
                        - 對批評較敏感，常回避有争議的讨論而不是講出他們的真實感覺<br />
                        - 喜歡變化和新挑戰<br />
                        - 在壓力下, 可能突然間發現自己變尖銳，喜歡找人茬。他們通常把這些負面的想法留給自己，可是這樣做會讓他們感覺糟透了。<br />
                    </p>
                </div>

                <div id="pop8" class="popbox">
                    <h2>ENFP 記者型</h2>
                    <p>
                        - 熱情，友好和體貼<br />
                        - 總是關心和體貼他人，善于搞好人際關系<br />
                        - 不喜歡例行公事，有計劃和有組織，傾向找機會避免這些<br />
                        - 活躍的，喜歡交朋友，通常朋友較多<br />
                        - 通常需要他人的肯定，也容易給其他人鼓勵和支持<br />
                        - 善言，容易被新概念，新思想和新經驗所動<br />
                        - 在壓力下, 往往全部精力放在細節和具體事情上，讓它們成爲在自己生活的中心。容易變得和平時的形象完全相反 － 對理性過分追求，或總指責他人不夠理性<br />
                    </p>
                </div>

                <div id="pop9" class="popbox">
                    <h2>ISTJ 公務型</h2>
                    <p>
                        - 非常負責，可靠和勤勉的<br />
                        - 邏輯，善分析，果斷<br />
                        - 現實和務實的<br />
                        - 做他們應該做的事情對他們而言非常重要<br />
                        - 嚴守規則和章程<br />
                        - 喜歡助人，但首先必須合情合理<br />
                        - 在壓力下, 往往失去平時對細節和具體的注意力。人變得較悲觀，對新事物很抗拒，對未來的結果有許多負面的想象力<br />
                    </p>

                </div>
                <div id="pop10" class="popbox">
                    <h2>ISTP 冒險家</h2>
                    <p>
                        - 好分析，客觀<br />
                        - 喜歡組織與事實和細節有關的想法<br />
                        - 不善搞人際關系，不善于處理人與人之間的糾紛<br />
                        - 現實，而且非常實際<br />
                        - 往往在事物是如何工作或運行的這方面有天分<br />
                        - 通常對于體育和戶外娛樂活動較感興趣<br />
                        - 在壓力下, 可能變刻薄，過分保護自我或任性，且在事事上沉浸于或過分追求完全理性<br />
                    </p>
                </div>

                <div id="pop11" class="popbox">
                    <h2>ISFJ 照顧型</h2>
                    <p>
                        - 喜歡整潔和幹淨<br />
                        - 負責，勤勉的，但對新變化有抵觸<br />
                        - 重視融洽，合作和相互尊重<br />
                        - 善良，敏感<br />
                        - 忠于和與自己相關的人，對他們負責任<br />
                        - 可以排除萬難去做他們認爲應該做的事，但如果是被要求做，或感覺不合理，則不喜歡做<br />
                        - 在壓力下, 容易變得沖動和毫無顧忌。同時也變得很悲觀，向周圍的朋友或親人散布這些悲觀的論點，表現出和往常喜歡關心他人的不同行爲<br />
                    </p>
                </div>


                <div id="pop12" class="popbox">
                    <h2>ISFP藝術家</h2>
                    <p>
                        - 常常對大自然有特殊的愛好，對動物有特別的同情心<br />
                        - 對于現實較敏感，能夠較準确抓住那些目前所需要的，同時試圖滿足它們<br />
                        - 重視和諧，信守内在的道德準則<br />
                        - 自信心往往並不高<br />
                        - 對他們重要的事情和人非常盡職，負責任<br />
                        - 通常比較靜，保守，難揣摩<br />
                        - 在壓力下, 會變得多疑，暴躁，不可靠，刻薄或過分嚴肅拘謹<br />
                    </p>
                </div>

                <div id="pop13" class="popbox">
                    <h2>INTJ 專家型</h2>
                    <p>
                        - 16種性格類型中最獨立的一個類型<br />
                        - 洞察力強，較理性，有自己的思想和個性，而且客觀性的尖銳<br />
                        - 善于前瞻性思考，對未來的可能性總有清楚的認識和計劃，然後去努力實現自己的目標<br />
                        - 喜歡挑戰，熱衷追求進步<br />
                        - 不管他們在哪個領域，似乎總能成爲那里的改革先鋒<br />
                        - 對于其他人的意見和觀點重視不夠<br />
                        - 在壓力下, 容易沉浸在看電視，玩牌或暴食這些感官享受上，或者注意力過多放在外部信息，如打掃房間，整理收拾東西<br />
                    </p>
                </div>

                <div id="pop14" class="popbox">
                    <h2>INTP 學者型</h2>
                    <p>
                        - 疑心重，想象力好，能夠看到他人無法看到的機會<br />
                        - 普遍而言，是16種性格類型中智力最高的類型<br />
                        - 喜歡分析問題，找出解決辦法和與之有關的其他可能<br />
                        - 話少，獨立，邏輯性強<br />
                        - 對于細節和具體的東西沒興趣<br />
                        - 反傳統的智慧型冒險者<br />
                        - 在壓力下, 可能變得煩躁不安，過度敏感，沖動，任性，急躁，對人和事有不切實際的期待<br />
                    </p>
                </div>

                <div id="pop15" class="popbox">
                    <h2>INFJ 作家型</h2>
                    <p>
                        - 在理解事物的複雜性和人類互動關系上具有天賦<br />
                        - 理想主義，洞察力強，有遠見，但他們的遠見通常和人類的福利息息相關<br />
                        - 敏感，同情心強，忠實于自己的内在價值觀<br />
                        - 容易對他人表示出同情和關心<br />
                        - 對事實重視，忠于愛情或婚姻<br />
                        - 對自我和他人的成長和發展感興趣<br />
                        - 在壓力下, 可能變得對他們一向沒興趣的一些感性活動非常感興趣。對外界展現出敵對的態度<br />
                    </p>
                </div>

                <div id="pop16" class="popbox">
                    <h2>INFP哲學家</h2>
                    <p>
                        - 重視人于人之間的和諧，追求知識和進步<br />
                        - 忠誠，敏感，體貼<br />
                        - 對于例行公事，或規範性的東西不感興趣<br />
                        - 自然，有個性，往往有語言天才<br />
                        - 理想主義者，對于責任有很強的使命感<br />
                        - 靈活，善于适應不同的環境，除非是環境和自己内在的價值觀不符<br />
                        - 在壓力下, 對自己和他人的能力持高度懷疑態度，變得非常刻薄和先入爲主<br />
                    </p>
                </div>



                <table style="width: 100%;">
                    <tr>
                        <td>
                            <a href="#" class="popper" data-popbox="pop1">01)  ESTJ 大男人型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop2">02)  ESTP 挑戰型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop3">03)  ESFJ 主人型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop4">04)  ESFP 表演型</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#" class="popper" data-popbox="pop5">05)  ENTJ 將軍型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop6">06)  ENTP 發明家</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop7">07)  ENFJ 教育家</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop8">08)  ENFP 記者型</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#" class="popper" data-popbox="pop9">09)  ISTJ 公務型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop10">10)  ISTP 冒險家</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop11">11)  ISFJ 照顧型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop12">12)  ISFP 藝術家</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#" class="popper" data-popbox="pop13">13)  INTJ 專家型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop14">14)  INTP 學者型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop15">15)  INFJ 作家型</a>
                        </td>
                        <td>
                            <a href="#" class="popper" data-popbox="pop16">16)  INFP 哲學家</a>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <br />
            <div class="container">
                <div class="row">

                    <div class="col-md-12 min-height-wrapper no-right-padding">

                        <h1></h1>


                        <div class="types-list-header">
                            <h1>適合職業分析</h1>
                            <div class="clear"></div>
                        </div>

                        <div class="type-chart">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2>分析家</h2>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_INTJ.aspx';">
                                    <a href="MBTI_INTJ.aspx">
                                        <img src="mbtistyle/image/intj.png" class="extrawide-illustration" />
                                        <h4>“建築師”</h4>
                                        <h5>INTJ</h5>
                                    </a>
                                    <div class="type-snippet">富有想像力和戰略性的思想家，一切皆在計劃之中。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_INTP.aspx';">
                                    <a href="MBTI_INTP.aspx">
                                        <img src="mbtistyle/image/intp.png" />
                                        <h4>“邏輯學家”</h4>
                                        <h5>INTP</h5>
                                    </a>
                                    <div class="type-snippet">具有創造力的發明家，對知識有著止不住的渴望。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ENTJ.aspx';">
                                    <a href="MBTI_ENTJ.aspx">
                                        <img src="mbtistyle/image/entj.png" />
                                        <h4>“指揮官”</h4>
                                        <h5>ENTJ</h5>
                                    </a>
                                    <div class="type-snippet">大膽，富有想像力且意志強大的領導者，總能找到或創造解決方法。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ENTP.aspx';">
                                    <a href="MBTI_ENTP.aspx">
                                        <img src="mbtistyle/image/entp.png" />
                                        <h4>“辯論家”</h4>
                                        <h5>ENTP</h5>
                                    </a>
                                    <div class="type-snippet">聰明好奇的思想者，不會放棄任何智力上的挑戰。</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <h2>外交家</h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_INFJ.aspx';">
                                    <a href="MBTI_INFJ.aspx">
                                        <img src="mbtistyle/image/infj.png" />
                                        <h4>“提倡者”</h4>
                                        <h5>INFJ</h5>
                                    </a>
                                    <div class="type-snippet">安靜而神秘，同時鼓舞人心且不知疲倦的理想主義者。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_INFP.aspx';">
                                    <a href="MBTI_INFP.aspx">
                                        <img src="mbtistyle/image/infp.png" />
                                        <h4>“調停者”</h4>
                                        <h5>INFP</h5>
                                    </a>
                                    <div class="type-snippet">詩意，善良的利他主義者，總是熱情地為正當理由提供幫助。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ENFJ.aspx';">
                                    <a href="MBTI_ENFJ.aspx">
                                        <img src="mbtistyle/image/enfj.png" />
                                        <h4>“主人公”</h4>
                                        <h5>ENFJ</h5>
                                    </a>
                                    <div class="type-snippet">富有魅力鼓舞人心的領導者，有使聽眾著迷的能力。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ENFP.aspx';">
                                    <a href="MBTI_ENFP.aspx">
                                        <img src="mbtistyle/image/enfp.png" />
                                        <h4>“競選者”</h4>
                                        <h5>ENFP</h5>
                                    </a>
                                    <div class="type-snippet">熱情，有創造力愛社交的自由自在的人，總能找到理由微笑。</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <h2>守護者</h2>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ISTJ.aspx';">
                                    <a href="MBTI_ISTJ.aspx">
                                        <img src="mbtistyle/image/istj.png" />
                                        <h4>“物流師”</h4>
                                        <h5>ISTJ</h5>
                                    </a>
                                    <div class="type-snippet">實際且注重事實的個人，可靠性不容懷疑。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ISFJ.aspx';">
                                    <a href="MBTI_ISFJ.aspx">
                                        <img src="mbtistyle/image/isfj.png" />
                                        <h4>“守衛者”</h4>
                                        <h5>ISFJ</h5>
                                    </a>
                                    <div class="type-snippet">非常專注而溫暖的守護者，時刻准備著保護愛著的人們。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ESTJ.aspx';">
                                    <a href="MBTI_ESTJ.aspx">
                                        <img src="mbtistyle/image/estj.png" />
                                        <h4>“總經理”</h4>
                                        <h5>ESTJ</h5>
                                    </a>
                                    <div class="type-snippet">出色的管理者，在管理事情或人的方面無與倫比。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ESFJ.aspx';">
                                    <a href="MBTI_ESFJ.aspx">
                                        <img src="mbtistyle/image/esfj.png" class="extrawide-illustration" />
                                        <h4>“執政官”</h4>
                                        <h5>ESFJ</h5>
                                    </a>
                                    <div class="type-snippet">極有同情心，愛交往受歡迎的人們，總是熱心提供幫助。</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <h2>探險家</h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ISTP.aspx';">
                                    <a href="MBTI_ISTP.aspx">
                                        <img src="mbtistyle/image/istp.png" />
                                        <h4>“鑒賞家”</h4>
                                        <h5>ISTP</h5>
                                    </a>
                                    <div class="type-snippet">大膽而實際的實驗家，擅長使用任何形式的工具。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ISFP.aspx';">
                                    <a href="MBTI_ISFP.aspx">
                                        <img src="mbtistyle/image/isfp.png" />
                                        <h4>“探險家”</h4>
                                        <h5>ISFP</h5>
                                    </a>
                                    <div class="type-snippet">靈活有魅力的藝術家，時刻准備著探索和體驗新鮮事物。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ESTP.aspx';">
                                    <a href="MBTI_ESTP.aspx">
                                        <img src="mbtistyle/image/estp.png" />
                                        <h4>“企業家”</h4>
                                        <h5>ESTP</h5>
                                    </a>
                                    <div class="type-snippet">聰明，精力充沛善於感知的人們，真心享受生活在邊緣。</div>
                                </div>

                                <div class="col-sm-6 col-md-3 type-item" onclick="window.location.href='MBTI_ESFP.aspx';">
                                    <a href="MBTI_ESFP.aspx">
                                        <img src="mbtistyle/image/esfp.png" />
                                        <h4>“表演者”</h4>
                                        <h5>ESFP</h5>
                                    </a>
                                    <div class="type-snippet">自發的，精力充沛而熱情的表演者－生活在他們周圍永不無聊。</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="footer row">
                    <div class="col-md-6">
                        <span style="font-size:0.8em;font-weight:bold;color:#FFF;text-transform:uppercase">References and further reading:</span>
                       <a href="http://www.cmha.org.uk/about-us-/past-services/employment-project/project-blog">MBTI 職業性格工作坊</a>
                        <a href="http://www.16personalities.com/ch">www.16personalities.com</a>
                    </div>
                </div>
                <br /><br />
            </div>
        </div>
    </form>
</body>
</html>
