<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layout04_mpi.aspx.cs" Inherits="layout04_mpi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta property="og:image" content="layout04style/images/common/mpi_share.jpg" />
    <title>Macao Polytechnic Institute – Knowledge, Expertise, Global Vision!</title>
    <meta name="keywords" content="higher education, degree programmes,  Macau Polytechnic, Macao Polytechnic, top ranking institute, excellent education, leading institute, research, training, bachelor, master, doctor" />
    <meta name="author" content="" />
    <meta name="description" content="Established in 1991, Macao Polytechnic Institute is a public and forward-looking institute. The  Institute comprises of several academic, training and research units. It offers bachelor courses in Arts, Business, Health Sciences, Language and Translation, Physical Education and Sports, Public Administration and Computer Science." />
    <link href="layout04style/css/common/core.css" type="text/css" rel="stylesheet" />
    <link href="layout04style/css/common/general.css" type="text/css" rel="stylesheet" />
    <link href="layout04style/css/common/index.css" type="text/css" rel="stylesheet" />
    <link href="layout04style/css/en/style.css" type="text/css" rel="stylesheet" />
    <link href="layout04style/css/en/nav.css" type="text/css" rel="stylesheet" />
    <!-- <link href="/css/common/grayscale.css" type="text/css" rel="stylesheet" /> -->
    <!-- <script type="text/javascript" src="/js/common/jquery/jquery-1.8.3.min.js"></script> -->
    <script type="text/javascript" src="layout04style/js/common/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="layout04style/js/common/jquery/jquery.fancybox.js"></script>
    <!-- <script type="text/javascript" src="/js/common/grayscale.js"></script>
		<script type="text/javascript" src="/js/common/gray_apply.js"></script> -->
    <script type="text/javascript" src="layout04style/js/common/jquery/jquery.easing.js"></script>
    <script type="text/javascript" src="layout04style/js/common/jquery/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="layout04style/js/common/jquery/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" src="layout04style/js/common/jquery/jquery.jcarousel.min.js"></script>
    <script type="text/javascript" src="layout04style/js/common/jquery/jquery.cycle.all.js"></script>
    <script type="text/javascript" src="layout04style/js/common/jquery/verticalbanner.js"></script>
    <script type="text/javascript" src="layout04style/js/common/common.js"></script>
    <script type="text/javascript" src="layout04style/js/common/jq_control.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">
            document.writeln('<div id="size_control" class="' + currFontSize + '_size">');
