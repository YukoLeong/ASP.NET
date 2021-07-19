<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout52.aspx.cs" Inherits="layout52" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="layout52style/css/default.css" rel="stylesheet" />
    <link href="layout52style/css/e_menu.css" rel="stylesheet" />
    <link href="layout52style/css/home_slide.css" rel="stylesheet" />

    <style type="text/css">
        body {
            background-image: url(layout52style/Intf/main_bg.jpg);
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }

        body, td, th {
            font-size: 16px;
            color: #333333;
        }

        a:link {
            color: #333333;
            text-decoration: none;
        }

        a:visited {
            color: #333333;
            text-decoration: none;
        }

        a:hover {
            color: #FF0033;
            text-decoration: none;
        }

        a:active {
            color: #FF0033;
            text-decoration: none;
        }
    </style>
    <script type="text/javascript" src="layout52style/js/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="layout52style/js/home_slide.js"></script>
    <script src="layout52style/js/slides/jquery.min.js"></script>
    <script src="layout52style/js/slides/jquery.easing.1.3.js"></script>
    <script src="layout52style/js/slides/slides.min.jquery.js"></script>
    <script>
        $(function () {
            $('#slides').slides({
                preload: true,
                preloadImage: 'img/loading.gif',
                play: 5000,
                pause: 2500,
                hoverPause: true
            });
        });
    </script>

    <script language="JavaScript" type="text/JavaScript">
<!--
    function MM_preloadImages() { //v3.0
        var d = document; if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
        }
    }

    function MM_swapImgRestore() { //v3.0
        var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
    }

    function MM_findObj(n, d) { //v4.01
        var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
        var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2) ; i += 3)
            if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
    }

    function popup(mylink, windowname) {
        if (!window.focus) return true;
        var href;
        if (typeof (mylink) == 'string')
            href = mylink;
        else
            href = mylink.href;
        window.open(href, windowname, 'width=400,height=140,scrollbars=no, resizable=no');
        return false;
    }
    //-->
    </script>



