<%@ Page Language="C#" AutoEventWireup="true" CodeFile="responsive_table01p.aspx.cs" Inherits="responsive_table01p" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 14px;
        }

        #GridView1 td {
            padding: 10px;
        }

        #GridView1 th {
            padding: 10px;
        }

        /* 瀏覽器寬度少於760px 或 iPad */
        @media only screen and (max-width: 860px) {
            /* 將所有內容 */
            #GridView1 {
                /*width: 600px;*/
            }

            #header, #footer { display: none }

            tbody {
                max-width: 650px;
            }

            table, thead, tbody, th, td, tr {
                display: block;
            }

                /* 隱藏表格標題 */
                tr th {
                    visibility: hidden;
                    height: 0;
                }

            footer {
                visibility: hidden;
            }

            tr {
                border: 1px solid #ccc;
            }

            /* 變成橫行，左面留空半個畫面 */
            td {
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                /*padding-left: 500px;*/
                margin-left: 45%;
            }

                /*加入列表標題*/
                td:before {
                    position: absolute;
                    /*top: 6px;*/
                    left: -165px;
                    width: 45%;
                    /*padding-right: 500px;*/
                    white-space: nowrap;
                }

                td:nth-of-type(1):before {
                    content: "ID";
                }

                td:nth-of-type(2):before {
                    content: "Post Date";
                }

                td:nth-of-type(3):before {
                    content: "Job Name";
                }

                td:nth-of-type(4):before {
                    content: "Industry";
                }

                /*cancel header and footer*/
                tr:nth-child(1){
                    display:none;
                }
                tr:nth-last-child(1){
                    display:none;
                }
        }

        @media only screen and (min-width: 860px) {
            #GridView1 {
                width: 928px;
            }
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" GridLines="None" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="ID" SortExpression="CareerFormID">
                        <ItemTemplate>
                            <asp:Label ID="CareerFormID" runat="server" Text='<%#Eval("CareerFormID")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Post Date" SortExpression="ts">
                        <ItemTemplate>
                            <asp:Label ID="ts" runat="server" Text='<%#Eval("ts")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Job Name" SortExpression="career">
                        <ItemTemplate>
                            <asp:Label ID="career" runat="server" Text='<%#Eval("career")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Industry" SortExpression="Industry">
                        <ItemTemplate>
                            <asp:Label ID="Industry" runat="server" Text='<%#Eval("Industry")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>



        </div>
    </form>
</body>
</html>
