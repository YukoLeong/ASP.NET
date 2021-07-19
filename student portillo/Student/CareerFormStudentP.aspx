<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CareerFormStudentP.aspx.cs" Inherits="Student_CareerFormStudentP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>	  
    <style>
		table, th, td{
			background-color: #FFFFFF;			
			border: 1px solid  #E6E6E6;
		}
		
        a{
            text-decoration:none
        }
		
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1024px" CellPadding="6" OnSelectedIndexChanged ="OnSelectedIndexChanged" GridLines="None" CellSpacing="-1" > 
                <Columns>
                    <asp:TemplateField HeaderText="Posting Date" SortExpression="tss">
                        <ItemTemplate>
                            <asp:Label ID="tss" runat="server" Text='<%#Eval("tss")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<%--                
<Columns>
                    <asp:TemplateField HeaderText="Subject" SortExpression="Career">
                        <ItemTemplate>
                            <asp:Label ID="Career" runat="server" Text='<%#Eval("Career")%>' />
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>--%>

                <Columns>
                    <asp:TemplateField HeaderText="Subject" SortExpression="Career">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Career")%>' CommandName="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>




                <Columns>
                    <asp:TemplateField HeaderText="Views" SortExpression="Views">
                        <ItemTemplate>
                            <asp:Label ID="Views" runat="server" Text='<%#Eval("Views")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<%-- <Columns>
                    <asp:ButtonField runat="server" Text='<%#Eval("Career")%>' CommandName="Select" />
                </Columns>--%>
                


                <Columns>
                    <asp:TemplateField HeaderText="CareerFormID" SortExpression="CareerFormID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="CareerFormID" runat="server" Text='<%#Eval("CareerFormID")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>


                

            </asp:GridView>

        </div>
    </form>
</body>
</html>
