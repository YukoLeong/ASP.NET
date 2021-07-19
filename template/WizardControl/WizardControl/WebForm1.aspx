<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WizardControl.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Wizard ID="Wizard1" runat="server" OnFinishButtonClick="Wizard1_FinishButtonClick">
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                        <table style="border: 1px solid black">
                            <tr>
                                <td>First Name
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Last Name
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Gender
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>

                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                        <table style="border: 1px solid black">
                            <tr>
                                <td>Email Address
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Mobile Number
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>

                    <asp:WizardStep ID="WizardStep3" runat="server" Title="Summary">
                        <table style="border: 1px solid black">
                            <tr>
                                <td>
                                    Step1
                                </td>
                              </tr>
                            <tr>  
                                <td>First Name
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Last Name
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Gender
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Step2
                                </td>
                                </tr>
                            <tr>
                                <td>Email Address
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Mobile Number
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </div>
    </form>
</body>
</html>