</script>
        <div id="wrapper" class="">
            <div id="toolbar_wrap">
                <div id="toolbar">
                    <ul class="toolbar_left">
                        <li id="nav_admission"><a href="javascript:">Student Admission</a></li>
                        <li><a href="http://www.ipm.edu.mo/student_corner/en/index.php">Student</a></li>
                        <li><a href="http://alumni.ipm.edu.mo/" target='_blank'>Alumni</a></li>
                        <li><a href="http://www.ipm.edu.mo/intranet/index.html" target='_blank'>Staff</a></li>
                        <li id="nav_admin"><a href="javascript:">Administrative Units</a></li>
                        <li><a href="http://newsletter.ipm.edu.mo/index.php/en/" target='_blank'>e-Newsletter</a></li>

                    </ul>
                    <ul class="toolbar_right">
                        <li><a href="#">Language</a>
                            <div class="lang_nav">
                                <ul>
                                    <li><a href='index.html' class='selected'>English</a></li>
                                    <li><a href='http://www.ipm.edu.mo/zh/index.php'>中文</a></li>
                                    <li><a href='http://www.ipm.edu.mo/pt/index.php'>Português</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#">Search</a>
                            <div class="search_nav">
                                <form method='get' id='gschform' name='gschform' action='http://www.ipm.edu.mo/en/search.php'>
                                    <input type="text" name='keyword' /></form>
                                <a href="javascript:" onclick='document.gschform.submit()' class="search_btn"></a></div>
                        </li>
                        <li><a href="#">Share</a>
                            <div class="share_nav">
                                <ul>
                                    <li class="fb"><a href="javascript:">Facebook</a></li>
                                    <li class="tw"><a href="javascript:">Twitter</a></li>
                                    <li class="sn"><a href="javascript:">Sina</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="btn_fb"><a href="http://zh-tw.facebook.com/pages/澳門理工學院-Macao-Polytechnic-Institute-官方Official/139795602742434" target="_blank">Facebook</a></li>
                        <li class="fontsize">
                            <a href="javascript:changeFontSize(1);" class="small"></a>
                            <a href="javascript:changeFontSize(2);" class="middle"></a>
                            <a href="javascript:changeFontSize(3);" class="large"></a>
                        </li>
                    </ul>
                </div>

                <div id="toolbar_pulldown">
                    <div class="pulldown_container">
                        <div class="pulldown nav_admission">
                            <div class="pulldown_top"></div>
                            <div class="pulldown_body">
                                <ul class="clearfix">
                                    <li><a href="http://www.ipm.edu.mo/admission/en/index.php">Local Students Recruitment</a></li>
                                    <li><a href="http://www.ipm.edu.mo/admission_mainland/en/index.php">Student Admission from Mainland China</a></li>
                                    <li><a href="http://www.ipm.edu.mo/admission_overseas/en/index.php">Overseas Students Recruitment</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="pulldown nav_admin">
                            <div class="pulldown_top"></div>
                            <div class="pulldown_body">
                                <ul class="clearfix">
                                    <li class=''><a href='aad_general_information.html'>Academic Affairs Department</a>
                                        <ul>
                                            <li class='administrative_units'><a href='registry_overview.html'>Registry</a></li>
                                            <li class='administrative_units'><a href='sao_overview.html'>Student Affairs Office</a></li>
                                        </ul>
                                    </li>
                                    <li class=''><a href='csc_general_information.html'>Computer Service Centre</a></li>
                                    <li class=''><a href='fd_general_inforamation.html'>Finance Department</a>
                                        <ul>
                                            <li class='administrative_units'><a href='fd_general_information.html'>Finance Divison</a></li>
                                            <li class='administrative_units'><a href='td_general_information.html'>Treasury Division</a></li>
                                        </ul>
                                    </li>
                                    <li class=''><a href='gad_general_information.html'>General Administration Department</a>
                                        <ul>
                                            <li class='administrative_units'><a href='po_general_information.html'>Personnel Office</a></li>
                                            <li class='administrative_units'><a href='cpo_general_information.html'>Construction and Procurement Office</a></li>
                                            <li class='administrative_units'><a href='cso_general_information.html'>Central Services Office</a></li>
                                        </ul>
                                    </li>
                                    <li class=''><a href='mbo_overview.html'>Management Board Office</a></li>
                                    <li class=''><a href='pro_gereral_information.html'>Public Relations Office</a></li>
                                    <li class=''><a href='tscs_general_information.html'>Technical and Scientific Committee Secretariat</a></li>
                                    <li class=''><a href='wrd_general_information.html'>Welfare and Recreation Department</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div id="header_zone">
                <div class="logo_macaopoly"><a href="index.html">
                    <img src="layout04style/images/common/logo_macaopoly.gif" alt="" /></a></div>
            </div>
            <div id="nav_wrap">
                <ul id="nav" class="clearfix">
                    <li class='about_mpi'><a href='javascript:' class=''></a></li>
                    <li class='prospective_students'><a href='javascript:' class=''></a></li>
                    <li class='teaching_learning'><a href='http://www.ipm.edu.mo/teaching_learning/en/index.php' class=''></a></li>
                    <li class='academic_units'><a href='javascript:' class=''></a></li>
                    <li class='research'><a href='http://www.ipm.edu.mo/research/en/index.php' class=''></a></li>
                    <li class='library'><a href='http://library.ipm.edu.mo/English/index.htm' class=''></a></li>
                    <li class='facilities'><a href='javascript:' class=''></a></li>
                    <li class='administrative_units'><a href='aad_general_information.html' class=''></a></li>
                </ul>
                <div id="nav_pulldown_wrap">
                    <div id="pulldown_container">
                        <div class='pulldown' id='about_mpi'>
                            <div class='pulldown_top'></div>
                            <div class='pulldown_body'>
                                <ul class='clearfix'>
                                    <li class=''><a href='welcome_from_the_president.html'>Message from the President</a></li>
                                    <li class=''><a href='general_information.html'>General Information</a></li>
                                    <li class=''><a href='vision_guiding_values_and_mission_statement.html'>Vision, Guiding Values and Mission Statement</a></li>
                                    <li class=''><a href='organisational.html'>Organisational Chart</a></li>
                                    <li class=''><a href='authority_members.html'>Technical and Scientific Committee</a></li>
                                    <li class=''><a href='prof_li_zhaoxing.html'>Honorary Professors</a></li>
                                    <li class=''><a href='prof_zhou_chaochen.html'>Academic Advisors</a></li>
                                    <li class=''><a href='prof_samuelleong.html'>External Examiners</a></li>
                                    <li class=''><a href='academic_exchange.html'>Academic Exchange</a></li>
                                    <li class=''><a href='qa_overview.html'>QAA Institutional Review</a></li>
                                    <li class=''><a href='annual_report_overview.html'>Annual Report</a></li>
                                    <li class=''><a href='performance_pledge.html'>Performance Pledge</a></li>
                                    <li class=''><a href='dynamic_mpi.html'>Dynamic MPI</a></li>
                                    <li class=''><a href='fast_fact.html'>Fast Facts</a></li>
                                    <li class=''><a href='http://www.ipm.edu.mo/core/en/index.php'>Core Academic Area</a></li>
                                    <li class=''><a href='campus_map.html'>Campus Map</a></li>
                                    <li class=''><a href='useful_link.html'>Useful Links</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class='pulldown' id='prospective_students'>
                            <div class='pulldown_top'></div>
                            <div class='pulldown_body'>
                                <ul class='clearfix'>
                                    <li class='prospective_students'><a href='admission_policy.html'>Admission Policy</a></li>
                                    <li class='prospective_students'><a href='student_expectations.html'>Student Expectations</a></li>
                                    <li class='prospective_students'><a href='graduate_attributes.html'>Graduate Attributes</a></li>
                                    <li class='prospective_students'><a href='bachelor_programmes.html'>Programmes Overview</a></li>
                                    <li class='prospective_students'><a href='tutition_fee.html'>Tuition Fees</a></li>
                                    <li class='prospective_students'><a href='articulation_with_overseas_universities.html'>Articulation with Overseas Universities</a></li>
                                    <li class='prospective_students'><a href='http://www.ipm.edu.mo/admission/en/index.php' target='_self'>Local and Overseas Students Recruitment</a></li>
                                    <li class='prospective_students'><a href='http://www.ipm.edu.mo/admission_mainland/en/index.php' target='_self'>Student Admission Mainland China</a></li>
                                    <li class='prospective_students'><a href='http://www.ipm.edu.mo/admission_overseas/en/important_dates.php' target='_self'>Overseas student recruitment</a></li>
                                    <li class='prospective_students'><a href='macao_polytechnic_institute_general_guidelines_for.html'>General Guidelines for Students with a Disability</a></li>
                                    <li class='prospective_students'><a href='mpi_to_ipl.html'>Information for Exchange Students</a></li>
                                    <li class='prospective_students'><a href='academic_calendar.html'>Academic Calendar</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class='pulldown' id='teaching_learning'>
                            <div class='pulldown_top'></div>
                            <div class='pulldown_body'>
                            </div>
                        </div>
                        <div class='pulldown' id='academic_units'>
                            <div class='pulldown_top'></div>
                            <div class='pulldown_body'>
                                <div class='sec_title'>Schools</div>

                                <ul class='clearfix'>
                                    <li class='academic_units'><a href='http://www.ipm.edu.mo/arts/en/index.php'>School of Arts</a></li>
                                    <li class='academic_units'><a href='http://www.ipm.edu.mo/business/en/index.php'>School of Business</a></li>
                                    <li class='academic_units'><a href='http://www.ipm.edu.mo/sciences/en/index.php'>School of Health Sciences</a></li>
                                    <li class='academic_units'><a href='http://www.ipm.edu.mo/languages/en/index.php'>School of Languages and Translation</a></li>
                                    <li class='academic_units'><a href='http://www.ipm.edu.mo/pe/en/index.php'>School of Physical Education and Sports</a></li>
                                    <li class='academic_units'><a href='http://www.ipm.edu.mo/admin/en/index.php'>School of Public Administration</a></li>
                                </ul>
                                <div class='sec_title'>Research Centres</div>

                                <ul class='clearfix'>
                                    <li class='academic_units'><a href='cswcs_general_information.html'>Centre of Sino-Western Cultural Studies</a></li>
                                    <li class='academic_units'><a href='lcrcm_general_information.html'>Language and Culture Research Centre of Macao</a></li>
                                    <li class='academic_units'><a href='http://www.mpi-qmul.org/' target='_blank'>MPI-QMUL Information Systems Research Centre</a></li>
                                    <li class='academic_units'><a href='octsrc_general_information.html'>One Country Two Systems Research Centre</a></li>
                                    <li class='academic_units'><a href='pltrc_info.html'>Portuguese Language Teaching and Research Centre</a></li>
                                    <li class='academic_units'><a href='sepp_info.html'>Social, Economic and Public Policy Research Centre</a></li>
                                </ul>
                                <div class='sec_title'>Training Centres</div>

                                <ul class='clearfix'>
                                    <li class='academic_units'><a href='cesp_info.html'>Centre of Continuing Education and Special Projects</a></li>
                                    <li class='academic_units'><a href='http://gtrc.ipm.edu.mo/index.php?lang=en' target='_blank'>Gaming Teaching and Research Centre</a></li>
                                    <li class='academic_units'><a href='lang_info.html'>Language Training and Testing Centre</a></li>
                                    <li class='academic_units'><a href='http://bellcentre.ipm.edu.mo/' target='_blank'>MPI-BELL Centre of English</a></li>
                                    <li class='academic_units'><a href='seniors_info.html'>Seniors Academy</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class='pulldown' id='research'>
                            <div class='pulldown_top'></div>
                            <div class='pulldown_body'>
                            </div>
                        </div>
                        <div class='pulldown' id='library'>
                            <div class='pulldown_top'></div>
                            <div class='pulldown_body'>
                            </div>
                        </div>
                        <div class='pulldown' id='facilities'>
                            <div class='pulldown_top'></div>
                            <div class='pulldown_body'>
                                <ul class='clearfix'>
                                    <li class='facilities'><a href='information_technology_facilities.html'>Information Technology Facilities</a></li>
                                    <li class='facilities'><a href='wu_introduction.html'>Professor Wu Weishan’s Sculpture Studio and Confucius Statue</a></li>
                                    <li class='facilities'><a href='facilities__equipments_information.html'>Campus Facilities</a></li>
                                    <li class='facilities'><a href='biomedical_technology_laboratories.html'>Laboratories</a></li>
                                    <li class='facilities'><a href='sports_court_on_main_campus.html'>Sports Facilities</a></li>
                                    <li class='facilities'><a href='bookstore.html'>Bookstore</a></li>
                                    <li class='facilities'><a href='restaruants.html'>Canteens</a></li>
                                    <li class='facilities'><a href='overview.html'>Student Accommodations</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class='pulldown' id='administrative_units'>
                            <div class='pulldown_top'></div>
                            <div class='pulldown_body'>
                                <ul class='clearfix'>
                                    <li class=''><a href='aad_general_information.html'>Academic Affairs Department</a>
                                        <ul>
                                            <li class='administrative_units'><a href='registry_overview.html'>Registry</a></li>
                                            <li class='administrative_units'><a href='sao_overview.html'>Student Affairs Office</a></li>
                                        </ul>
                                    </li>
                                    <li class=''><a href='csc_general_information.html'>Computer Service Centre</a></li>
                                    <li class=''><a href='fd_general_inforamation.html'>Finance Department</a>
                                        <ul>
                                            <li class='administrative_units'><a href='fd_general_information.html'>Finance Divison</a></li>
                                            <li class='administrative_units'><a href='td_general_information.html'>Treasury Division</a></li>
                                        </ul>
                                    </li>
                                    <li class=''><a href='gad_general_information.html'>General Administration Department</a>
                                        <ul>
                                            <li class='administrative_units'><a href='po_general_information.html'>Personnel Office</a></li>
                                            <li class='administrative_units'><a href='cpo_general_information.html'>Construction and Procurement Office</a></li>
                                            <li class='administrative_units'><a href='cso_general_information.html'>Central Services Office</a></li>
                                        </ul>
                                    </li>
                                    <li class=''><a href='mbo_overview.html'>Management Board Office</a></li>
                                    <li class=''><a href='pro_gereral_information.html'>Public Relations Office</a></li>
                                    <li class=''><a href='tscs_general_information.html'>Technical and Scientific Committee Secretariat</a></li>
                                    <li class=''><a href='wrd_general_information.html'>Welfare and Recreation Department</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Nav end *** -->
            <div id="mainvis_zone">
                <div id="mainvis_container">
                    <div id="mainvis_bg"></div>
                    <div id="mainvis">
                        <div class="mainvis_txt graduate"></div>
                        <div class="mainvis_txt knowledge"></div>
                        <div class="mainvis_txt scholarships"></div>
                        <div class="mainvis_txt slogan"></div>
                        <div class="mainvis_nav admission">
                            <ul>
                                <li class="title"></li>
                                <li class="btn1"><a href="http://www.ipm.edu.mo/admission/en/index.php"></a></li>
                                <li class="btn2"><a href="http://www.ipm.edu.mo/admission_mainland/en/index.php"></a></li>
                                <li class="btn3"><a href="http://www.ipm.edu.mo/admission_overseas/en/index.php"></a></li>
                            </ul>
                        </div>
                        <div class="mainvis_nav academic">
                            <ul>
                                <li class="title"></li>
                                <li class="btn1"><a href="javascript:;"></a>
                                    <div class="mainvis_subnav">
                                        <ul>
                                            <li><a href="http://www.ipm.edu.mo/arts/en/index.php">School of Art</a></li>
                                            <li><a href="http://www.ipm.edu.mo/business/en/index.php">School of Business</a></li>
                                            <li><a href="http://www.ipm.edu.mo/sciences/en/index.php">School of Health Sciences</a></li>
                                            <li><a href="http://www.ipm.edu.mo/languages/en/index.php">School of Languages and Translation</a></li>
                                            <li><a href="http://www.ipm.edu.mo/pe/en/index.php">School of Physical Education and Sports</a></li>
                                            <li><a href="http://www.ipm.edu.mo/admin/en/index.php">School of Public Administration</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="btn2"><a href="http://www.ipm.edu.mo/postgraduate/en/index.php"></a></li>
                                <li class="btn3"><a href="javascript:;"></a>
                                    <div class="mainvis_subnav">
                                        <ul>
                                            <li><a href="cswcs_general_information.html">Centre of Sino-Western Cultural Studies</a></li>
                                            <li><a href="lcrcm_general_information.html">Language and Culture Research Centre of Macao</a></li>
                                            <li><a href="http://www.mpi-qmul.org/" target="_blank">MPI-QMUL Information Systems Research Centre</a></li>
                                            <li><a href="octsrc_general_information.html">One Country Two Systems Research Centre</a></li>
                                            <li><a href="pltrc_info.html">Portuguese Language Teaching and Research Centre</a></li>
                                            <li><a href="sepp_info.html">Social, Economic and Public Policy Research Centre</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="btn4"><a href="language_testing.html"></a></li>
                            </ul>
                        </div>
                        <div class="mainvis_nav more">
                            <ul>
                                <li class="title"></li>
                                <li class="btn1"><a href="http://www.ipm.edu.mo/student_corner/en/exchange_programmes.php"></a></li>
                                <li class="btn2"><a href="http://www.ipm.edu.mo/student_corner/en/memories_at_mpi.php"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div id="index_highlight"><a href="qa_overview.html" class="highlights_msg">Macao's first higher education institution having a successful Institutional Review by the Quality Assurance Agency, UK.</a></div>
                    <div id="container_bg"></div>
                </div>
                <!-- Main Visual end -->
            </div>

            <div id="middle_zone">
                <div id="content">
                    <div id="highlights_wrap">
                        <div class="title">
                            <img src="layout04style/images/en/home_highlights_title_highlights.png" alt="" /><a href="highlights.html" class="btn_more"></a></div>
                        <div class="highlights">
                            <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                            <div class="jcarousel">
                                <ul>
                                    <li><a href='highlightsaaf3.html?hlight=19622'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19622.jpg' alt='' /><span>Ma Iao Hang Encourages Hubei Students to Equip Themselves Well and Achieve Their Full Potential at MPI</span></a></li>
                                    <li><a href='highlights755a.html?hlight=19605'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19605.jpg' alt='' /><span>Father of the Internet Encourages MPI Students to Engage in Innovative Research Activities</span></a></li>
                                    <li><a href='highlights6fe3.html?hlight=19604'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19604.jpg' alt='' /><span>Orientation for Exchange Students for the First Semester of Academic Year 2015/2016</span></a></li>
                                    <li><a href='highlights8c93.html?hlight=19592'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19592.jpg' alt='' /><span>Journey to Excellence<br>
                                            MPI Orientation Activities</span></a></li>
                                    <li><a href='highlightsc4cf.html?hlight=19533'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19533.jpg' alt='' /><span>Maintaining International Standards and Nurturing Talents MPI Held Its Opening Ceremony for the Academic Year 2015-2016</span></a></li>
                                    <li><a href='highlights7d2f.html?hlight=19498'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19498.jpg' alt='' /><span>ALICE 3D Programming Contest Awards Projects show creative potential and fascinating mix of Macao’s Chinese and Western cultures</span></a></li>
                                    <li><a href='highlights1e3f.html?hlight=19448'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19448.jpg' alt='' /><span>Warm Congratulations to MPI Student and Alumni for being awarded the “Macao Talent Awards 2015” of Macao Foundation</span></a></li>
                                    <li><a href='highlights948c.html?hlight=19319'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19319.jpg' alt='' /><span>“Master of Government Management” to be Offered at MPI</span></a></li>
                                    <li><a href='highlights430a.html?hlight=19136'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19136.jpg' alt='' /><span>“2015 Pan-Pearl River Delta Region Universities IT Project Competition” Successfully Held in MPI with Our Students Receiving a Distinguished Award</span></a></li>
                                    <li><a href='highlights61b2.html?hlight=19127'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19127.jpg' alt='' /><span>Social Welfare Bureau Scholarship to Support Outstanding Students<br>
                                            Nurturing High-Quality Social Work Professionals for the Community</span></a></li>
                                    <li><a href='highlights7629.html?hlight=19084'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19084.jpg' alt='' /><span>Pooling strengths to contribute to society<br>
                                            1<sup>st</sup> MPI Alumni Day: A Huge Success</span></a></li>
                                    <li><a href='highlightsfad2.html?hlight=19050'>
                                        <img src='layout04style/cntfiles/highlight/highlight_19050.jpg' alt='' /><span>Joint Solo Exhibition in New York by MPI Professors: Hsu Hsiu Chu & Chen Chiu Jhin</span></a></li>
                                    <li><a href='highlightsa804.html?hlight=18998'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18998.jpg' alt='' /><span>Student Chen Yuhan Achieves “The Best Debater Award” in the 5th World Mandarin Debating Championship</span></a></li>
                                    <li><a href='highlightse603.html?hlight=18977'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18977.jpg' alt='' /><span>MPI reaches new level of academic collaboration with the University of Lisbon to strengthen cooperation in Portuguese language learning between China, Portugal and Macao</span></a></li>
                                    <li><a href='highlights9e5b.html?hlight=18975'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18975.jpg' alt='' /><span>MPI Graduation Ceremony for Academic Year 2014-2015</span></a></li>
                                    <li><a href='highlights8ee7.html?hlight=18932'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18932.jpg' alt='' /><span>MPI Visits Peking University and BLCU to Strengthen Cooperation in Portuguese Language Teaching and Research</span></a></li>
                                    <li><a href='highlightsc21f.html?hlight=18884'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18884.jpg' alt='' /><span>Visit by the Vice-President of South China Normal University</span></a></li>
                                    <li><a href='highlightsb25d.html?hlight=18876'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18876.jpg' alt='' /><span>MPI Music Programme Organises Joint Concerts in Beijing</span></a></li>
                                    <li><a href='highlightsd912.html?hlight=18874'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18874.jpg' alt='' /><span>Over 4,300 Applications Received for Admission to MPI – MPI Programmes Most Popular Among Macao Students</span></a></li>
                                    <li><a href='highlights2b07.html?hlight=18872'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18872.jpg' alt='' /><span>MPI Journal Ranks 6<sup>th</sup> in the “Duplicated Materials from Newspapers and Periodicals” Rankings</span></a></li>
                                    <li><a href='highlights8e8c.html?hlight=18814'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18814.jpg' alt='' /><span>MPI Receives APQN Quality Award</span></a></li>
                                    <li><a href='highlightsfd14.html?hlight=18333'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18333.jpg' alt='' /><span>Visit by the Dean of the School of Engineering and Applied Science, UCLA</span></a></li>
                                    <li><a href='highlights2ac1.html?hlight=18266'>
                                        <img src='layout04style/cntfiles/highlight/highlight_18266.jpg' alt='' /><span>MPI’s website receives the Silver Award (Websites-School/University) of the Horizon Interactive Awards 2014</span></a></li>
                                    <li><a href='highlightsee5f.html?hlight=16956'>
                                        <img src='layout04style/cntfiles/highlight/highlight_16956.jpg' alt='' /><span>Former Foreign Minister Li Zhaoxing Holds Dialogue with MPI Students</span></a></li>
                                    <li><a href='highlightsbf05.html?hlight=16950'>
                                        <img src='layout04style/cntfiles/highlight/highlight_16950.jpg' alt='' /><span>Passions for the Future – MPI Career Day</span></a></li>
                                    <li><a href='highlightsdafb.html?hlight=15948'>
                                        <img src='layout04style/cntfiles/highlight/highlight_15948.jpg' alt='' /><span>Macao Polytechnic Institute and Taiwan Chung Cheng University Sign a Cooperation Agreement to Extend Cooperation and Exchange </span></a></li>
                                </ul>
                            </div>
                            <a href="#" class="jcarousel-control-next">&rsaquo;</a>
                        </div>
                    </div>
                    <div id="news_wrap">
                        <div class="title">
                            <img src="layout04style/images/en/home_highlights_title_news.png" alt="" /><a href="news__events.html" class="btn_more"></a></div>
                        <div id="news" class="news">
                            <ul class="banner">
                                <li>
                                    <h4>20 Aug - 27 Nov 2015</h4>
                                    <a href='http://www.ipm.edu.mo/cntfiles/upload/docs/news_events/orientation1516_e.pdf' target='_blank'>MPI Orientation Activities -- Academic Year 2015/2016</a></li>
                                <li>
                                    <h4>28 Feb 2015</h4>
                                    <a href='news__events3a99.html?event=17364'>MPI Open Day 2015 to Be Held on 28th February</a></li>
                            </ul>
                        </div>
                        <a href="javascript:" id="a_up"></a>
                        <a href="javascript:" id="a_down"></a>
                    </div>
                </div>
            </div>
            <!-- Content end -->

            <div id="promobanner_wrap_zone">
                <div id="promobanner_wrap">
                    <div id='promobanner_group1' class='promobanner_group'>
                        <a href='http://www.ipm.edu.mo/postgraduate/en/pccu_political.php'>
                            <img src='layout04style/cntfiles/banner/home/banner_9712_EN.gif' alt='' /></a>
                        <a href='http://csp.ipm.edu.mo/'>
                            <img src='layout04style/cntfiles/banner/home/banner_9714_EN.gif' alt='' /></a>
                    </div>
                    <div id='promobanner_group2' class='promobanner_group'>
                        <a href='http://webapps.ipm.edu.mo/srms/eportfolio/index_e.html' target='_blank'>
                            <img src='http://www.ipm.edu.mo/cntfiles/banner/home/banner_19534_EN' alt='' /></a>
                        <a href='http://www.ipm.edu.mo/orientation/index_e.html' target='_blank'>
                            <img src='http://www.ipm.edu.mo/cntfiles/banner/home/banner_19213_EN' alt='' /></a>
                        <a href='http://www.ipm.edu.mo/ITC/index.html' target='_blank'>
                            <img src='layout04style/cntfiles/banner/home/banner_16137_EN.gif' alt='' /></a>
                        <a href='http://www.ipm.edu.mo/msol/' target='_blank'>
                            <img src='http://www.ipm.edu.mo/cntfiles/banner/home/banner_18935_EN' alt='' /></a>
                        <a href='http://www.ipm.edu.mo/teaching_learning/en/teaching_excellence_award_academic_year_2013_2014.php'>
                            <img src='layout04style/cntfiles/banner/home/banner_9715_EN.gif' alt='' /></a>
                    </div>
                    <div id='promobanner_group3' class='promobanner_group'>
                        <a href='http://www.ipm.edu.mo/heconf2015/index_e.html' target='_blank'>
                            <img src='http://www.ipm.edu.mo/cntfiles/banner/home/banner_18944_EN' alt='' /></a>
                        <a href='index.html'>
                            <img src='layout04style/cntfiles/banner/home/banner_18481_EN.jpg' alt='' /></a>
                        <a href='distinguish_liberal.html'>
                            <img src='layout04style/cntfiles/banner/home/banner_18276_EN.jpg' alt='' /></a>
                    </div>
                </div>
            </div>
            <!-- Promo Banner end -->

            <div id="activ_cal_wrap">
                <a href="javascript:;" class="btn_activ_cal"></a>
                <div id="cal_wrapper">
                    <div id="cal_wrap">
                        <a href="activities_calendar.html" class="btn_more"></a>
                        <div class="cal_month">
                            <a href="javascript:;" onclick='getEventMonth(-1);' class="btn_prev"></a>
                            <span id='span_mname'>Sep 2015</span>
                            <a href="javascript:;" onclick='getEventMonth(1);' class="btn_next"></a>
                        </div>
                        <div class="cal_week">
                            <img src="layout04style/images/common/cal_week.png" alt="" /></div>
                        <div class="cal_day">
                            <ul id='cal_day_1'>
                                <li></li>
                                <li></li>
                                <li class='date1'><a href='javascript:;'></a></li>
                                <li class='date2'><a href='javascript:;'></a></li>
                                <li class='date3'><a href='javascript:;'></a></li>
                                <li class='date4'><a href='javascript:;'></a></li>
                                <li class='date5 event'><a href='javascript:;'></a></li>
                                <li class='date6'><a href='javascript:;'></a></li>
                                <li class='date7'><a href='javascript:;'></a></li>
                                <li class='date8'><a href='javascript:;'></a></li>
                                <li class='date9'><a href='javascript:;'></a></li>
                                <li class='date10'><a href='javascript:;'></a></li>
                                <li class='date11'><a href='javascript:;'></a></li>
                                <li class='date12'><a href='javascript:;'></a></li>
                                <li class='date13'><a href='javascript:;'></a></li>
                                <li class='date14'><a href='javascript:;'></a></li>
                                <li class='date15'><a href='javascript:;'></a></li>
                                <li class='date16'><a href='javascript:;'></a></li>
                                <li class='date17 today'><a href='javascript:;'></a></li>
                                <li class='date18'><a href='javascript:;'></a></li>
                                <li class='date19'><a href='javascript:;'></a></li>
                            </ul>
                            <ul id='cal_day_2'>
                                <li class='date20'><a href='javascript:;'></a></li>
                                <li class='date21'><a href='javascript:;'></a></li>
                                <li class='date22'><a href='javascript:;'></a></li>
                                <li class='date23'><a href='javascript:;'></a></li>
                                <li class='date24'><a href='javascript:;'></a></li>
                                <li class='date25'><a href='javascript:;'></a></li>
                                <li class='date26 event'><a href='javascript:;'></a></li>
                                <li class='date27'><a href='javascript:;'></a></li>
                                <li class='date28'><a href='javascript:;'></a></li>
                                <li class='date29'><a href='javascript:;'></a></li>
                                <li class='date30'><a href='javascript:;'></a></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                        </div>
                        <div id="cal_legends"><span class="today_legend">Today</span><span class="event_legend">Event Day</span></div>
                    </div>
                    <div id="cal_event_wrap">
                        <span id='span_event_wrap'>
                            <div class='event_date'><span>05 Sep 2015</span></div>
                            <div class='cal_detail'>
                                <a href='#' class='jcarousel-control-prev'>&lsaquo;</a>
                                <div class='jcarousel'>
                                    <ul>
                                        <li>
                                            <h4>05 Sep 2015</h4>
                                            <a href='activities_calendar41d9.html?actid=19422'>合辦 「山 毅中階訓練班」</a></li>
                                    </ul>
                                </div>
                                <a href='#' class='jcarousel-control-next'>&rsaquo;</a>
                            </div>
                            <div class='event_date'><span>26 Sep 2015</span></div>
                            <div class='cal_detail'>
                                <a href='#' class='jcarousel-control-prev'>&lsaquo;</a>
                                <div class='jcarousel'>
                                    <ul>
                                        <li>
                                            <h4>26 Sep 2015</h4>
                                            <a href='activities_calendar0859.html?actid=19579'>Campus Life Talk & Bubble Balloon Game</a></li>
                                        <li>
                                            <h4>26 Sep 2015</h4>
                                            <a href='activities_calendar9f80.html?actid=19586'>Visual Memories of Revolution</a></li>
                                    </ul>
                                </div>
                                <a href='#' class='jcarousel-control-next'>&rsaquo;</a>
                            </div>
                        </span>
                        <a href="javascript:;" class="btn_back"><span></span>Back</a>
                    </div>
                </div>
            </div>
            <!-- Activities Calendar end -->
            <script type="text/javascript">
                var i_ym_default = i_ym = 201509;
                var i_ym_limit_left = 201401;
                function resumeCurrentMonth() {
                    i_ym = i_ym_default;
                    getEventMonth(0);
                }
                function getEventMonth(i) {
                    if (i_ym + i < i_ym_limit_left) {
                        return;
                    }
                    $.ajax({
                        url: '/__getinfo.php?type=1&lang=1&month=' + (i_ym + i),
                        success: function (data, textStatus, jqXHR) {
                            a_lst = data.split('`~`');
                            i_ym = parseInt(a_lst[0]);
                            $('#span_mname').text(a_lst[1]);
                            $('#cal_day_1').html(a_lst[2]);
                            $('#cal_day_2').html(a_lst[3]);
                            $('#span_event_wrap').html(a_lst[4]);
                            //data - response from server
                            reInitCalendar();
                        }
                    });
                }
		</script>
            <div id="footer_zone">

                <div id="footer">
                    <ul>
                        <li class="custom_logo">
                            <p style="margin: 0 0 0 9px; font-size: 0.7em">International recognition:</p>
                            <a href="http://www.ipm.edu.mo/admin/en/bsc_objectives.php">
                                <img src="layout04style/images/common/logo_iet.jpg" alt="" /></a>
                            <a href="http://www.ipm.edu.mo/admin/en/bsc_objectives.php">
                                <img src="layout04style/images/common/logo_engineering_council.jpg" alt="" /></a>
                            <a href="http://www.ipm.edu.mo/business/en/objectives.php">
                                <img src="layout04style/images/common/logo_acca.jpg" alt="" /></a>
                            <a href="http://www.ipm.edu.mo/business/en/objectives.php">
                                <img src="layout04style/images/common/logo_cpa.jpg" alt="" /></a>
                            <a href="http://www.ipm.edu.mo/business/en/bec_objectives.php">
                                <img src="layout04style/images/common/logo_cec.jpg" alt="" /></a>
                            <a href="http://www.a3es.pt/en" target="_blank">
                                <img src="layout04style/images/common/logo_A3ES.gif" alt="" /></a>
                            <a href="http://er.heeact.edu.tw/EvaluationYearList.aspx?key=56" target="_blank">
                                <img src="layout04style/images/common/logo_heeact.gif" alt="" /></a>
                            <img src="layout04style/images/common/logo_iso.gif" alt="" />
                            <img src="layout04style/images/common/logo_silver.png" alt="" />
                        </li>
                        <li class="info">
                            <!--<table cellspacing="0" cellpadding="0">
						<tr>
							<th>Address</th>
							<td colspan="2">: R. de Luís Gonzaga Gomes, Macao</td>
						</tr>
						<tr>
							<th>Tel</th>
							<td colspan="2">: (853) 2857 8722        <strong>Fax:</strong> (853) 2830 8801</td>
						</tr>
						<tr>
							<th>Enquiries</th>
							<td>: General - </td>
							<td>Student’s Affairs</td>
						</tr>
						<tr>
							<th></th>
							<td><a href="mailto:webadmin@ipm.edu.mo">webadmin@ipm.edu.mo</a></td>
							<td><a href="mailto:registry@ipm.edu.mo">registry@ipm.edu.mo</a></td>
						</tr>
					</table>-->


                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td><strong>Address: </strong>R. de Luís Gonzaga Gomes, Macao&nbsp;&nbsp;<strong>Tel:</strong> (853) 2857 8722&nbsp;&nbsp;<strong>Fax:</strong> (853) 2830 8801</td>
                                </tr>
                                <tr>
                                    <td><strong>Enquiries:&nbsp;</strong> General - <a href="mailto:webadmin@ipm.edu.mo">webadmin@ipm.edu.mo</a>&nbsp;&nbsp;Student’s Affairs - <a href="mailto:registry@ipm.edu.mo">registry@ipm.edu.mo</a></td>
                                </tr>
                            </table>
                        </li>
                        <li class="copyright">
                            <a href="useful_link.html"><span>Useful Links</span></a>
                            <a href="contact_us.html"><span>Contact us</span></a>
                            <a href="privacy_policy_statement.html"><span>Privacy Policy</span></a>
                            <a href="po_vacancies.html"><span>Job Vacancies</span></a>
                            <a href="page_directory.html"><span>Page Directory</span></a><!-- <br/> -->
                            Copyright &copy; 2015 Macao Polytechnic Institute. All rights reserved.          </li>
                    </ul>
                </div>

            </div>
        </div>
        <!-- Wrapper end -->
        </div>
	<script type="text/javascript">
	    var _gaq = _gaq || [];
	    _gaq.push(['_setAccount', 'UA-27391500-1']);
	    _gaq.push(['_trackPageview']);

	    (function () {
	        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	    })();
    </script>
    </form>
</body>
</html>
