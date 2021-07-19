<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherSubjects.aspx.cs" Inherits="Director_TeacherSubjects" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teaching Subjects</title>
    
    <link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css" />
    <link rel="stylesheet" type="text/css" href="../resources/syntax/shCore.css" />
    <link rel="stylesheet" type="text/css" href="../resources/demo.css" />
    <!--style type="text/css" class="init">

	</style-->
    <script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="../resources/syntax/shCore.js"></script>
    <script type="text/javascript" language="javascript" src="../resources/demo.js"></script>
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
    </style>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('#example').DataTable();

            $('#example tbody').on('click', 'tr', function () {
                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            });

            $("#example tfoot th").each(function (i) {
                var select = $('<select><option value=""></option></select>')
            .appendTo($(this).empty())
            .on('change', function () {
                var val = $(this).val();
                //alert(val);

                //table.column(i)
                //  .search(val ? '^' + $(this).val() + '$' : val, true, false)
                // .draw();

                table.column(i)
                    .search($(this).val())
                    .draw();

            });

                table.column(i).data().unique().sort().each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            });


            $('#viewButton').click(function () {
                // alert(table.cell('.selected', 0).data());
                if (table.cell('.selected', 0).data() != null) {
                    $("#id_txt").val(table.cell('.selected', 0).data());

                    //var id = "<%= viewButton.ClientID%>";
                   // $('#' + id).click();
					window.open('../Student/schoolStaff.aspx','_blank');  
                }
                // table.row('.selected').remove().draw(false);
            });



            $('#adviseButton').click(function () {
                // alert(table.cell('.selected', 0).data());
                if (table.cell('.selected', 0).data() != null) {
                    $("#id_txt").val(table.cell('.selected', 0).data());

                    var id = "<%= adviseButton.ClientID%>";
                    $('#' + id).click();

                }
                // table.row('.selected').remove().draw(false);
            });

        });
    </script>
</head>
<body background="../images/bg-blue.jpg">

    <form id="form1" runat="server">
    <asp:ScriptManager ID="smMain" runat="server" />
    <div id="wrapper">
    <div id="content">
        <br />
        <br />
        <asp:Label ID="Label1" ÏD="txt_title" runat="server" Text="Instructor Subjects" class="title"/>
        <br />
        <br />
       <asp:Label ID="txt_msg" runat="server" Text="Please select subject:" style="color:black;font-size:12pt;"/>
        <table>
            <tr>
                <td>
                    Subject Code:<span style="color:red;">*</span>
                </td>
                <td>
                    <asp:ListBox ID="subjectList" runat="server" 
                        OnSelectedIndexChanged="subjectList_SelectedIndexChanged" 
                        AutoPostBack="true" Height="84px" Width="190px">
                    </asp:ListBox>
                </td>
            </tr>
              <tr>
           <td>Subject Name:
           </td>
           <td><asp:TextBox ID="txt_subjectName" runat="server" Enabled="false" style="width:450px;" ></asp:TextBox></td>
           </tr>
        </table>
        <br />
        <br />
        <hr/>
        <div>
            <asp:Button ID="homeButton" runat="server" Text="Back" Style="width: 100px"  CssClass="blue"
                onclick="homeButton_Click" CausesValidation="false"/>
            <asp:Button ID="viewButton" runat="server" Text="View" OnClick="viewButtonClick" CssClass="blue"
                Style="width: 100px" />
            <asp:Button ID="adviseButton" runat="server" Text="Advice" Style="width: 100px"  CssClass="blue"
                onclick="adviseButton_Click" />
            <asp:TextBox ID="id_txt" runat="server" Style="display: none;" />

            <hr />
            <br />
            <br />
            <table id="example" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>
                            Student ID
                        </th>
                        <th style="width:200px;">
                            Student Name
                        </th>
                        <th>
                            Course Code
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
                            Course Code
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
                    </tr>
                </tfoot>
                <tbody>
                    <asp:Literal runat="server" ID="ltData"></asp:Literal>
                </tbody>
            </table>
            <br />
            <br />
        </div>

       <asp:Panel ID="linePanel" runat="server" Visible="false">
        <div style="text-align:left;">
        <table>
        <tr>
        <td>
        <hr />
           <asp:label ID="Label2" runat="server" Text="Course Work" style="color:blue;"> </asp:label>
           </td>
          
          </tr>
          <tr>
         <td>
            <asp:Chart ID="lineChart_classWork" runat="server" Width="933px" Height="300px" OnInit="lineChart_classwork_Init">
                <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="Description">
               </asp:Legend>
               </Legends>                            
                <Series>                                   
                     <asp:Series Name="Average Line"  ChartType="Line" Color="Tomato">
                    </asp:Series>
                     <asp:Series Name="Pass Line"  ChartType="Line" Color="Turquoise">
                    </asp:Series>
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
            <asp:Chart ID="columnChart_classWork" runat="server" Width="933px" Height="300px" >
                <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="Description">
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
               <asp:Label ID="Label3" runat="server" style="color:blue;" Text="Final Exam"> </asp:Label>
            </td>
            </tr>
             <tr>
            <td>
               <asp:Chart ID="lineChart_exam" runat="server" Width="933px" Height="300px" OnInit="lineChart_exam_Init">
                    <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="Description">
               </asp:Legend>
               </Legends>
                <Series>                  
                    <asp:Series Name="Average Line"  ChartType="Line" Color="Tomato">
                    </asp:Series>
                     <asp:Series Name="Pass Line"  ChartType="Line" Color="Turquoise">
                    </asp:Series>
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
               <asp:Chart ID="columnChart_exam" runat="server" Width="933px" Height="300px" >
                    <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="Description">
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
              <asp:label ID="Label4" runat="server" Text="Final Score" style="color:blue;"> </asp:label>
            </td>
           
          </tr>
          <tr>
          <td>
             <asp:Chart ID="lineChart_finalScore" runat="server" Width="933px" Height="300px" OnInit="lineChart_finalScore_Init">
                 <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="Description">
               
                 </asp:Legend>
               </Legends>                        
                <Series>
                                      
                     <asp:Series Name="Average Line"  ChartType="Line" Color="Tomato">
                    </asp:Series>
                     <asp:Series Name="Pass Line"  ChartType="Line" Color="Turquoise">
                    </asp:Series>
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
             <asp:Chart ID="columnChart_finalScore" runat="server" Width="933px" Height="300px" >
                 <Legends>
               <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Alignment="Center" BackImageAlignment="Right" Docking="Right" TitleAlignment="Near" Title="Description">
               
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
             </div>
             </asp:Panel>
<tr>
            
            <td>
           

           
             <asp:Panel ID="piePanel" runat="server" Visible="false">

              <hr />
              <asp:Label ID="Label6" runat="server" text="Final Score Pass Ratio:" 
           style="color:Blue; font-family: 'Times New Roman', Times, serif;font-size:13pt;"/><br />

              <asp:Label ID="Label5" runat="server"
                    text="Total Students:" />
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
          </td>
            </tr>
            </table>
           
     
        <br />
       
        <br />
        <br />
    </div>
    </div>
    </form>
</body>
</html>

