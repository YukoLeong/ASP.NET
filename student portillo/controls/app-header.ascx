<%@ Control Language="C#" AutoEventWireup="true" CodeFile="app-header.ascx.cs" Inherits="app_header" %>

   <div data-role = "header" runat="server" data-tap-toggle="false">
         <h1 class="app-header"></h1>
         <a id="changeLangBtn" name="changeLangBtn" data-xid="change-lang-btn" class="ui-btn-right" runat="server">中文</a>
         <a  name="changeLangBtn" data-icon="home" data-iconpos="notext" class="ui-btn-left" runat="server"></a>
    </div>