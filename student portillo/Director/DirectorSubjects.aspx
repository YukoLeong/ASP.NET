<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DirectorSubjects.aspx.cs" Inherits="Director_DirectorSubjects" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Director Subjects</title>
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
                $("#func_panel").css('display', 'block');

                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            });

            $('#viewButton').click(function () {
                // alert(table.cell('.selected', 0).data());
                if (table.cell('.selected', 0).data() != null) {
                    $("#id_txt").val(table.cell('.selected', 0).data());

                    var sid = table.cell('.selected', 0).data();
                    var alu_num = table.cell('.selected', 7).data().toString();
                    var aluseq = table.cell('.selected', 8).data().toString();
					var pess_cod = table.cell('.selected', 9).data().toString();
					
                    PageMethods.SetSessionValue('student_id', sid);
                    PageMethods.SetSessionValue('ALUN_NUMERO', alu_num);
                    PageMethods.SetSessionValue('ALUN_NUMERO_SEQ', aluseq);
					PageMethods.SetSessionValue('PESS_COD', pess_cod);

                    window.open('../Student/schoolStaff.aspx', '_blank');
                    return false; 
                }
               else return false;
			   
            });


            $('#adviseButton').click(function () {
                
                if (table.cell('.selected', 0).data() != null) {
                    $("#id_txt").val(table.cell('.selected', 0).data());


                }
               
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
<body  background="../images/bg-blue.jpg">
    <form id="form1" runat="server">
    <asp:ScriptManager EnablePageMethods="true" ID="MainSM" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
  <div id="wrapper">
    <div id="content">
    <br />
    <br />
    <asp:Label ID="Label5" ÏD="txt_title" runat="server" Text="<%$ Resources:Resource, sip_director_subject %>" class="title"/>
    <%-- <asp:Button ID="btn_home" runat="server" Text="Home" style="font-size:large; margin-left:232px;"   CssClass="blue"
            onclick="btn_home_Click"/>--%>

        <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1057px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" OnClick="btn_home_Click" CausesValidation="False" /> 
    </div>
    <br />
    <br />
    <table class="style1" width="100%" cellspacing="0" cellpadding="2" style="border:solid #CCC 1px;border-radius:5px;">
        <tr>
                <td colspan="3"><span style="color:Red;">* </span><asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, sip_mandatory %>"></asp:Label></td>
            </tr>
        <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, sip_school %>"></asp:Label> : <span style="color:red;">*</span>
                </td>
                <td colspan="2">
               <%--     <asp:ListBox ID="programList" runat="server" OnSelectedIndexChanged="programList_SelectedIndexChanged"
                        AutoPostBack="true" Height="98px" Width="550px"></asp:ListBox>--%>

                        <asp:TextBox ID="txt_school" runat="server" Enabled="false" Width="545px"/>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, sip_program %>"></asp:Label>: <span style="color:red;">*</span>
                </td>
                <td colspan="4">
                    <asp:ListBox ID="programList" runat="server" OnSelectedIndexChanged="programList_SelectedIndexChanged"
                        AutoPostBack="true" Style="width: 900px; height: 98px;"></asp:ListBox>
                </td>
            </tr>
        <tr>
            <td class="style9">
                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, sip_acad_year %>"></asp:Label>:<span style="color:red;">*</span>
                </td>
            <td class="style5">
                <asp:ListBox ID="yearList" runat="server" Height="167px" Width="250px"
                onselectedindexchanged="yearList_SelectedIndexChanged" AutoPostBack="true">
                </asp:ListBox>
            </td>
            <td class="style10">
                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, sip_subject_code %>"></asp:Label>: <span style="color:red;">*</span>
                </td>
            <td class="style3">
              <%--  <asp:ListBox ID="classCodeList" runat="server" Height="167px" Width="250px" 
                onselectedindexchanged="loadDataTable" AutoPostBack="true">
                </asp:ListBox>--%>
                <asp:ListBox ID="classCodeList" runat="server" Height="167px" Width="250px" 
                    AutoPostBack="true" OnSelectedIndexChanged="subjectList_SelectedIndexChanged">
                </asp:ListBox>
            </td>
            
        </tr>
		 <tr>
           <td>
               <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, sip_subject %>"></asp:Label> :
           </td>
           <td><asp:TextBox ID="txt_subjectName" runat="server" Enabled="false" style="width:450px;" ></asp:TextBox></td>
           </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style5">
                <asp:ListBox ID="ListBox3" runat="server" Height="250px" Width="450px"
                Visible="False">
                </asp:ListBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:ImageButton ID="btn_search" runat="server" Text="Search" 
                onmouseover="this.src='../images/search2.png'" onmouseout="this.src='../images/search1.png'" ImageUrl="../images/search1.png"
                OnClick="btn_searchClick" style="width: 100px"/>
            <asp:TextBox ID="id_txt" runat="server" style="display: none;" /></td>
            <td>
                &nbsp;</td>
        </tr>
  
    </table>
   
    <div id="func_panel" style="display:none;"> 
        <br /> 
       <asp:ImageButton ID="viewButton" runat="server" Text="Details" OnClick="viewButtonClick"  
                Style="width: 100px"  onmouseover="this.src='../images/detail2.png'" 
			onmouseout="this.src='../images/detail1.png'" ImageUrl="../images/detail1.png"/>
           <asp:ImageButton ID="adviseButton" runat="server" Text="Advice" style="width: 100px" 
            onclick="adviseButton_Click"  onmouseover="this.src='../images/advice2.png'" 
			onmouseout="this.src='../images/advice1.png'" ImageUrl="../images/advice1.png"/>     
    </div>
    <br />
        
    <asp:Panel ID="dataPanel"  runat="server" Visible="false">
        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:Resource, sip_hint %>"></asp:Label>
        <br /> <br />
        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>
                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Resource, sip_advice_std_id %>"></asp:Label>
                    </th>
                    <th>
                         <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Resource, sip_std_name %>"></asp:Label>
                    </th>
                    <th>
                         <asp:Label ID="Label20" runat="server" Text="<%$ Resources:Resource, sip_course_work %>"></asp:Label>
                    </th>
                    <th>
                         <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Resource, sip_final_exam %>"></asp:Label>
                    </th>
                    <th>
                       <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Resource, sip_final_score %>"></asp:Label>
                    </th>
                    <th>
                       <asp:Label ID="Label23" runat="server" Text="<%$ Resources:Resource, sip_grade %>"></asp:Label>
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
     <asp:Label ID="noDataMsg" runat="server" Text="<%$ Resources:Resource, sip_no_data %>" 
            Visible="False" Font-Size="X-Large" ForeColor="Red"></asp:Label>

            <div>
           <asp:Panel ID="linePanel" runat="server" Visible="false">
                <br />
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
                <%--<Series>                                   
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
                            <td><asp:Label ID="Label28" runat="server" Text="<%$ Resources:Resource, sip_desc_stats %>"></asp:Label></td>
                            <td>
                                <table style="border: black 1px;">
                                    <tr>
                                        <td><asp:Label ID="Label29" runat="server" Text="<%$ Resources:Resource, sip_lowest %>"></asp:Label></td>
                                        <td>Q1(25%)</td>
                                        <td><asp:Label ID="Label30" runat="server" Text="<%$ Resources:Resource, sip_med %>"></asp:Label></td>
                                        <td>Q3(75%)</td>
                                        <td><asp:Label ID="Label31" runat="server" Text="<%$ Resources:Resource, sip_highest %>"></asp:Label></td>
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
                <%--<Series>                  
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
                            <td><asp:Label ID="Label17" runat="server" Text="<%$ Resources:Resource, sip_desc_stats %>"></asp:Label></td>
                            <td>
                                <table style="border: black 1px;">
                                    <tr>
                                        <td><asp:Label ID="Label24" runat="server" Text="<%$ Resources:Resource, sip_lowest %>"></asp:Label></td>
                                        <td>Q1(25%)</td>
                                        <td><asp:Label ID="Label26" runat="server" Text="<%$ Resources:Resource, sip_med %>"></asp:Label></td>
                                        <td>Q3(75%)</td>
                                        <td><asp:Label ID="Label27" runat="server" Text="<%$ Resources:Resource, sip_highest %>"></asp:Label></td>
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
                <%--<Series>                                     
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
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource, sip_desc_stats %>"></asp:Label></td>
                            <td>
                                <table style="border: black 1px;">
                                    <tr>
                                        <td><asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource, sip_lowest %>"></asp:Label></td>
                                        <td>Q1(25%)</td>
                                        <td><asp:Label ID="Label15" runat="server" Text="<%$ Resources:Resource, sip_med %>"></asp:Label></td>
                                        <td>Q3(75%)</td>
                                        <td><asp:Label ID="Label16" runat="server" Text="<%$ Resources:Resource, sip_highest %>"></asp:Label></td>
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
             

           
             <asp:Panel ID="piePanel" runat="server" Visible="false" style="text-align:center;">
             <hr />

             <asp:Label ID="Label6" runat="server" text="<%$ Resources:Resource, sip_final_score_ratio %>" 
           style="color:Blue; font-family: 'Times New Roman', Times, serif;font-size:13pt;"/><br />

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
