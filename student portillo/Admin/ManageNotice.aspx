<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageNotice.aspx.cs" Inherits="Admin_ManageNotice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Notice</title>   
    <script src="../Student/Scripts/jquery-1.10.2.min.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
    <script src="../ckeditor/adapters/jquery.js"></script>
    <link href="../style.css" rel="stylesheet" />
    <link  href="../button.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('textarea#editor1').ckeditor({
                toolbar :
                 [
					 { name: 'styles', items: ['Styles','Format','Font','FontSize']},
                     { name: 'basicstyles', items : [ 'Bold','Italic' ] },
                     { name: 'paragraph', items: ['NumberedList', 'BulletedList'] },
                     { name: 'links', items: ['Link'] }
                 ],
                height: '200',
                width: '100%'

            });

            $('textarea#txt_content').ckeditor({
                toolbar:
                 [
					 { name: 'styles', items: ['Styles','Format','Font','FontSize']},
                     { name: 'basicstyles', items: ['Bold', 'Italic'] },
                     { name: 'paragraph', items: ['NumberedList', 'BulletedList'] },
                     { name: 'links', items:['Link']}
                 ],
                height: '400',
                width: '600'

            });
        });
    </script>
    <style>
        body
        {
            margin-top:0;
            background: url(../images/bg-blue.jpg);
        }
        #wrapper1
        {
            width: 80%;
            min-height: 950px;
            margin-left: auto;
            margin-right: auto;
			margin-top: 0px;
        }
        
        #content1
        { 
            background-color:#fff;
            min-height:1024px;
            padding-left: 5px;
            padding-right: 5px;
            border-left:solid 1px #CCC;
            border-right:solid 1px #CCC;
        }
    </style>
    <script>
        function showPanel() {
            if ($("#postPanel").css('display') == 'none') {
                $("#postPanel").css('display', 'block');
            }
            else {
                $("#postPanel").css('display', 'none');
            }
        }

        function del(){
            var r = confirm("Are you sure?");
            if (r == true) {                
                PageMethods.btn_delete_Click($('#txt_id').val());
               
                window.location.replace('ManageNotice.aspx');
            
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"/>
        <div id="wrapper1">
            <div id="content1">
                <div style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';">Manage Notice</div>
                <br />
                  <input type="button" onclick="showPanel()" id="add_link" value="Add Notice" class="blue" style="display:none;"/>
                <br /><br />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                         <asp:TemplateField HeaderText="id" >
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Content" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Labe2" runat="server" Text='<%# Eval("notice") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("user_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Post Date">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("post_date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="isPost">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("ispost") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" Text="Edit"
                                    OnClick="lnkEdit_Click"
                                    runat="server"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                  <br /><br />
                <asp:Panel ID="editPanel" runat="server" Visible="false" style="border:solid #CCC 1px; width:80%;">
                <table>
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:TextBox ID="txt_id" runat="server" Enabled="false"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Content:</td>
                        <td>
                            <asp:TextBox ID="txt_content" runat="server" TextMode="MultiLine" Height="207px" Width="415px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Post User:</td>
                        <td>
                            <asp:TextBox ID="txt_postUser" runat="server" Enabled="false"></asp:TextBox></td>
                    </tr>
                     <tr>
                        <td>Post Date:</td>
                        <td>
                            <asp:TextBox ID="txt_postDate" runat="server" Enabled="false"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>isPost</td>
                        <td>
                            <asp:CheckBox ID="chkPost" runat="server" AutoPostBack="true" OnCheckedChanged="cleanPost"/></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btn_save" runat="server" Text="Save" CssClass="blue" OnClick="btn_save_Click" style="width:150px" />
                            <asp:Button ID="btn_pre_view2" runat="server" Text="Preview" CssClass="blue" OnClick="btn_preview2_Click" style="width:150px"/>
                            <asp:Button ID="btn_delete" runat="server" Text="Delete" CssClass="blue" OnClientClick="del();return false;" style="width:150px" />
                            <asp:Button ID="btn_canel" runat="server" Text="Canel" OnClick="btn_canel_Click" CssClass="blue" style="width:150px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
               </asp:Panel>

                 <label style="font-family: 'Berlin Sans FB';font-size:14pt;" id="lb_add_link">Add Notice</label>
                 <br />
              
                <asp:Panel ID="postPanel" runat="server" >
                <asp:TextBox runat="server" cols="80" ID="editor1" name="editor1" rows="10" TextMode="MultiLine"></asp:TextBox>

                <br />
                <asp:Button ID="btn_post" runat="server" Text="Post" CssClass="blue" OnClick="btn_post_Click" style="width:200px" />
                    <asp:Button ID="btn_preview" runat="server" Text="Preview" CssClass="blue" OnClick="btn_preview_Click" style="width:200px"/>
                    <asp:Button ID="btn_back" runat="server" Text="Back" CssClass="blue" OnClick="btn_back_Click" style="width:200px"/>
            </asp:Panel>

              

            </div>
        </div>
    </form>
</body>
</html>
