<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout51.aspx.cs" Inherits="layout51" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="layout51style/default.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background-image: url(layout51style/Intf/main_bg.jpg);
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
            color: #FF9900;
            text-decoration: none;
        }

        a:active {
            color: #FF9900;
            text-decoration: none;
        }
    </style>



</head>
<body onload="MM_preloadImages('layout51style/Intf/eng_home_over.jpg','layout51style/Intf/chi_over.jpg')">
    <form id="form1" runat="server">
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="10" background="layout51style/Intf/frame_side_L.jpg">&nbsp;</td>
                <td width="750" valign="top">
                    <table width="750" height="768" border="0" cellpadding="0" cellspacing="0" bordercolor="#333333" bgcolor="#FFFFFF">
                        <tr>
                            <td height="70">
                                <div align="right">
                                    <table width="750" height="70" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="270" height="70">
                                                <div align="center">
                                                    <img src="layout51style/Intf/lib_title.jpg" width="250" height="60"></div>
                                            </td>
                                            <td width="340" height="70" align="right" valign="bottom">&nbsp;</td>
                                            <td width="65" height="70" align="left" valign="bottom"><a href="http://library.ipm.edu.mo/English/index.htm" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('HOME','','layout51style/Intf/eng_home_over.jpg',1)">
                                                <img src="layout51style/Intf/eng_home_norm.jpg" name="HOME" width="42" height="12" border="0"></a></td>
                                            <td width="75" height="70" align="left" valign="bottom"><a href="javascript:changeLng()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('CHI','','layout51style/Intf/chi_over.jpg',1)">
                                                <img src="layout51style/Intf/chi_norm.jpg" name="CHI" width="42" height="12" border="0"></a></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="45" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
                                <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="750" height="45" align="middle">
                                    <param name="allowScriptAccess" value="sameDomain" />
                                    <param name="movie" value="http://library.ipm.edu.mo/Intf/English/nav_menu.swf" />
                                    <param name="menu" value="false" />
                                    <param name="quality" value="high" />
                                    <param name="bgcolor" value="#ffffff" />
                                    <embed src="http://library.ipm.edu.mo/Intf/English/nav_menu.swf" menu="false" quality="high" bgcolor="#ffffff" width="750" height="45" align="middle" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                </object>
                            </td>
                        </tr>
                        <tr>
                            <td height="36" valign="top" background="layout51style/Intf/header_bar-about.jpg">
                                <img src="layout51style/Intf/English/pheader_about.jpg" width="100" height="36" align="top"><!-- InstanceBeginEditable name="PageHeader" --><img src="layout51style/Intf/English/pheader_info.jpg" width="145" height="36"><!-- InstanceEndEditable --></td>
                        </tr>
                        <tr>
                            <td height="534" valign="top" bordercolor="#FFFFFF" bgcolor="#EDEDED">
                                <!-- InstanceBeginEditable name="PageContent" -->
                                <table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="25" colspan="2" class="etext_s"><a href="http://library.ipm.edu.mo/English/index.htm">Home</a> &gt; About
                : About Library</td>
                                    </tr>
                                    <tr align="center" bgcolor="#E1E1E1">
                                        <td height="20" colspan="2" class="etext_s"><a href="#info">Introduction</a> | <a href="#facilities">Library Facilities</a></td>
                                    </tr>
                                    <tr>
                                        <td height="25" colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="25" height="30" align="center">
                                            <img src="layout51style/Intf/bullet_about.gif" width="12" height="17" align="absmiddle"></td>
                                        <td width="695" height="30" class="eheader">Introduction<a name="info" id="info"></a></td>
                                    </tr>
                                    <tr>
                                        <td height="25">&nbsp;</td>
                                        <td height="25" class="etext">
                                            <div align="justify">
                                                <br>
                                                Macao Polytechnic Institute Library serves the teaching and
				        learning missions of the Institute. Our objectives are to:<br>
                                                a) Improve knowledge, skill and professional level of individuals,<br>
                                                b) Provide information resources to facilitate teaching, learning and research,<br>
                                                c) Develop partnership with local and regional information providers in resources sharing.<br>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25" align="right" valign="bottom" colspan="2"><a href="javascript:window.scroll(0,0)" class="etext_s">
                                            <img src="layout51style/Intf/top_about.gif" width="9" height="5" border="0" align="absmiddle">
                                            Back
                  to Top</a> </td>
                                    </tr>
                                    <tr>
                                        <td height="18" colspan="2" background="layout51style/Intf/dot_sep.jpg">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="30" align="center">
                                            <img src="layout51style/Intf/bullet_about.gif" width="12" height="17" align="absmiddle"></td>
                                        <td height="30" class="eheader">Library Facilities<a name="facilities" id="facilities"></a></td>
                                    </tr>
                                    <tr>
                                        <td height="25" align="center">&nbsp;</td>
                                        <td height="25" class="etext">
                                            <br>
                                            <table width="695" border="0" cellspacing="0" cellpadding="0">
                                                <tr valign="top">
                                                    <td width="180" height="25" class="ctext">
                                                        <img src="layout51style/Intf/photo/self_return.jpg" width="170" height="130"></td>
                                                    <td width="515" height="25" class="etext"><strong>Automated
                        Book Return</strong><br>
                                                        Books may be returned  at the Automated Book Return system which located
      at the Library entrance. It is easy to use, efficient and convenient. It
      also gives enhanced privacy to our patrons.<br>
                                                        <br>
                                                        <!--<a href="http://library.ipm.edu.mo/Chinese/help/self_return_guide.pdf" target="_blank"><img src="../../Intf/more_icon.jpg" width="11" height="11" border="0" align="absmiddle"> Operating Instruction (PDF)</a> | -->
                                                        <a href="selfreturn_tips_e.pdf" target="_blank">
                                                            <img src="layout51style/Intf/more_icon.jpg" width="11" height="11" border="0" align="absmiddle">
                                                            Tips for Using Automated Book Return (PDF)</a>
                                                        <br>
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr valign="top">
                                                    <td height="25" class="ctext">
                                                        <img src="layout51style/Intf/photo/self_checkout.jpg" width="170" height="130"></td>
                                                    <td height="25" class="etext"><strong>Self-Service Checkout
                        Station</strong><br>
                                                        The Library is equipped with a Self-Service Checkout Station, patrons may
      checkout books themselves with their valid patron card and password.
      The operation is simple, easy and efficient. It
      also gives enhanced privacy to our patrons.<br>
                                                        <br>
                                                        <a href="http://library.ipm.edu.mo/Chinese/help/self_checkout_guide.pdf" target="_blank">
                                                            <img src="layout51style/Intf/more_icon.jpg" width="11" height="11" border="0" align="absmiddle">
                                                            Operating Instruction (PDF)<br>
                                                            <br>
                                                        </a></td>
                                                </tr>
                                                <tr valign="top">
                                                    <td height="25" class="ctext">
                                                        <img src="layout51style/Intf/photo/pc_lab.jpg" width="170" height="130"></td>
                                                    <td height="25" class="etext">
                                                        <div align="justify">
                                                            <strong>Multimedia Section</strong><br>
                                                            The Multimedia Section is fully equipped with computers, scanners, compact
        disc recordable / rewritable drive (CD-RW), printers, etc., whereby users
        can access Library electronic resources and Internet resources. All computing
        facilities are available on a first-come, first-served basis.<br>
                                                            <br>
                                                            The Multimedia Section is also equipped with AV equipment for users to
        utilize the multimedia resources collections in the Library. Library
        staffs on duty at the Circulation Counter will assist in the use of the
        AV equipment and in locating relevant materials. Special requests for
        using other multimedia materials must be approved by the Librarian.<br>
                                                            <br>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr valign="top">
                                                    <td height="25" class="ctext">
                                                        <img src="layout51style/Intf/photo/study_room.jpg" width="170" height="130"></td>
                                                    <td height="25" class="etext">
                                                        <div align="justify">
                                                            <strong>Study Rooms</strong><br>
                                                            The Library has three study rooms (2-10 users) for all MPI
        staff and students to do academic research or course-related study. All
        study rooms are equipped with network connection, notebook computers
            and projection systems. Please consult with the Library staff about
            further
        questions.<br>
                                                            <br>
                                                            <a href="studyroom_e.pdf" target="_blank">
                                                                <img src="layout51style/Intf/more_icon.jpg" width="11" height="11" border="0" align="absmiddle">
                                                                Regulations for the Use of the Library Study Rooms</a><br>
                                                            <br>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr valign="top">
                                                    <td height="25" class="ctext">
                                                        <img src="layout51style/Intf/photo/study_cubicle.jpg" width="170" height="130"></td>
                                                    <td height="25" class="etext">
                                                        <div align="justify">
                                                            <strong>Study Cubicles</strong><br>
                                                            The Library has fourteen study cubicles for all MPI
        staff and students to do academic research or course-related study. The
        Study Cubicles no.1, 2 &amp; 3 are opened for study, no reservation is
        needed. Please consult with the Library staff about further
        questions.<br>
                                                            <br>
                                                            <a href="studycubicle_e.pdf" target="_blank">
                                                                <img src="layout51style/Intf/more_icon.jpg" width="11" height="11" border="0" align="absmiddle">
                                                                Regulations for the Use of the Library Study Cubicles</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <!-- InstanceEndEditable -->
                            </td>
                        </tr>
                        <tr>
                            <td height="23" align="center" bordercolor="#FFFFFF" bgcolor="#EDEDED">
                                <table width="720" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td height="23" align="right"><a href="javascript:window.scroll(0,0)" class="etext_s">
                                            <img src="layout51style/Intf/top_about.gif" width="9" height="5" border="0" align="absmiddle">
                                            Back to Top</a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="60" bordercolor="#FFFFFF" bgcolor="#ACACAC">
                                <div align="right">
                                    <img src="layout51style/Intf/page_footer.jpg" width="354" height="60">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="10" background="layout51style/Intf/frame_side_R.jpg">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
