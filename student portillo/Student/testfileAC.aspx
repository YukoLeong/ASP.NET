<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testfileAC.aspx.vb" Inherits="Student_testfileAC" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            /*width: 100%;*/
            text-align:center;
            width:728px;
        }
        #ImageButton2{
            width:150px;
            height:55px;
        }
        .aimg{
            width:75px;
        }
        .aimgactive{
            width:130px;
        }

        
        /*animatemenu*/

		#main-nav-wrapper{			
			overflow:hidden;
			margin-left: 10%;
		}

        .main-nav {
           position: absolute;
             /* bottom: 0;*/
			/*width:1024px;*/	
            width:650px;		
			height: 100px;
            padding: 0;
            text-align: right;
			margin-left: auto;
            margin-right: auto;
			margin: 0;
            font-size: 0;
            /*margin-top:-184px;*/
            /*z-index:-1;*/
            top:10px;
            
        }

        .main-nav-list {
            display: inline-block;
            padding: 0;
            list-style: none;
        }

            .main-nav-list li {
                display: inline-block;
                margin: 0;
                padding: 0;
                min-width: 50px;
                min-height: 50px;

				/*margin-top: 80px;*/
            }

                .main-nav-list li.apic1color {
                    background-color: #a8218e;
                }

                .main-nav-list li.apic2color {
                    background-color: #00a7ef;
                }

                .main-nav-list li.apic3color {
                    background-color: #ffa200;
                }

                .main-nav-list li.apic4color {
                    background-color: #9ae900;
                }

                .main-nav-list li.apic5color {
                    background-color: #ff2200;
                }

                .main-nav-list li.apic6color {
                    background-color: #ffd600;
                }

                .main-nav-list li.apic7color {
                    background-color: #00989a;
                }

                .main-nav-list li.apic8color {
                    background-color: #00cb79;
                }

                .main-nav-list li .aimg {
                    display: inline-block;
                    cursor: pointer;
                    margin: 0;
                    padding: 0;
                }

                /*animatemenu close*/


        .style4
        {
            width: 100%;
        }


    </style>


      <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />

    
        <%--animemenu js--%>

    <script src="animatedmenu3/jquery-2.1.1.js"></script>
     <%--<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
    <%--<script src="animatedmenu3/jquery.resizeOnApproach.1.0.min.js"></script>--%>

        <script>
            $(document).ready(function () {

                $('.main-nav-list .aimg').resizeOnApproach({
                    elementDefault: 75,
                    elementClosest: 130,
                    triggerDistance: 100
                });


                $('.main-nav-list .aimgactive').resizeOnApproach({
                    elementDefault: 110,
                    elementClosest: 110,
                    triggerDistance: 100
                });


                $('.main-nav-list .nocolorimg').resizeOnApproach({
                    elementDefault: 150,
                    elementClosest: 150,
                    triggerDistance: 100
                });

            });
           
          
    </script>

    <%--animemenu js close--%>





</head>
<body background="images/cv_background.gif">
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" border="0" width="760" align="center">
          
        
    <tr>
<td>
    
 <br />
