<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdviserAssistant.aspx.cs" Inherits="Instructor_AdviserAssistant" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <title>Advisory Assistant</title>
     <link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css" />
     <link rel="stylesheet" type="text/css" href="../resources/syntax/shCore.css" />
     <link rel="stylesheet" type="text/css" href="../resources/demo.css" />
     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
     <script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
     <script type="text/javascript" language="javascript" src="../resources/syntax/shCore.js"></script>
     <script type="text/javascript" language="javascript" src="../resources/demo.js"></script>
	 <script language="javascript">
	 function subMit(obj,el){   
     var e=el || window.event;    
     var curKey=e.which || e.keyCode;      
    if(curKey==13 && obj.value!="")   {   
    window.event.keyCode=9;
    e.preventDefault();   }
           }
   
        </script >
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
    </style>
    <script type="text/javascript">
        $(document).ready(function () {		  
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
                stateSave: true
            });
		
			
            
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
                // alert(table.cell('.selected', 0).data());
                if (table.cell('.selected', 0).data() != null) {
                 //   $("#id_txt").val(table.cell('.selected', 0).data());
                    //var id = "<%= viewButton.ClientID%>";
                    //$('#' + id).click();
                   // window.open('../Student/schoolStaff.aspx', '_blank');
				    var sid = table.cell('.selected', 0).data();
					var stdName = table.cell('.selected', 1).data();
                    var alu_num = table.cell('.selected', 4).data().toString();
                    var aluseq = table.cell('.selected', 5).data().toString();
					var pess_cod = table.cell('.selected', 6).data().toString();
					
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
                // table.row('.selected').remove().draw(false);
            });



            $('#adviseButton').click(function () {
                // alert(table.cell('.selected', 0).data());
                if (table.cell('.selected', 0).data() != null) {
                    $("#id_txt").val(table.cell('.selected', 0).data());

                    // var id = "<%= adviseButton.ClientID%>";
                    // $('#' + id).click();

                }
                // table.row('.selected').remove().draw(false);
            });

        });
			
    </script>
</head>
<body background="../images/bg-blue.jpg">
    <form id="form1" runat="server" defaultbutton="searchButton" >
	<asp:ScriptManager EnablePageMethods="true" ID="MainSM" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
    <div id="wrapper">
    <div id="content">
	</br>
       <label style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';">   
	 <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, sip_aa_title%>" ></asp:Label>
	 </label>
     <div align="center" >
               <asp:ImageButton width="130px" height="45px" ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" OnClick="btn_home_Click" CausesValidation="False" /> 
      </div>
	  
     <p style="color:Black; font-family: Times New Roman, Times, serif;font-size:13pt;"><asp:Label ID="lb_txt_objective" runat="server" Text="<%$ Resources:Resource, sip_aa_objective%>"></asp:Label></p>
       
    <table  cellspacing="1" cellpadding="2" width="100%" style="border:solid #CCC 1px;border-radius:5px;text-align:left;">
    <tr >
    <td align="right"><asp:Label ID="txt_stdID" Text="<%$ Resources:Resource, sip_aa_filter%>" runat="server"/></td>
    <td align="left">
        
        <asp:RadioButton ID="rb_Gpa_Default" runat="server" Checked="True" GroupName="gpa"
             Text="<%$ Resources:Resource, sip_aa_below%>" AutoPostBack="True" OnCheckedChanged="rb_Gpa_Default_CheckedChanged"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          
        <asp:RadioButton ID="rb_Fail_Default" runat="server"  Checked="True" GroupName="fail"
            Text="<%$ Resources:Resource, sip_aa_subjects%>" AutoPostBack="True" OnCheckedChanged="rb_Fail_Default_CheckedChanged" />
      
    </td>
   
    </tr>
        <tr>
            <td align="right">&nbsp;
                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, sip_aa_specifiedgpa%>"></asp:Label>
            </td>
            <td rowspan="2" colspan="4">
                <table width="100%" cellspacing="0" cellpadding="0">
				<tr>
				<td><asp:RadioButton ID="rb_Gpa_Below" Text="<%$ Resources:Resource, sip_aa_bw%>" runat="server" GroupName="gpa"  OnCheckedChanged="rb_Gpa_Below_CheckedChanged" AutoPostBack="True" /></td>
				<td>
					<asp:TextBox ID="tb_Gpa_Below" runat="server" Width="108px" Enabled="false"  ></asp:TextBox></td>
				<td><asp:RangeValidator ID="gpaRange" runat="server" ErrorMessage="Range[0-4.0]" MaximumValue="4.1" MinimumValue="0" ControlToValidate="tb_Gpa_Below" Type="Double"></asp:RangeValidator>
			</td>
		  <td>
		   <asp:RadioButton ID="rb_Gpa_Above" Text="<%$ Resources:Resource, sip_aa_av%>" runat="server" GroupName="gpa" OnCheckedChanged="rb_Gpa_Above_CheckedChanged" AutoPostBack="True"/></td>
		   <td>
			<asp:TextBox ID="tb_Gpa_Above" runat="server" Width="108px" Enabled="false" ></asp:TextBox></td>
			<td><asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Range[0-4.0]" MaximumValue="4.1" MinimumValue="0" ControlToValidate="tb_Gpa_Above" Type="Double"></asp:RangeValidator>
             </td>
			 </tr>
			 <tr>
			 
			<td> 			 
                <asp:RadioButton ID="rb_Gpa_Range" Text="<%$ Resources:Resource, sip_aa_ag%>" runat="server" GroupName="gpa" OnCheckedChanged="rb_Gpa_Range_CheckedChanged" AutoPostBack="True"/></td>
				<td>
				 <asp:TextBox ID="tb_Gpa_From" runat="server"  Width="108px" Enabled="false" ></asp:TextBox> </td>
				 <td>
				<asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Range[0-4.0]" MaximumValue="4.1" MinimumValue="0" ControlToValidate="tb_Gpa_From" Type="Double"></asp:RangeValidator> 
				</td>
