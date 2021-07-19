<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login_regist01.aspx.cs" Inherits="login_regist01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="login_regist01style/registstyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:radscriptmanager runat="server" id="RadScriptManager1" />
        <telerik:radskinmanager id="RadSkinManager1" runat="server" showchooser="true" />
        <div class="demo-container">
            <div class="registrationForm">
                <div class="titleBar">
                    <div class="titleBarBgr"></div>
                    <span>Please fill your details</span>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="cell">
                            <span class="rfdAspLabel">First name</span>
                        </div>
                        <div class="cell">
                            <telerik:radtextbox rendermode="Lightweight" id="rtbFirstName" runat="server" width="260px">
                            <ClientEvents OnFocus="demo.elementFocused" OnLoad="firstName_load" />
                        </telerik:radtextbox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="cell">
                            <span class="rfdAspLabel">Last name</span>
                        </div>
                        <div class="cell">
                            <telerik:radtextbox rendermode="Lightweight" id="rtbLastName" runat="server" width="260px">
                            <ClientEvents OnFocus="demo.elementFocused" OnLoad="lastName_load" />
                        </telerik:radtextbox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="cell">
                            <span class="rfdAspLabel">Birthday</span>
                        </div>
                        <div class="cell">
                            <telerik:raddatepicker rendermode="Lightweight" id="rdpBirthday" runat="server" width="260px" mindate="01/01/1000" maxdate="01/01/3000">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-CssClass="rcToday">
                                    </telerik:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                            <DateInput>
                                <ClientEvents OnFocus="demo.elementFocused" OnValueChanged="demo.valueChanged" />
                            </DateInput>
                            <ClientEvents OnPopupOpening="demo.onPopupOpening" />
                        </telerik:raddatepicker>
                        </div>
                    </div>

                    <div class="row">
                        <div class="cell">
                            <span class="rfdAspLabel">Gender</span>
                        </div>
                        <div class="cell">
                            <telerik:radcombobox rendermode="Lightweight" id="rcbGender" runat="server" width="260px" emptymessage=" - Select One - " onclientfocus="demo.elementFocused"
                                onclientselectedindexchanged="demo.selectedIndexChanged" onclientload="genderDD_load">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="Rather not say" />
                                <telerik:RadComboBoxItem runat="server" Text="Male" />
                                <telerik:RadComboBoxItem runat="server" Text="Female" />
                            </Items>
                        </telerik:radcombobox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="cell">
                            <span class="rfdAspLabel">Occupation</span>
                        </div>
                        <div class="cell">
                            <telerik:radtextbox rendermode="Lightweight" id="rtbOccupation" runat="server" width="260px">
                            <ClientEvents OnFocus="demo.elementFocused" OnLoad="occupation_load" />
                        </telerik:radtextbox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="cell">
                        </div>
                        <div class="cell">
                            <div class="line"></div>
                        </div>
                    </div>
                    <div class="row rowButton">
                        <div class="cell">
                        </div>
                        <div class="cell">
                            <telerik:radbutton rendermode="Lightweight" id="rbSubmit" runat="server" text="SUBMIT" autopostback="false" cssclass="rbPrimaryButton btnSubmit"></telerik:radbutton>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <telerik:radtooltip rendermode="Lightweight" id="RadToolTip1" runat="server" position="MiddleRight" showevent="FromCode" hideevent="FromCode"
            width="220px" height="70px" relativeto="Element" renderinpageroot="true" enableroundedcorners="true" enableshadow="false">
        <div class="progressBarToolTipContent">
            <telerik:RadProgressBar RenderMode="Lightweight" ID="rpbFormCompleteness" runat="server" Width="192px" Height="20px" BarType="Chunk" ShowLabel="false">
                <ClientEvents OnLoad="progressBar_load" />
                <AnimationSettings Duration="500" EnableChunkAnimation="true" />
            </telerik:RadProgressBar>
            <div class="progressLabel">
                progress of form completion: <span id="progressValue"></span>
            </div>
        </div>
    </telerik:radtooltip>
        <script src="login_regist01style/registjs.js"></script>
        <script type="text/javascript">
            //<![CDATA[
            serverIDs({
                birthdayPickerID: "<%= rdpBirthday.ClientID %>",
            tooltipID: "<%= RadToolTip1.ClientID %>"
        });
        //]]>
        </script>
    </form>
</body>
</html>
