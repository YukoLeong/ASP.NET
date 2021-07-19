<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" ClientTarget="uplevel" Inherits="Student_Default" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 209px;
        }
    </style>
      <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="../images/message_board_background.gif">
    <form id="form1" runat="server">
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="671px" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="729px">
            <LocalReport ReportPath="Student\Report1.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet2" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet3" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet4" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet5" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet6" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAwardRecordDataBy" 
            TypeName="ep.EPDataSetTableAdapters.AwardRecordTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="awardName" Type="String" />
                <asp:Parameter Name="dateAward" Type="DateTime" />
                <asp:Parameter Name="organizer" Type="String" />
                <asp:Parameter Name="description" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="PESS_COD" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetIntershipDataBy" 
            TypeName="ep.EPDataSetTableAdapters.IntershipTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="jobTitle" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="startDate" Type="DateTime" />
                <asp:Parameter Name="endDate" Type="DateTime" />
                <asp:Parameter Name="duration" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="PESS_COD" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetProfessionalCertDataBy" 
            TypeName="ep.EPDataSetTableAdapters.ProfessionalCertTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="certName" Type="String" />
                <asp:Parameter Name="courseName" Type="String" />
                <asp:Parameter Name="courseType" Type="String" />
                <asp:Parameter Name="duration" Type="Double" />
                <asp:Parameter Name="organizer" Type="String" />
                <asp:Parameter Name="certDate" Type="DateTime" />
                <asp:Parameter Name="endDate" Type="DateTime" />
                <asp:Parameter Name="category" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="PESS_COD" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetStudentWorksDataBy" 
            TypeName="ep.EPDataSetTableAdapters.StudentWorksTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="pess_cod" Type="Decimal" />
                <asp:Parameter Name="topic" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="makePublic" Type="Boolean" />
                <asp:Parameter Name="getComment" Type="Boolean" />
                <asp:Parameter Name="askForComment" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="PESS_COD" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Panel ID="Panel1" runat="server" Height="116px">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Button ID="Button1" runat="server" Text="Upload Picture" CssClass="blue" />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetStudentAcademicInfoDataBy" 
            TypeName="ep.EPDataSetTableAdapters.student_academic_infoTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="ALUN_NUMERO" Type="String" />
                <asp:Parameter Name="ALUN_NUMERO_SEQ" Type="Decimal" />
                <asp:Parameter Name="PESS_COD" Type="Decimal" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
                <asp:Parameter Name="SCHOOL_CODE" Type="String" />
                <asp:Parameter Name="SCHOOL_CH" Type="String" />
                <asp:Parameter Name="SCHOOL_PT" Type="String" />
                <asp:Parameter Name="SCHOOL_EN" Type="String" />
                <asp:Parameter Name="PROGRAM_COMPOSITE_CODE" Type="String" />
                <asp:Parameter Name="PROGRAM_COMPOSITE_CH" Type="String" />
                <asp:Parameter Name="PROGRAM_COMPOSITE_PT" Type="String" />
                <asp:Parameter Name="PROGRAM_COMPOSITE_EN" Type="String" />
                <asp:Parameter Name="STUDENT_STATUS_CH" Type="String" />
                <asp:Parameter Name="STUDENT_STATUS_PT" Type="String" />
                <asp:Parameter Name="STUDENT_STATUS_EN" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="x" SessionField="PESS_COD" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetperDataBy" 
            TypeName="EPDataSetTableAdapters.personal_infoTableAdapter">
            <SelectParameters>
                <asp:Parameter DefaultValue="61140" Name="x" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>
    </form>
</body>
</html>