<td style="text-align:right;"><asp:Label ID="lb_to" runat="server" Text="<%$ Resources:Resource, sip_aa_to%>"></asp:Label></td>
				  <td><asp:TextBox ID="tb_Gpa_To" runat="server" Width="108px"  Enabled="false" ></asp:TextBox></td>
				  <td>
				  <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="Range[0-4.0]" MaximumValue="4.1" MinimumValue="0" ControlToValidate="tb_Gpa_To" Type="Double"></asp:RangeValidator>
				</td>
			
		 </tr>
		 <tr>
			<td>
			<asp:RadioButton ID="rb_Fail_Below" Text="<%$ Resources:Resource, sip_aa_bw%>" runat="server" GroupName="fail" OnCheckedChanged="rb_Fail_Below_CheckedChanged" AutoPostBack="True"/>
			</td>
			<td>
               <asp:TextBox ID="tb_Fail_Below" runat="server"   Width="108px" Enabled="false" ></asp:TextBox></td>
			   <td>
			   <asp:RangeValidator ID="failRang" runat="server" ErrorMessage="Range[0-50]" MaximumValue="50" MinimumValue="0" ControlToValidate="tb_Fail_Below" Type="Integer"></asp:RangeValidator>
                 </td>
				 <td>
				 <asp:RadioButton ID="rb_Fail_Above" Text="<%$ Resources:Resource, sip_aa_av%>" runat="server" GroupName="fail" OnCheckedChanged="rb_Fail_Above_CheckedChanged" AutoPostBack="True"/>
				 </td>
				 <td>
             <asp:TextBox ID="tb_Fail_Above" runat="server"  Width="108px" Enabled="false" ></asp:TextBox></td>
			 <td>
			 
			 <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="Range[0-50]" MaximumValue="50" MinimumValue="0" ControlToValidate="tb_Fail_Above" Type="Integer"></asp:RangeValidator>
                </td>
				<tr>
                <td>
                <asp:RadioButton ID="rb_Fail_Range" Text="<%$ Resources:Resource, sip_aa_ag%>" runat="server" GroupName="fail" OnCheckedChanged="rb_Fail_Range_CheckedChanged" AutoPostBack="True"/>
                </td>
				<td>
				<asp:TextBox ID="tb_Fail_From" runat="server"  Width="108px" Enabled="false"></asp:TextBox>
				</td> 
				<td><asp:RangeValidator ID="RangeValidator5" runat="server" ErrorMessage="Range[0-50]" MaximumValue="50" MinimumValue="0" ControlToValidate="tb_Fail_From" Type="Integer"></asp:RangeValidator>