<%--       <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Back</asp:LinkButton>--%>
    
       <%-- <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1005px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" /></div>--%>
       
    <br />
        <br />
    <div style="text-align:center;margin-top:-44px;padding-bottom:12px;width:736px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" />


                     <%--animemenu--%>

  <div id="main-nav-wrapper">
            <nav class="main-nav">
                <ul class="main-nav-list">

                    <li class="apic9color">
                        <img src="animatedmenu3/nocolor.png" alt="" title="" class="nocolorimg" />
                        <%--<asp:ImageButton ID="ImageButtonapic9" runat="server" ImageUrl="~/Student/animatedmenu3/nocolor.png" CssClass="nocolorimg"/>--%>
                    </li>

                    <li class="apic8color">
                        <asp:ImageButton ID="ImageButtonapic8" runat="server" ImageUrl="~/Student/animatedmenu3/bpic9.png" CssClass="aimg"/>
                    </li>


                    <li class="apic1color">
                        <%--<img src="animatedmenu3/apic1.png" alt="Evolution and inheritance" title="Evolution and inheritance" />--%>
                        <asp:ImageButton ID="ImageButtonapic1" runat="server" ImageUrl="~/Student/animatedmenu3/fpic1.png" CssClass="aimgactive" />
                    </li>

                    <li class="apic2color">
                        <asp:ImageButton ID="ImageButtonapic2" runat="server" ImageUrl="~/Student/animatedmenu3/fpic2.png" CssClass="aimg" />
                    </li>

                    
                </ul>
            </nav>
    </div>

    <%--animemenu close--%>

    <br /><br /><br /><br />



    </div>
        <br />

          <asp:SqlDataSource ID="SqlDataSource20" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [Intership] WHERE ([pess_cod] = @pess_cod)">
            <SelectParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource23" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [StudentWorks] WHERE ([pess_cod] = @pess_cod)">
            <SelectParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource24" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [Seminar] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [CommAct] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource25" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [PersonalDetail] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource26" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [Reference] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource28" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [StudentPic] WHERE ([PESS_COD] = @PESS_COD)">
            <SelectParameters>
                <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
    </asp:SqlDataSource>
        <br />

    
     <asp:SqlDataSource ID="SqlDataSource17" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [ProfessionalCert] WHERE ([pess_cod] = @pess_cod)">
            <SelectParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource21" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [StudyTA] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource19" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [MatchRecord] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource18" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [AwardRecord] WHERE ([pess_cod] = @pess_cod)">
        <SelectParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>


             <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT [SCHOOL_EN] FROM [student_academic_info] WHERE ([ALUN_NUMERO] = @ALUN_NUMERO AND [ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ)">
            <SelectParameters>
              <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" Type="String" />
              <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource16" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT [PROGRAM_EN] FROM [student_academic_info] WHERE ([ALUN_NUMERO] = @ALUN_NUMERO AND [ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ)">
            <SelectParameters>
                  <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" Type="String" />
                  <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>

    
        
    
    <table class="style1">

            <tr>
                <td>
                    <asp:Button ID="verEn" runat="server" CssClass="blue" Text="English Version" Width="170px" />
                </td>
                <td>
                    <asp:Button ID="verCht" runat="server" CssClass="blue" 
                        Text="中文" Width="170px"/>
                </td>
              
            </tr>
        </table>


    



        <br />
        <asp:ObjectDataSource ID="ObjectDataSource15" runat="server" 
            DeleteMethod="Delete" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetSeminarInfoDataBy" 
            TypeName="EPDataSetTableAdapters.Seminar_InfoTableAdapter">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                  <asp:SessionParameter Name="x" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="671px" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="729px" 
            ShowFindControls="False" ShowExportControls="False">
            <LocalReport ReportPath="Student\ActCVTest.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet2" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DataSet3" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="DataSet4" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" Name="DataSet5" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" Name="DataSet6" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="DataSet7" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource8" Name="DataSet8" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource9" Name="DataSet9" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource10" Name="DataSet10" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource11" Name="DataSet11" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource12" Name="DataSet12" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource13" Name="DataSet13" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource14" Name="DataSet14" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource15" Name="DataSet15" />
                </DataSources>
						
            </LocalReport>

        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource14" runat="server" 
            DeleteMethod="Delete" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetReferenceInfomationBy" 
            TypeName="EPDataSetTableAdapters.ReferenceTableAdapter">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" 
            DeleteMethod="Delete" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetPersonalDetailDataBy" 
            TypeName="EPDataSetTableAdapters.PersonalDetailTableAdapter" 
            InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="TechnicalSkill" Type="String" />
                <asp:Parameter Name="SocialSkill" Type="String" />
                <asp:Parameter Name="Language" Type="String" />
                <asp:Parameter Name="Interest" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="TechnicalSkill" Type="String" />
                <asp:Parameter Name="SocialSkill" Type="String" />
                <asp:Parameter Name="Language" Type="String" />
                <asp:Parameter Name="Interest" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetSeminarInfoDataBy" 
            TypeName="EPDataSetTableAdapters.Seminar_InfoTableAdapter" 
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="topicName" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="startDate" Type="DateTime" />
                <asp:Parameter Name="duration" Type="Int32" />
                <asp:Parameter Name="organizer" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="topicName" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="startDate" Type="DateTime" />
                <asp:Parameter Name="duration" Type="Int32" />
                <asp:Parameter Name="organizer" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" 
            DeleteMethod="Delete" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCommActDataBy" 
            TypeName="EPDataSetTableAdapters.CommActTableAdapter" 
        InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="actName" Type="String" />
                <asp:Parameter Name="actType" Type="String" />
                <asp:Parameter Name="orgName" Type="String" />
                <asp:Parameter Name="startDate" Type="DateTime" />
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="path" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="actName" Type="String" />
                <asp:Parameter Name="actType" Type="String" />
                <asp:Parameter Name="orgName" Type="String" />
                <asp:Parameter Name="startDate" Type="DateTime" />
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="path" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetStudentPicDataBy" 
            TypeName="EPDataSetTableAdapters.StudentPicTableAdapter" 
            DeleteMethod="Delete">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" 
            DeleteMethod="Delete" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetStudentTADataBy" 
            TypeName="EPDataSetTableAdapters.StudyTATableAdapter">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" 
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" 
            DeleteMethod="Delete" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetMatchDataBy" 
            TypeName="EPDataSetTableAdapters.MatchRecordTableAdapter" 
        InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="matchName" Type="String" />
                <asp:Parameter Name="dateMatch" Type="DateTime" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="position" Type="Decimal" />
                <asp:Parameter Name="description" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" 
                    Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="matchName" Type="String" />
                <asp:Parameter Name="dateMatch" Type="DateTime" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="position" Type="Decimal" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetEducationDataBy" 
            TypeName="EPDataSetTableAdapters.education_infoTableAdapter" 
            DeleteMethod="Delete" InsertMethod="Insert">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PESS_COD" Type="Decimal" />
                <asp:Parameter Name="ALUN_NUMERO" Type="String" />
                <asp:Parameter Name="ALUN_NUMERO_SEQ" Type="Decimal" />
                <asp:Parameter Name="COD" Type="String" />
                <asp:Parameter Name="START_YEAR" Type="String" />
                <asp:Parameter Name="END_YEAR" Type="String" />
                <asp:Parameter Name="LEVEL_CH" Type="String" />
                <asp:Parameter Name="LEVEL_PT" Type="String" />
                <asp:Parameter Name="LEVEL_EN" Type="String" />
                <asp:Parameter Name="SCHOOL_CH" Type="String" />
                <asp:Parameter Name="SCHOOL_PT" Type="String" />
                <asp:Parameter Name="SCHOOL_EN" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" 
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAwardDataBy" 
            TypeName="EPDataSetTableAdapters.AwardRecordTableAdapter" 
            DeleteMethod="Delete">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" 
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetInternshipDataBy" 
            TypeName="EPDataSetTableAdapters.IntershipTableAdapter" 
            DeleteMethod="Delete">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" 
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetCertDataBy" 
            TypeName="EPDataSetTableAdapters.ProfessionalCertTableAdapter" 
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="certName" Type="String" />
                <asp:Parameter Name="courseName" Type="String" />
                <asp:Parameter Name="courseType" Type="String" />
                <asp:Parameter Name="duration" Type="Double" />
                <asp:Parameter Name="organizer" Type="String" />
                <asp:Parameter Name="certDate" Type="DateTime" />
                <asp:Parameter Name="endDate" Type="DateTime" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="path" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" 
                    Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="certName" Type="String" />
                <asp:Parameter Name="courseName" Type="String" />
                <asp:Parameter Name="courseType" Type="String" />
                <asp:Parameter Name="duration" Type="Double" />
                <asp:Parameter Name="organizer" Type="String" />
                <asp:Parameter Name="certDate" Type="DateTime" />
                <asp:Parameter Name="endDate" Type="DateTime" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="path" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetStudentWorkDataBy" 
            TypeName="EPDataSetTableAdapters.StudentWorksTableAdapter" 
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="start_year" Type="DateTime" />
                <asp:Parameter Name="end_year" Type="DateTime" />
                <asp:Parameter Name="job" Type="String" />
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="city" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" 
                    Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="start_year" Type="DateTime" />
                <asp:Parameter Name="end_year" Type="DateTime" />
                <asp:Parameter Name="job" Type="String" />
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
      <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td>
                      </td>
                    <td>
                          <input type="button" onclick="$find('ReportViewer1').exportReport('PDF');" value="Export to PDF" class="blue" /></td>
                        </td>
                    <td>
                        <input type="button" onclick="$find('ReportViewer1').exportReport('Word');" value="Export to Word" class="blue" />
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Button ID="Button1" runat="server" Text="Upload Photo" CssClass="blue" 
                            style="margin-right:111px"/>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" 
                            Visible="False"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
           </table>
          </table>
     
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetStudentDataBy" 
            TypeName="EPDataSetTableAdapters.student_academic_infoTableAdapter" 
            InsertMethod="Insert">
            <InsertParameters>
                <asp:Parameter Name="ALUN_NUMERO" Type="String" />
                <asp:Parameter Name="ALUN_NUMERO_SEQ" Type="Decimal" />
                <asp:Parameter Name="NETID" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
              
                <asp:Parameter Name="ID_NO" Type="String" />
                <asp:Parameter Name="NAME_CH" Type="String" />
                <asp:Parameter Name="NAME_PT" Type="String" />
                <asp:Parameter Name="PRIMARY_EMAIL" Type="String" />
                <asp:Parameter Name="SECONDARY_EMAIL" Type="String" />
                <asp:Parameter Name="STATUS_CODE" Type="String" />
                <asp:Parameter Name="STUDENT_STATUS_CH" Type="String" />
                <asp:Parameter Name="STUDENT_STATUS_PT" Type="String" />
                <asp:Parameter Name="STUDENT_STATUS_EN" Type="String" />
                <asp:Parameter Name="SCHOOL_CODE" Type="String" />
                <asp:Parameter Name="SCHOOL_CH" Type="String" />
                <asp:Parameter Name="SCHOOL_PT" Type="String" />
                <asp:Parameter Name="SCHOOL_EN" Type="String" />
                <asp:Parameter Name="PROGRAM_COMPOSITE_CODE" Type="String" />
                <asp:Parameter Name="PROGRAM_COMPOSITE_CH" Type="String" />
                <asp:Parameter Name="PROGRAM_COMPOSITE_PT" Type="String" />
                <asp:Parameter Name="PROGRAM_COMPOSITE_EN" Type="String" />
                <asp:Parameter Name="PROGRAM_CODE" Type="String" />
                <asp:Parameter Name="PROGRAM_CH" Type="String" />
                <asp:Parameter Name="PROGRAM_PT" Type="String" />
                <asp:Parameter Name="PROGRAM_EN" Type="String" />
                <asp:Parameter Name="SECTION_CODE" Type="String" />
                <asp:Parameter Name="SECTION_CH" Type="String" />
                <asp:Parameter Name="SECTION_PT" Type="String" />
                <asp:Parameter Name="SECTION_EN" Type="String" />
                <asp:Parameter Name="LANGUAGE_CODE" Type="String" />
                <asp:Parameter Name="LANGUAGE_CH" Type="String" />
                <asp:Parameter Name="LANGUAGE_PT" Type="String" />
                <asp:Parameter Name="LANGUAGE_EN" Type="String" />
                <asp:Parameter Name="QUALIFIED_YEAR" Type="String" />
                <asp:Parameter Name="GPA" Type="String" />
                <asp:Parameter Name="CREDIT" Type="String" />
                <asp:Parameter Name="CREATION_DATE" Type="DateTime" />
                <asp:Parameter Name="card_snr" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="ALUN_NUMERO" 
                    Type="String" />
                <asp:SessionParameter Name="y" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetPersonDataBy" 
            TypeName="EPDataSetTableAdapters.personal_infoTableAdapter" 
            DeleteMethod="Delete" InsertMethod="Insert">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PESS_COD" Type="Decimal" />
                <asp:Parameter Name="ALUN_NUMERO" Type="String" />
                <asp:Parameter Name="ALUN_NUMERO_SEQ" Type="Decimal" />
                <asp:Parameter Name="NAME_CH" Type="String" />
                <asp:Parameter Name="NAME_PT" Type="String" />
                <asp:Parameter Name="SEX" Type="String" />
                <asp:Parameter Name="ID_CARD_NUM" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="ADDRESS_CH" Type="String" />
                <asp:Parameter Name="ADDRESS_PT" Type="String" />
                <asp:Parameter Name="MOBILE_NUM" Type="String" />
                <asp:Parameter Name="MO_ADDRESS_CH" Type="String" />
                <asp:Parameter Name="MO_ADDRESS_PT" Type="String" />
                <asp:Parameter Name="HOSTEL_CH" Type="String" />
                <asp:Parameter Name="HOSTEL_PT" Type="String" />
                <asp:Parameter Name="GPA" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="pess_cod" 
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:SqlDataSource ID="SqlDataSource27" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT [path] FROM [StudentPic] where pess_cod=@pess_cod and path is not NULL">
            <SelectParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [StudentPic]" 
            DeleteCommand="DELETE FROM [StudentPic] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [StudentPic] ([pess_cod], [STUDENT_ID], [path]) VALUES (@pess_cod, @STUDENT_ID, @path)" 
            UpdateCommand="UPDATE [StudentPic] SET [pess_cod] = @pess_cod, [STUDENT_ID] = @STUDENT_ID, [path] = @path WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
        
                <asp:Parameter Name="path" Type="String" />
            </InsertParameters>
            <UpdateParameters>
               
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
               
                <asp:Parameter Name="path" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="position" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    

 
   
    </form>
</body>
</html>