</head>
<body onload="MM_preloadImages('layout52style/Intf/eng_tophome_over.jpg','layout52style/Intf/chi_over.jpg')">
    <form id="form1" runat="server">
        <table width="770" height="768" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="10" height="399" background="layout52style/Intf/frame_side_L.jpg">&nbsp;</td>
                <td width="750" valign="top">
                    <table width="750" height="874" border="0" cellpadding="0" cellspacing="0" bordercolor="#333333" bgcolor="#FFFFFF">
                        <tr>
                            <td height="70">
                                <div align="right">
                                    <table width="750" height="70" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="270" height="70" align="center">
                                                <img src="layout52style/Intf/lib_title.jpg" width="250" height="60"></td>
                                            <td width="320" height="70" align="right" valign="bottom">&nbsp;</td>
                                            <td width="85" height="70" align="left" valign="bottom"><a href="http://www.ipm.edu.mo/index.php" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('HOME','','layout52style/Intf/eng_tophome_over.jpg',1)">
                                                <img src="layout52style/Intf/eng_tophome_norm.jpg" name="HOME" width="52" height="12" border="0"></a></td>
                                            <td width="75" height="70" align="left" valign="bottom"><a href="http://library.ipm.edu.mo/Chinese/index.htm" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('CHI','','layout52style/Intf/chi_over.jpg',1)">
                                                <img src="layout52style/Intf/chi_norm.jpg" name="CHI" width="42" height="12" border="0"></a></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="240" valign="top" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
                                <div id="slide">

                                    <div id="slides">
                                        <div class="slides_container">
                                            <a href="http://library.ipm.edu.mo/promotion/scopus/index_e.html" target="_blank">
                                                <img src="layout52style/Intf/Slide/slide_scopus.jpg"></a>
                                            <a href="http://library.ipm.edu.mo/Webpac/edbstore.asp?id=404" target="_blank">
                                                <img src="layout52style/Intf/Slide/slide_bphc.jpg"></a>
                                            <a href="http://library.umac.mo/html/org/mala/index.html" target="_blank">
                                                <img src="layout52style/Intf/Slide/slide_mala_eresources_center.jpg"></a>
                                            <a href="http://library.ipm.edu.mo/refworks/index_e.html" target="_blank">
                                                <img src="layout52style/Intf/Slide/slide_refworks.jpg"></a>
                                            <!--
                  <a href="http://library.ipm.edu.mo/event/poster_A&P_approval_books_2015.pdf" target="_blank"><img src="../Intf/Slide/slide_A&P_approval_books_2015.jpg"></a>
                  <a href="http://goo.gl/XKAFyt" target="_blank"><img src="../Intf/Slide/slide_emerald_quiz_2015.jpg"></a>
                  <a href="http://ebook.hyread.com.tw/activity/2015hk/index.html" target="_blank"><img src="../Intf/Slide/slide_hyread_event_2015.jpg"></a>
                  <a href="http://library.ipm.edu.mo/Webpac/edbstore.asp?id=380" target="_blank"><img src="../Intf/Slide/slide_NursingConnect_EBN.jpg"></a>
                  <a href="http://library.ipm.edu.mo/Webpac/edbstore.asp?id=381" target="_blank"><img src="../Intf/Slide/slide_NursingConnect_Skill.jpg"></a>
                  <a href="http://goo.gl/O5eIaW" target="_blank"><img src="../Intf/Slide/slide_AccessMedicine_App.jpg"></a>
                  <a href="http://library.ipm.edu.mo/webpac/edbstore.asp?id=346" target="_blank"><img src="../Intf/Slide/slide_primal_pictures.jpg"></a>
                  <a href="http://library.ipm.edu.mo/event/seminar_JCR_2015.pdf" target="_blank"><img src="../Intf/Slide/slide_seminar_JCR_2015.jpg"></a>
                  <a href="http://library.ipm.edu.mo/event/poster_workshop_C_public_2015.pdf" target="_blank"><img src="../Intf/Slide/slide_workshop_C_2014_public.jpg"></a>
                  <a href="http://library.ipm.edu.mo/workshop/index_e.html" target="_blank"><img src="../Intf/Slide/slide_workshop_C_2014.jpg"></a>
                  <a href="http://library.ipm.edu.mo/event/refworks_workshop2014.pdf" target="_blank"><img src="../Intf/Slide/slide_refworks_workshop2014.jpg"></a>
                  <a href="http://library.ipm.edu.mo/workshop/index_e.html" target="_blank"><img src="../Intf/Slide/slide_workshop_B_2014.jpg"></a>
               	  <a href="http://library.ipm.edu.mo/workshop/index_e.html" target="_blank"><img src="../Intf/Slide/slide_workshop_A_2014.jpg"></a>
                  <a href="http://library.ipm.edu.mo/promotion/naxosmobile/index_c.html" target="_blank"><img src="../Intf/Slide/slide_naxos_mobile.jpg"></a>
                  <a href="https://www.surveymonkey.com/s/Emerald2014Macau" target="_blank"><img src="../Intf/Slide/slide_emerald_quiz_2014.jpg"></a>
                  <a href="http://library.ipm.edu.mo/workshop/index_e.html" target="_blank"><img src="../Intf/Slide/slide_library_workshop_C_2014.jpg"></a>
                  <a href="http://library.ipm.edu.mo/webpac/edbstore.asp?id=337" target="_blank"><img src="../Intf/Slide/slide_ebsco_ebook.jpg"></a>
                  <a href="http://library.ipm.edu.mo/Webpac/edbstore.asp?id=325" target="_blank"><img src="../Intf/Slide/slide_hyread.jpg"></a>
                  <a href="../promotion/ebscomobile/index_e.html" target="_blank"><img src="../Intf/Slide/slide_ebscomobile.jpg"></a>
                  -->
                                        </div>
                                        <a href="#" class="prev">
                                            <img src="layout52style/Intf/Slide/icon/arrow-prev.png" width="25" height="40" border="0"></a>
                                        <a href="#" class="next">
                                            <img src="layout52style/Intf/Slide/icon/arrow-next.png" width="25" height="40" border="0"></a>
                                    </div>

                                    <div id="sidepanel">
                                        <ul id="quicklink">
                                            <li><a id="webpac" href="http://library.ipm.edu.mo/Webpac/index_en.htm">Library Catalogue</a></li>
                                            <li><a id="edb" href="http://library.ipm.edu.mo/Webpac/eresource_en.htm">E-Resources</a></li>
                                            <li><a id="patron" href="http://library2.ipm.edu.mo/Webpac2/Person.dll?LT=0">Online Renewal</a></li>
                                        </ul>
                                        <ul id="quickcontact">
                                            <li id="tel">(853)8599-6241/8599-6708</li>
                                            <li id="email"><a href="mailto:library@ipm.edu.mo">library@ipm.edu.mo</a></li>
                                            <li id="hour">MON - FRI 09:30 - 20:00<br>
                                                <li>SAT &amp; SUN 14:00 - 20:00</li>
                                                <li id="note">* Closed on Public Holidays</li>
                                        </ul>
                                    </div>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="45" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
                                <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="750" height="45" align="middle">
                                    <param name="allowScriptAccess" value="sameDomain" />
                                    <param name="movie" value="http://library.ipm.edu.mo/Intf/English/nav_menu.swf" />
                                    <param name="menu" value="false" />

                                    <param name="bgcolor" value="#ffffff" />
                                    <param name="QUALITY" value="high">
                                    <embed src="http://library.ipm.edu.mo/Intf/English/nav_menu.swf" width="750" height="45" align="middle" menu="false" quality="high" bgcolor="#ffffff" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                </object>
                            </td>
                        </tr>
                        <tr>
                            <td height="36" bordercolor="#FFFFFF" background="layout52style/Intf/header_bar-home.jpg" bgcolor="#FFFFFF">
                                <img src="layout52style/Intf/English/pheader_home.jpg" width="100" height="36" align="top"><img src="layout52style/Intf/English/pheader_whats_new.jpg" width="125" height="36" align="top"></td>
                        </tr>

                        <!--
	  <tr><td height="70" valign="top" bordercolor="#FFFFFF" bgcolor="#EDEDED"><table width="740" height="50" border="0" align="center" cellpadding="10" cellspacing="0" style="margin:0 10px 10px 10px;">
                    <tr>
                      <td width="50" height="50" align="center" valign="middle" bgcolor="#FEC820"><img src="../Intf/attention_icon.jpg" width="50" height="50"></td>
                      <td width="682" height="50" class="etext" bgcolor="#FFE185" style="line-height:18px;">Please be informed that the telephone system in our Main Campus will arrange a emergency repairs from 30/01/2015 (Friday) 19:00 to 02/02/2015 (Monday) 08:00, the telephone system of the Library will be suspended. Sorry for any inconvenience caused.
