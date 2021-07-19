﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageMultiSaveToDb3p.aspx.cs" Inherits="ImageMultiSaveToDb3p" %>

<!DOCTYPE html>

<%--改良版 可以上載圖片進DB--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="width: 530px;">
        <fieldset>
            <legend>Upload Multiple Photos</legend>
            <div id="div1" runat="server">
                <input type="file" size="65" runat="server" id="FileUpload1" />
                <input type="file" size="65" runat="server" id="FileUpload2" />
                <input type="file" size="65" runat="server" id="FileUpload3" />
                <input type="file" size="65" runat="server" id="FileUpload4" />
                <input type="file" size="65" runat="server" id="FileUpload5" />
            </div>
            <br />
            <div id="div2" runat="server" visible="false">
                <input type="file" size="65" runat="server" id="FileUpload6" />
                <input type="file" size="65" runat="server" id="FileUpload7" />
                <input type="file" size="65" runat="server" id="FileUpload8" />
                <input type="file" size="65" runat="server" id="FileUpload9" />
                <input type="file" size="65" runat="server" id="FileUpload10" />
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" />
            <asp:Button ID="ButtonMore" runat="server" Text="Add 10 Photos" OnClick="ButtonMore_Click" />
        </fieldset>
        <br />

        <div id="div5" runat="server" visible="false">
            <fieldset>
                <legend>Show Photos</legend>
                <div id="div3" runat="server">
                    <asp:Image ID="Image1" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                    <asp:Image ID="Image2" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                    <asp:Image ID="Image3" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                    <asp:Image ID="Image4" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                    <asp:Image ID="Image5" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                </div>
                <br />
                <div id="div4" runat="server" visible="false">
                    <asp:Image ID="Image6" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                    <asp:Image ID="Image7" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                    <asp:Image ID="Image8" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                    <asp:Image ID="Image9" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                    <asp:Image ID="Image10" runat="server" Height="100" Width="100" ImageUrl="~/Image.gif" Visible="false" />
                </div>
            </fieldset>
        </div>
    </form>
</body>
</html>
