<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TutorSubjects.aspx.cs" Inherits="YearTutor_TutorSubjects" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Year Tutor Subjects</title>
   <link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css"/>
	<link rel="stylesheet" type="text/css" href="../resources/syntax/shCore.css"/>
	<link rel="stylesheet" type="text/css" href="../resources/demo.css"/>

	<script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
	<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" language="javascript" src="../resources/syntax/shCore.js"></script>
	<script type="text/javascript" language="javascript" src="../resources/demo.js"></script>
    <script type="text/javascript" language="javascript">


        $(document).ready(function () {
            var lang = '<%= Session["CurrentUI"] %>';
            if (lang == "") {

                var table = $('#example').DataTable({

                    initComplete: function () {
                        var api = this.api();

                        api.columns().indexes().flatten().each(function (i) {
                            var column = api.column(i);
                            var select = $('<select><option value=""></option></select>')
                        .appendTo($(column.footer()).empty())
                        .on('change', function () {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );

                            column
                                .search(val ? '^' + val + '$' : '', true, false)
                                .draw();
                        });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    },
                    stateSave: true,
                    "language": {
                        "sEmptyTable": "No data available in table",
                        "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries",
                        "sInfoEmpty": "Showing 0 to 0 of 0 entries",
                        "sInfoFiltered": "(filtered from _MAX_ total entries)",
                        "sInfoPostFix": "",
                        "sInfoThousands": ",",
                        "sLengthMenu": "Show _MENU_ entries",
                        "sLoadingRecords": "Loading...",
                        "sProcessing": "Processing...",
                        "sSearch": "Search:",
                        "sZeroRecords": "No matching records found",
                        "oPaginate": {
                            "sFirst": "First",
                            "sLast": "Last",
                            "sNext": "Next",
                            "sPrevious": "Previous"
                        },
                        "oAria": {
                            "sSortAscending": ": activate to sort column ascending",
                            "sSortDescending": ": activate to sort column descending"
                        }
                    }

                });



            }
            else if (lang != "" && lang == 'zh-TW') {
                var table = $('#example').DataTable({

                    initComplete: function () {
                        var api = this.api();

                        api.columns().indexes().flatten().each(function (i) {
                            var column = api.column(i);
                            var select = $('<select><option value=""></option></select>')
                        .appendTo($(column.footer()).empty())
                        .on('change', function () {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );

                            column
                                .search(val ? '^' + val + '$' : '', true, false)
                                .draw();
                        });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    },
                    stateSave: true,
                    "language": {
                        "sProcessing": "處理中...",
                        "sLengthMenu": "顯示 _MENU_ 項結果",
                        "sZeroRecords": "沒有匹配結果",
                        "sInfo": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                        "sInfoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                        "sInfoFiltered": "(從 _MAX_ 項結果過濾)",
                        "sInfoPostFix": "",
                        "sSearch": "搜索:",
                        "sUrl": "",
                        "oPaginate": {
                            "sFirst": "首頁",
                            "sPrevious": "上頁",
                            "sNext": "下頁",
                            "sLast": "尾頁"
                        }
                    }

                });
            }
            else {
                var table = $('#example').DataTable({

                    initComplete: function () {
                        var api = this.api();

                        api.columns().indexes().flatten().each(function (i) {
                            var column = api.column(i);
                            var select = $('<select><option value=""></option></select>')
                        .appendTo($(column.footer()).empty())
                        .on('change', function () {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );

                            column
                                .search(val ? '^' + val + '$' : '', true, false)
                                .draw();
                        });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    },
                    stateSave: true,
                    "language": {
                        "sEmptyTable": "No data available in table",
                        "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries",
                        "sInfoEmpty": "Showing 0 to 0 of 0 entries",
                        "sInfoFiltered": "(filtered from _MAX_ total entries)",
                        "sInfoPostFix": "",
                        "sInfoThousands": ",",
                        "sLengthMenu": "Show _MENU_ entries",
                        "sLoadingRecords": "Loading...",
                        "sProcessing": "Processing...",
                        "sSearch": "Search:",
                        "sZeroRecords": "No matching records found",
                        "oPaginate": {
                            "sFirst": "First",
                            "sLast": "Last",
                            "sNext": "Next",
                            "sPrevious": "Previous"
                        },
                        "oAria": {
                            "sSortAscending": ": activate to sort column ascending",
                            "sSortDescending": ": activate to sort column descending"
                        }
                    }

                });
            }

            $('#example tbody').on('click', 'tr', function () {
                $("#func_panel").css('display', 'inline');

                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            });
          
            $('#viewButton').click(function () {
                
                if (table.cell('.selected', 0).data() != null) {
                    $("#id_txt").val(table.cell('.selected', 0).data());

                    var sid = table.cell('.selected', 0).data();
					var stdName= table.cell('.selected', 1).data();
                    var alu_num = table.cell('.selected', 7).data().toString();
                    var aluseq = table.cell('.selected', 8).data().toString();
					var pess_cod = table.cell('.selected', 9).data().toString();
					
                    PageMethods.SetSessionValue('student_id', sid);
				    PageMethods.SetSessionValue('stdNameV1', stdName);
					PageMethods.SetSessionValue('stdNameV2', stdName);
                    PageMethods.SetSessionValue('ALUN_NUMERO', alu_num);
                    PageMethods.SetSessionValue('ALUN_NUMERO_SEQ', aluseq);
					PageMethods.SetSessionValue('PESS_COD', pess_cod);
                    PageMethods.SetSessionValue('academic', 'False');
                    window.open('../Student/schoolStaff.aspx', '_blank');
                    return false; 
                }
				else  return false; 
               
            });


            $('#adviseButton').click(function () {
                
                if (table.cell('.selected', 0).data() != null) {
                    $("#id_txt").val(table.cell('.selected', 0).data());				
					
					var alu_num = table.cell('.selected', 7).data().toString();
                    var aluseq = table.cell('.selected', 8).data().toString();
					
					PageMethods.SetSessionValue('ALUN_NUMERO', alu_num);
                    PageMethods.SetSessionValue('ALUN_NUMERO_SEQ', aluseq);
                }
               else return false; 
            });

        });

</script>
<link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <style type="text/css">
        #wrapper
        {
            width: 1100px;
            min-height:930px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid black 1px;
            border-right: solid black 1px;
        }
        
        #content
        {
            min-height:900px;
            margin-left: 5px;
            margin-right: 5px;
        }
        .title
        {
            font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
            font-size:28px;
        }
         #ImageButton2{
            width:13%;
        }
 
    </style>
</head>
<body background="../images/bg-blue.jpg">
    <form id="form1" runat="server">
    <asp:ScriptManager EnablePageMethods="true" ID="MainSM" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
    <div id="wrapper">
    <div id="content">
    <br />
    <br />
    <div class="title"><asp:Label ID="txt_title" runat="server" Text="<%$ Resources:Resource, sip_year_subject %>"  style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"/>
       <%--<asp:Button ID="btn_home" runat="server" Text="Home" style="font-size: large; margin-left:232px;"   CssClass="blue"
            onclick="btn_home_Click" CausesValidation="false"/>--%>
            </div>
        <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1057px">
               <asp:ImageButton ID="ImageButton2" runat="server"
                    onmouseover="this.src='../images/homeblue_hover.png'" 
                   onmouseout="this.src='../images/homeblue.png'" 
                   ImageUrl="~/images/homeblue.png" OnClick="ImageButton2_Click" CausesValidation="False" /> 
        </div>
    <br />
    <br />
    <table  cellspacing="0" cellpadding="1" style="border:solid #CCC 1px;border-radius:5px;width:100%;">
         <tr>
            <td colspan="3"> <span style="color:Red;">* </span><asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, sip_mandatory %>"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4"> <span style="color:blue;">
                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource, sip_pls_select %>"></asp:Label>  "<span style="color:red;"><asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource, sip_subject %>"></asp:Label></span>"
                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Resource, sip_and %>"></asp:Label> "<span style="color:red;"><asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, sip_acad_year %>"></asp:Label></span>", 
                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:Resource, sip_then %>"></asp:Label> "<span style="color:red;"><asp:Label ID="Label22" runat="server" Text="<%$ Resources:Resource, sip_search %>"></asp:Label></span>" <asp:Label ID="Label24" runat="server" Text="<%$ Resources:Resource, sip_button %>"></asp:Label>.</span>
               
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td style="width:15%;">
                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, sip_school %>"></asp:Label>: 
            </td>
            <td colspan="4">
                <%--     <asp:ListBox ID="programList" runat="server" OnSelectedIndexChanged="programList_SelectedIndexChanged"
                        AutoPostBack="true" Height="98px" Width="550px"></asp:ListBox>--%>
                <asp:TextBox ID="txt_school" runat="server" Enabled="false" Width="545px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, sip_tut_year %>"></asp:Label>:
            </td>
            <td colspan="5">
                <asp:TextBox ID="txt_year" runat="server" Enabled="false" Width="545px" />
            </td>
        </tr>
      
        <tr>
             <td style="width:150px;">
                 <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, sip_subject %>"></asp:Label>: <span style="color:red;">*</span>
                </td>
            <td colspan="4">
                <asp:ListBox ID="subjectCodeList" runat="server" Height="100px" Width="600px" 
                     onselectedindexchanged="subjectCodeList_SelectedIndexChanged" AutoPostBack="true">
                </asp:ListBox>
            </td>          
			<td>
			  <asp:RequiredFieldValidator ID="reqClassCodeList" ControlToValidate="subjectCodeList" ErrorMessage="<%$ Resources:Resource, sip_subject_code_req %>"
                        runat="server" style="color:Red;"  /></td>
            </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, sip_acad_year %>"></asp:Label>: <span style="color:red;">*</span>
            </td>
            <td>
                <asp:DropDownList ID="yearList" runat="server" Width="250px"  onselectedindexchanged="yearList_SelectedIndexChanged" AutoPostBack="true">
                     <asp:ListItem Value="" 　Text="<%$ Resources:Resource, sip_pls_select2 %>"></asp:ListItem>
                </asp:DropDownList>
            </td>
			<td>
				<asp:RequiredFieldValidator ID="reqYearList" ControlToValidate="yearList" ErrorMessage="<%$ Resources:Resource, sip_acad_year_req %>"
                        runat="server" style="color:Red;"  />
            </td>        
           </tr>
        <tr>
       
            <td >
                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, sip_class_name %>"></asp:Label></td>
            <td>
                <asp:DropDownList ID="classNameList" runat="server"  Width="250px">
                     <asp:ListItem Value="" Text="<%$ Resources:Resource, sip_pls_select2 %>"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
			<td>
                &nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td>     <asp:ImageButton ID="btn_search" runat="server" Text="Search"  style="width: 100px" 
			onmouseover="this.src='../images/search2.png'"
			onmouseout="this.src='../images/search1.png'" ImageUrl="../images/search1.png"  
			OnClick="btn_search_Click"/>
            <asp:TextBox ID="id_txt" runat="server" style="display: none;" /></td>
        </tr>
    <tr>
        <td></td>
        <td>&nbsp;</td>
    </tr>
       
    </table>
   
    <div>

  <div id="func_panel" style="display:none;">
      <br />
          <asp:ImageButton ID="viewButton" runat="server" Text="Details" OnClick="viewButtonClick"  onmouseover="this.src='../images/detail2.png'" 
			onmouseout="this.src='../images/detail1.png'" ImageUrl="../images/detail1.png" Style="width: 100px" />
            <asp:ImageButton ID="adviseButton" runat="server" Text="Advice" style="width: 100px" onclick="adviseButton_Click"  onmouseover="this.src='../images/advice2.png'" 
			onmouseout="this.src='../images/advice1.png'" ImageUrl="../images/advice1.png"/>
       </div>
           <br />  
    </div>
  

	 <asp:Panel ID="dataPanel" runat="server" Visible="false">
         <asp:Label ID="Label25" runat="server" Text="<%$ Resources:Resource, sip_hint %>"></asp:Label>
          <br /> <br />
 <table id="example" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>
                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Resource, sip_advice_std_id %>"></asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Resource, sip_std_name %>"></asp:Label>
                        </th>
                        <th>
                           <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Resource, sip_course_work %>"></asp:Label>
                        </th>
                        <th>
                           <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Resource, sip_final_exam %>"></asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:Resource, sip_final_score %>"></asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Resource, sip_grade %>"></asp:Label>
                        </th>
                        <th>
                            GPA
                        </th>
                           <th style="display:none;">
                            ALUN_NUMERO
                        </th>
                        <th style="display:none;">
                            ALUN_NUMERO_SEQ
                        </th>
						 <th style="display:none;">
                            PESS_COD
                        </th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>
                            Student ID
                        </th>
                        <th>
                            Student Name
                        </th>
                        <th>
                            Course Work
                        </th>
                        <th>
                            Final Exam 
                        </th>
                        <th>
                            Final Score
                        </th>
                        <th>
                            Grade
                        </th>
                        <th>
                            GPA
                        </th>
                           <th style="display:none;">
                            ALUN_NUMERO
                        </th>
                        <th style="display:none;">
                            ALUN_NUMERO_SEQ
                        </th>
						<th style="display:none;">
                            PESS_COD
                        </th>
                    </tr>
                </tfoot>
                <tbody>
                    <asp:Literal runat="server" ID="ltData"></asp:Literal>
                </tbody>
            </table>
</asp:Panel>
            <br />

            <div>
                <br />
                 <asp:Label ID="noDataMsg" runat="server" Text="<%$ Resources:Resource, sip_no_data %>" 
            Visible="False" Font-Size="X-Large" ForeColor="Red"></asp:Label>
           <asp:Panel ID="linePanel" runat="server" Visible="false">
        <div style="text-align:center;">
        <table style="width:100%">
        <tr>
        <td>
        <hr />
           <asp:label ID="Label1" runat="server" Text="<%$ Resources:Resource, sip_course_work %>" style="color:blue;font-size:14pt;"> </asp:label>
           </td>
          
          </tr>
          <tr>
         <td>
            <asp:Chart ID="lineChart_classWork" runat="server" Width="933px" Height="300px" OnInit="lineChart_classwork_Init">
                <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="<%$ Resources:Resource, sip_lr_description %>">
               </asp:Legend>
               </Legends>                            
             <%--   <Series>                                   
                     <asp:Series Name="Average Line"  ChartType="Line" Color="Tomato">
                    </asp:Series>
                     <asp:Series Name="Pass Line"  ChartType="Line" Color="Turquoise">
                    </asp:Series>
                </Series>--%>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            </td>
            </tr>
            <tr>
                <td>
                    <table style="border: black 1px; border-radius: 5px; background-color: Wheat; text-align: center; margin-left: 28%;">
                        <tr>
                            <td><asp:Label ID="Label27" runat="server" Text="<%$ Resources:Resource, sip_desc_stats %>"></asp:Label></td>
                            <td>
                                <table style="border: black 1px;">
                                    <tr>
                                        <td><asp:Label ID="Label32" runat="server" Text="<%$ Resources:Resource, sip_lowest %>"></asp:Label></td>
                                        <td>Q1(25%)</td>
                                        <td><asp:Label ID="Label33" runat="server" Text="<%$ Resources:Resource, sip_med %>"></asp:Label></td>
                                        <td>Q3(75%)</td>
                                        <td><asp:Label ID="Label34" runat="server" Text="<%$ Resources:Resource, sip_highest %>"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="classLowestWork" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="classQ1Work" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="classMedianWork" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="classQ3Work" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="classHighestWork" runat="server"> </asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
          
              <td>
            <asp:Chart ID="columnChart_classWork" runat="server" Width="933px" Height="300px" >
                <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="<%$ Resources:Resource, sip_lr_description %>">
               </asp:Legend>
               </Legends>                            
                <Series>                                   
                 </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            </td>
            </tr>
            <tr>
             <td>
             <hr />
               <asp:Label ID="Label2" runat="server" style="color:blue;font-size:14pt;" Text="<%$ Resources:Resource, sip_final_exam %>"> </asp:Label>
            </td>
            </tr>
             <tr>
            <td>
               <asp:Chart ID="lineChart_exam" runat="server" Width="933px" Height="300px" OnInit="lineChart_exam_Init">
                    <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="<%$ Resources:Resource, sip_lr_description %>">
               </asp:Legend>
               </Legends>
               <%-- <Series>                  
                    <asp:Series Name="Average Line"  ChartType="Line" Color="Tomato">
                    </asp:Series>
                     <asp:Series Name="Pass Line"  ChartType="Line" Color="Turquoise">
                    </asp:Series>
                </Series>--%>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            </td>
            </tr>
             <tr>
                <td>
                    <table style="border: black 1px; border-radius: 5px; background-color: Wheat; text-align: center; margin-left: 28%;">
                        <tr>
                            <td><asp:Label ID="Label36" runat="server" Text="<%$ Resources:Resource, sip_desc_stats %>"></asp:Label></td>
                            <td>
                                <table style="border: black 1px;">
                                    <tr>
                                        <td><asp:Label ID="Label26" runat="server" Text="<%$ Resources:Resource, sip_lowest %>"></asp:Label></td>
                                        <td>Q1(25%)</td>
                                        <td><asp:Label ID="Label28" runat="server" Text="<%$ Resources:Resource, sip_med %>"></asp:Label></td>
                                        <td>Q3(75%)</td>
                                        <td><asp:Label ID="Label29" runat="server" Text="<%$ Resources:Resource, sip_highest %>"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="examLowestWork" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="examQ1Work" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="examMedianWork" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="examQ3Work" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="examHighestWork" runat="server"> </asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
           <tr>
             <td>
               <asp:Chart ID="columnChart_exam" runat="server" Width="933px" Height="300px" >
                    <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="<%$ Resources:Resource, sip_lr_description %>">
               </asp:Legend>
               </Legends>
                <Series>                  
                    </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            </td>
          </tr>
          <tr>
            <td>
            <hr />
              <asp:label ID="Label3" runat="server" Text="<%$ Resources:Resource, sip_final_score %>" style="color:blue;font-size:14pt;"> </asp:label>
            </td>
           
          </tr>
          <tr>
          <td>
             <asp:Chart ID="lineChart_finalScore" runat="server" Width="933px" Height="300px" OnInit="lineChart_finalScore_Init">
                 <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="<%$ Resources:Resource, sip_lr_description %>">
               
                 </asp:Legend>
               </Legends>                        
               <%-- <Series>                                      
                     <asp:Series Name="Average Line"  ChartType="Line" Color="Tomato">
                    </asp:Series>
                     <asp:Series Name="Pass Line"  ChartType="Line" Color="Turquoise">
                    </asp:Series>
                </Series>--%>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            </td>
            </tr>
             <tr>
                <td>
                    <table style="border: black 1px; border-radius: 5px; background-color: Wheat; text-align: center; margin-left: 28%;">
                        <tr>
                            <td><asp:Label ID="Label37" runat="server" Text="<%$ Resources:Resource, sip_desc_stats %>"></asp:Label></td>
                            <td>
                                <table style="border: black 1px;">
                                    <tr>
                                        <td><asp:Label ID="Label30" runat="server" Text="<%$ Resources:Resource, sip_lowest %>"></asp:Label></td>
                                        <td>Q1(25%)</td>
                                        <td><asp:Label ID="Label31" runat="server" Text="<%$ Resources:Resource, sip_med %>"></asp:Label></td>
                                        <td>Q3(75%)</td>
                                        <td><asp:Label ID="Label35" runat="server" Text="<%$ Resources:Resource, sip_highest %>"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="finalLowestWork" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="finalQ1Work" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="finalMedianWork" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="finalQ3Work" runat="server"> </asp:Label></td>
                                        <td>
                                            <asp:Label ID="finalHighestWork" runat="server"> </asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
           <td>
             <asp:Chart ID="columnChart_finalScore" runat="server" Width="933px" Height="300px" >
                 <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="<%$ Resources:Resource, sip_lr_description %>">
               
                 </asp:Legend>
               </Legends>                        
                <Series>                                    
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            </td>
             </tr>
             </table>
             </div>
             </asp:Panel>

             
             
            <br />

           
             <asp:Panel ID="piePanel" runat="server" Visible="false" style="text-align:center;">
             <hr />
              <asp:Label ID="Label6" runat="server" text="<%$ Resources:Resource, sip_final_score_ratio %>" 
           style="color:Blue; font-family: 'Times New Roman', Times, serif;font-size:14pt;"/><br />
             
            <asp:Label ID="Label4" runat="server" 
                    text="<%$ Resources:Resource, sip_total_std %>" />:

                <asp:Label ID="totalPAX" runat="server"></asp:Label>

                 <br />
            <asp:Chart ID="pieChart" runat="server" Width="500px">
                <Series>
                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="Status" YValueMembers="Percentage"
                        IsVisibleInLegend="true" Color="255, 255,128,112" IsValueShownAsLabel="true" LabelFormat="{0:p}">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX LineColor="Gray">
                            <MajorGrid LineColor="Gray" />
                        </AxisX>
                        <AxisY LineColor="Gray">
                            <MajorGrid LineColor="Gray" />
                        </AxisY>
                        <Area3DStyle Enable3D="True" LightStyle="Realistic"></Area3DStyle>
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend>
                    </asp:Legend>
                </Legends>
            </asp:Chart>
        </asp:Panel>
            
            </div>
            </div>
            </div>
    </form>
</body>
</html>