</td>
                    </tr>
                  </table></td></tr>
      -->

                        <tr>
                            <td height="300" valign="top" bordercolor="#FFFFFF" bgcolor="#EDEDED">
                                <table width="750" height="440" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="250" height="440" rowspan="4" align="right" valign="top">
                                            <a href="http://library.umac.mo/html/org/mala/index.html" target="_blank">
                                                <img src="layout52style/Intf/banner_mala_eresources_center.jpg" width="240" height="80" border="0" style="margin: 1px;"></a>
                                            <a href="http://mpilibrary.blogspot.com/" target="_blank">
                                                <img src="layout52style/Intf/featurednewbook_homebanner.jpg" width="240" height="60" border="0" style="margin: 1px;"></a><br>
                                            <a href="http://library.ipm.edu.mo/webpac/suggested_readings.htm" target="_blank">
                                                <img src="layout52style/Intf/suggestedreadings_homebanner.jpg" width="240" height="60" border="0" style="margin: 1px;"></a><br>
                                            <iframe src="layout52style/history.html" width="240" height="254" scrolling="auto" align="right" frameborder="0"></iframe>
                                        </td>
                                        <td width="10" rowspan="4" background="layout52style/Intf/v_sep.jpg">&nbsp;</td>
                                        <td width="490" height="110" background="layout52style/Intf/English/menubg_about.jpg">
                                            <table width="400" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="200" height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/info.html" class="aboutLink">About Library</a></td>
                                                    <td width="200" height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/lamkan.html" class="aboutLink">Lam Kan Special Collection</a></td>
                                                </tr>
                                                <tr>
                                                    <td height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/regulation.html" class="aboutLink">Regulations</a></td>
                                                    <td height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/pledge.html" class="aboutLink">Performance Pledge</a></td>
                                                </tr>
                                                <tr>
                                                    <td height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/notice.html" class="aboutLink">Announcements</a></td>
                                                    <td height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/statistics.html" class="aboutLink">Statistics</a></td>
                                                </tr>
                                                <tr>
                                                    <td height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/dl_forms.html" class="aboutLink">Download Forms</a></td>
                                                    <td height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/hours.html" class="aboutLink">Opening Hours</a></td>
                                                </tr>
                                                <tr>
                                                    <td height="22">
                                                        <img src="layout52style/Intf/dot_about.gif" width="12" height="12" align="absmiddle">
                                                        <a href="about/contact.html" class="aboutLink">Contact</a></td>
                                                    <td height="22"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="110" background="layout52style/Intf/English/menubg_resource.jpg">
                                            <table width="400" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="200" height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_resource.gif" width="12" height="12" align="absmiddle">
                                                        <a href="http://library.ipm.edu.mo/Webpac/" target="_blank" class="resourceLink">Library Catalogue</a></td>
                                                    <td width="200" height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_resource.gif" width="12" height="12" align="absmiddle">
                                                        <a href="resource/e-resources.html" target="_blank" class="resourceLink">E-Resources</a></td>
                                                </tr>
                                                <tr>
                                                    <td width="200" height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_resource.gif" width="12" height="12" align="absmiddle">
                                                        <a href="http://library.ipm.edu.mo/Webpac/dbook_en.htm" target="_blank" class="resourceLink">Reserved Collection</a></td>
                                                    <td height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_resource.gif" width="12" height="12" align="absmiddle">
                                                        <a href="resource/project.html" target="_blank" class="resourceLink">Theses</a></td>
                                                </tr>
                                                <tr>
                                                    <td width="200" height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_resource.gif" width="12" height="12" align="absmiddle">
                                                        <a href="resource/periodical.html" class="resourceLink">Serial Collection</a></td>
                                                    <td height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_resource.gif" width="12" height="12" align="absmiddle">
                                                        <a href="resource/newaddition.html" target="_blank" class="resourceLink">New
                    Additions</a></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="110" background="layout52style/Intf/English/menubg_service.jpg">
                                            <table width="400" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="200" height="24" class="ctext">
                                                        <img src="layout52style/Intf/dot_service.gif" width="12" height="12" align="absmiddle">
                                                        <a href="service/CIR_service.html" class="serviceLink">Circulation Services</a></td>
                                                    <td width="200" height="24" class="ctext">
                                                        <img src="layout52style/Intf/dot_service.gif" width="12" height="12" align="absmiddle">
                                                        <a href="service/reference.html" class="serviceLink">Reference Desk</a></td>
                                                </tr>
                                                <tr>
                                                    <td width="200" height="24" class="ctext">
                                                        <img src="layout52style/Intf/dot_service.gif" width="12" height="12" align="absmiddle">
                                                        <a href="service/interlib_loan.html" class="serviceLink">Inter-Library Loan Service</a></td>
                                                    <td height="24" class="ctext">
                                                        <img src="layout52style/Intf/dot_service.gif" width="12" height="12" align="absmiddle">
                                                        <a href="service/doc_delivery.html" class="serviceLink">Documents
                    Delivery Service</a></td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        <img src="layout52style/Intf/dot_service.gif" width="12" height="12" align="absmiddle">
                                                        <a href="service/isbn_request.html" class="serviceLink">Application of ISBN</a></td>
                                                    <td height="24">
                                                        <img src="layout52style/Intf/dot_service.gif" width="12" height="12" align="absmiddle">
                                                        <a href="service/issn_request.html" class="serviceLink">Application of ISSN</a></td>
                                                </tr>
                                                <tr>
                                                    <td width="200" height="24">
                                                        <img src="layout52style/Intf/dot_service.gif" width="12" height="12" align="absmiddle">
                                                        <a href="service/bibliographic.html" class="serviceLink">Bibliographic
                    Instruction</a></td>
                                                    <td height="24">
                                                        <img src="layout52style/Intf/dot_service.gif" width="12" height="12" align="absmiddle">
                                                        <a href="service/other_service.html" class="serviceLink">Other
                    Services</a></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="110" background="layout52style/Intf/English/menubg_help.jpg">
                                            <table width="400" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="200" height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_help.gif" width="12" height="12" align="absmiddle">
                                                        <a href="help/faq.html" class="helpLink">FAQ</a></td>
                                                    <td width="200" height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_help.gif" width="12" height="12" align="absmiddle">
                                                        <a href="help/webpac_guide.html" class="helpLink">Catalogue
                    User Guide</a></td>
                                                </tr>
                                                <tr>
                                                    <td width="200" height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_help.gif" width="12" height="12" align="absmiddle">
                                                        <a href="help/e-resources_guide.html" class="helpLink">E-Resources
                    User Guide</a></td>
                                                    <td height="33" class="ctext">
                                                        <img src="layout52style/Intf/dot_help.gif" width="12" height="12" align="absmiddle">
                                                        <a href="help/online_renewal.html" class="helpLink">Online
                    Renewal Guide</a></td>
                                                </tr>
                                                <tr>
                                                    <td width="200" height="33">
                                                        <img src="layout52style/Intf/dot_help.gif" width="12" height="12" align="absmiddle">
                                                        <a href="help/LC_outline.html" class="helpLink">LC Classification
                    Outline</a></td>
                                                    <td height="33">
                                                        <img src="layout52style/Intf/dot_help.gif" width="12" height="12" align="absmiddle">
                                                        <a href="help/subject_guide.html" class="helpLink">Subject
                    Guides</a></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="60" align="right" bordercolor="#FFFFFF" bgcolor="#ACACAC">
                                <table width="750" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="12" height="60" valign="top">&nbsp;</td>
                                        <td width="384" align="left" valign="middle" class="etext_s_LIGHT">&copy;2005 Macao Polytechnic Institute<br>
                                            Best viewed with IE version 5 or above<br>
                                            Send comments and suggestions to <a href="mailto:library@ipm.edu.mo" style="text-decoration: none; color: #777777; font-family: Arial, Helvetica, sans-serif; font-size: 12px;">library@ipm.edu.mo</a></td>
                                        <td width="354" height="60" align="right">
                                            <img src="layout52style/Intf/page_footer.jpg" width="354" height="60"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="10" background="layout52style/Intf/frame_side_R.jpg">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