<td style="text-align:right;"><asp:Label ID="lb_tto" runat="server" Text="<%$ Resources:Resource, sip_aa_to%>"></asp:Label></td>
				<td>
              <asp:TextBox ID="tb_Fail_To" runat="server"  Width="108px" Enabled="false" ></asp:TextBox>
			  </td>
			  <td>
			  <asp:RangeValidator ID="RangeValidator6" runat="server" ErrorMessage="Range[0-50]" MaximumValue="50" MinimumValue="0" ControlToValidate="tb_Fail_To" Type="Integer"></asp:RangeValidator>
				</td>
				</tr>
		 </table>
		 
		 
         </td>
		 
        </tr>
        <tr>
             <td align="right">
                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, sip_aa_specifiedsub%>"></asp:Label>
            </td>
           
        </tr>
    <tr>
    <td align="right">&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, sip_aa_school%>"></asp:Label></td>
    <td>
        <asp:TextBox ID="tbProgram" runat="server" Enabled="false" Width="460px" ></asp:TextBox>
    </td>
     </tr>
     <tr>
     <td align="right"><asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, sip_aa_Program%>"></asp:Label><span style="color:red;">*</span></td>
    <td>
        <asp:DropDownList ID="programList" runat="server"  AutoPostBack="true" Width="700px" OnSelectedIndexChanged="cursoList_SelectedIndexChanged">
		   <asp:ListItem Value="" Text="<%$ Resources:Resource, sip_pls_select2 %>"></asp:ListItem>
		</asp:DropDownList>
    </td>
     </tr>
     <tr>
    <td align="right"><asp:Label ID="Label19" runat="server" Text="<%$ Resources:Resource, sip_aa_ay%>"></asp:Label><span style="color:red;">*</span>
          </td>
          <td>
        <asp:DropDownList ID="yearListBox" runat="server" 
            style="width:180px;" >
			    <asp:ListItem Value="" Text="<%$ Resources:Resource, sip_pls_select2 %>"></asp:ListItem>
        </asp:DropDownList>
           
         <asp:RequiredFieldValidator ID="req_message" ControlToValidate="yearListBox" ErrorMessage="Academic Year is required！"
                        runat="server" style="color:Red;"  />
        </td>
		      
         <tr>
             <td align="right">
                <asp:Label ID="lblSemester" runat="server" Text="<%$ Resources:Resource, sip_aa_Semester%>"></asp:Label>
             </td>
			
             <td>
                    <asp:RadioButton ID="OneRadioBtn" Text="1" runat="server" GroupName="semester" checked="true"/>
                    <asp:RadioButton ID="TwoRadioBtn" Text="2" runat="server" GroupName="semester"/>
             </td>
             
        </tr>
             
        </table><table>
         <tr> 
		  
				<td><p style="color:Black; font-family: 'Times New Roman', Times, serif;">
				&nbsp;<asp:Label ID="lb_ps" runat="server" Text="<%$ Resources:Resource, sip_aa_ps%>"></asp:Label>
                                                            &quot;
				<span style="color:Red;"><asp:Label ID="lbsubject" runat="server" Text="<%$ Resources:Resource, sip_aa_pr%>"></asp:Label></span> 
				<asp:Label ID="lband" runat="server" Text="<%$ Resources:Resource, sip_aa_and%>"></asp:Label><span style="color:Red;">
				<asp:Label ID="lbyear" runat="server" Text="<%$ Resources:Resource, sip_aa_year%>"></asp:Label></span>
				&quot; , <asp:Label ID="lbbutton" runat="server" Text="<%$ Resources:Resource, sip_aa_button%>"></asp:Label></p>   </td>
		        <td align="right">
		    <asp:ImageButton ID="searchButton" runat="server" Text="Search"  style="width: 100px" 
			onmouseover="this.src='../images/search2.png'"
			onmouseout="this.src='../images/search1.png'" ImageUrl="../images/search1.png"  
			OnClick="btn_Search_Click"/>
		
				</td>
          </tr>      
       </table>
     
 <div>
           <table>
		 <tr> 
		 <td>  
		 <asp:Panel ID="dataPanel" runat="server" Visible="false">
		   <p style="color:Black; font-family: 'Times New Roman', Times, serif;">
	       &nbsp;<asp:Label ID="lbuse" runat="server" Text="<%$ Resources:Resource, sip_aa_use%>"></asp:Label> "<span style="color:red;">
		   <asp:Label ID="lbdetails" runat="server" Text="<%$ Resources:Resource, sip_aa_Details%>"></asp:Label></span>" <asp:Label ID="lbdor" runat="server" Text="<%$ Resources:Resource, sip_aa_or%>"></asp:Label>"<span style="color:red;">
		    <asp:Label ID="lbadvice" runat="server" Text="<%$ Resources:Resource, sip_aa_advice%>"></asp:Label></span>"  <asp:Label ID="lbfunction" runat="server" Text="<%$ Resources:Resource, sip_aa_function%>"></asp:Label></p>
             
		 </td>
		 <td><div id="func_panel" style="display:none;">
            <asp:ImageButton ID="viewButton" runat="server" Text="Details" OnClick="view_Button_Click"  onmouseover="this.src='../images/detail2.png'" 
			onmouseout="this.src='../images/detail1.png'" ImageUrl="../images/detail1.png" Style="width: 100px" />
            <asp:ImageButton ID="adviseButton" runat="server" Text="Advice" style="width: 100px" onclick="advise_Button_Click"  onmouseover="this.src='../images/advice2.png'" 
			onmouseout="this.src='../images/advice1.png'" ImageUrl="../images/advice1.png"/>
               
            <asp:Label ID="showMes" runat="server"  ForeColor="Red" Text="Label" Visible="false"></asp:Label>
            <asp:TextBox ID="id_txt" runat="server" Style="display: none;" />
			</div>
		 </td>
		
		 </tr>
		 </table>   
                     
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
                            GPA
                        </th>
                        <th>
                            FAIL
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
                            GPA
                        </th>
                        <th>
                        FAIL
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
            <br />
        </div>
          <asp:Label ID="noDataMsg" runat="server" Text="No record found!" 
            Visible="False" Font-Size="X-Large" ForeColor="Red"></asp:Label>
    </div>
    </div>
    </form>
</body>
</html>
