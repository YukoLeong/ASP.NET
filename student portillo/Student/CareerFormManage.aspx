<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CareerFormManage.aspx.cs" ClientTarget="uplevel"
    Inherits="Student_CareerForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="Scripts/jquery.js" type="text/javascript"></script>
    <script src="Styles/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="resources/syntax/shCore.js"></script>
    <script type="text/javascript" language="javascript" src="resources/demo.js"></script>
    <script type="text/javascript" language="javascript" class="init">


        $(document).ready(function () {
            var table = $('#example').DataTable({

                initComplete: function () {
                    var api = this.api();

                    api.columns().indexes().flatten().each(function (i) {
                        var column = api.column(i);
                        var select = $('<select><option value=""></option><select>')
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
                stateSave: true,
                "order": [[0, "desc"]]

            });


                $('#example tbody').on('click', 'tr', function () {

                    var temp1 = $('td', this).eq(0).text();
                    var temp2 = table.$('input, select').serialize();
                    var temp3 = $('td', this).eq(1).text();
                    var temp4 = $('td', this).eq(2).text();

                    //alert('You clicked on ' + temp1 + ' row');
                    $("#TextboxTemp").val(temp1);
                    $("#TextboxTemp2").val(temp2);
                    $("#TextboxTemp3").val(temp3);
                    $("#TextboxTemp4").val(temp4);

                    if ($(this).hasClass('selected')) {
                        $(this).removeClass('selected');
                    }
                    else {
                        table.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }
                });

        });



    </script>
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="resources/syntax/shCore.css">
    <link rel="stylesheet" type="text/css" href="resources/demo.css">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <style type="text/css">
        #pic
        {
            background-size: cover;
        }
        
        #aspfont
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
        }
        #aspfont2
        {
            font-family: DFKai-sb;
        }
        #content
        {
            margin-left: 80px;
            margin-right: 80px;
        }
        #content2
        {
            margin-left: 80px;
            margin-right: 80px;
        }
        .style1
        {
            width: 100%;
            border: 1px solid #000000;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 212px;
            height: 36px;
        }
        .style5
        {
            height: 36px;
        }
        .style6
        {
            width: 212px;
        }
        .style10
        {
            width: 200px;
        }
    </style>
</head>
<body background="../images/gp1.jpg" id="pic">
    <form id="form1" runat="server">
    <div align="left" id="aspfont" style="font-size: 16pt; font-weight: bold;">
	    <br />
        <asp:Label ID="Label41" runat="server" Text="Career Form Management" ForeColor="BlueViolet"
            Font-Size="Large" Style="padding-left: 60px;"></asp:Label>
        <asp:Button ID="HomeButton" runat="server" Text="Home" CssClass="blue" Height="40px"
            OnClick="HomeButton_Click" Style="margin-left: 300px" Font-Size="Large" />
    </div>
    <div id="content">
        <asp:Button ID="ViewButton" runat="server" Text="View" CssClass="blue" OnClick="ViewButton_Click"
            EnableViewState="False" />
        <asp:Button ID="UpdateButton" runat="server" Text="Update" CssClass="blue" OnClick="UpdateButton_Click"
            OnClientClick="alert(&quot;Update Success&quot;)" />
        <asp:Label ID="CareerTitle" runat="server" style="font-weight: 700"></asp:Label>
            <br />
            <br />
        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>
                        FormID
                    </th>
                    <th>
                        SumbitTime
                    </th>
                    <th>
                        Organiztion
                    </th>
                    <th>
                        JobName
                    </th>
                    <th>
                        Status
                    </th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>
                        FormID
                    </th>
                    <th>
                        SumbitTime
                    </th>
                    <th>
                        Organiztion
                    </th>
                    <th>
                        JobName
                    </th>
                    <%--<th style="display:none">--%>
                    <th>
                        Status
                    </th>
                </tr>
            </tfoot>
            <tbody>
                <asp:Literal runat="server" ID="kanonData"></asp:Literal>
            </tbody>
        </table>
        <br />
        <asp:TextBox ID="TextboxTemp" runat="server" 
            ontextchanged="TextboxTemp_TextChanged" Style="display: none;"></asp:TextBox>
        <asp:Label ID="LabelTemp" runat="server" Style="display: none;"></asp:Label>
        <asp:TextBox ID="TextboxTemp2" runat="server" Width="341px" Style="display: none;"></asp:TextBox>
        <asp:TextBox ID="TextboxTemp3" runat="server" Style="display: none;"></asp:TextBox>
        <asp:TextBox ID="TextboxTemp4" runat="server" Style="display: none;"></asp:TextBox>
        <br />
        <br>
        <asp:Panel ID="Panel1" runat="server" BackColor="White">
            <div id="content2">
                <br />
                <table class="style1" border="1" cellpadding="2" cellspacing="0">
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label1" runat="server" Text="招聘職位&lt;br&gt;Post Offered"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="360px"></asp:TextBox>
                            &nbsp;行業類別
                            <asp:DropDownList ID="CatalogDll" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CatalogDll_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="招聘人數No.of Vacancy"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" Width="32px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="全職 Full-Time" />
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="兼職 Part-Time" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label3" runat="server" Text="機構名稱&lt;br&gt;Organization Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" Height="22px" Width="454px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label4" runat="server" Text="工作性質&lt;br&gt;Business Nature"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="NatureDll" runat="server" Width="300px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label5" runat="server" Text="工作內容&lt;br&gt;Job Description &amp; Basic Duties"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" Height="101px" TextMode="MultiLine" Width="592px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label6" runat="server" Text="薪金&lt;br&gt;Salary Offered"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="MOP" Style="font-weight: bold;"></asp:Label>
                            <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="CheckBox3" runat="server" Text="小時Hour" />
                            <asp:CheckBox ID="CheckBox4" runat="server" Text="日Day" />
                            <asp:CheckBox ID="CheckBox5" runat="server" Text="月Month" />
                            <asp:CheckBox ID="CheckBox6" runat="server" Text="其他Others" />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label8" runat="server" Text="要求&lt;br&gt;Qualification Requirements"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server" Height="107px" TextMode="MultiLine" Width="590px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label9" runat="server">重要日期<br/>Important Dates</asp:Label>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="申請截止日期 Application Deadline"></asp:Label>
                                        <asp:TextBox ID="TextBox27" runat="server" Style="margin-left: 4px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="工作開始日期 Start Date"></asp:Label>
                                        <asp:TextBox ID="TextBox28" runat="server" Style="margin-left: 84px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label12" runat="server" Text="申請者須遞交文件<br>Docs to Submit for Application"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox7" runat="server" Text="應徵信 Job Application Letter" />
                            <asp:CheckBox ID="CheckBox8" runat="server" Text="履歷表 Resume" />
                            <br />
                            <asp:CheckBox ID="CheckBox9" runat="server" Text="身份證副本 ID Copy" />
                            <asp:CheckBox ID="CheckBox10" runat="server" Text="成績單 Transcript" />
                            <br />
                            <asp:CheckBox ID="CheckBox11" runat="server" Text="駕駛執照副本 Copy of Driving License" />
                            <br />
                            <asp:CheckBox ID="CheckBox13" runat="server" Text="其他 Others" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label13" runat="server" Text="申請者之應徵方式<br>Methods of Application"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label31" runat="server" Text="郵寄至 Post to"></asp:Label>
                            <asp:TextBox ID="TextBox9" runat="server" Style="margin-left: 20px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label42" runat="server" Text="電郵 E-mail"></asp:Label>
                            <asp:TextBox ID="TextBox10" runat="server" Style="margin-left: 44px"></asp:TextBox>
                            &nbsp;<br />
                            <asp:Label ID="Label43" runat="server" Text="電話 Phone"></asp:Label>
                            <asp:TextBox ID="TextBox11" runat="server" Style="margin-left: 52px"></asp:TextBox>
                            &nbsp;<br />
                            <asp:Label ID="Label44" runat="server" Text="其他方式 Others"></asp:Label>
                            <asp:TextBox ID="TextBox12" runat="server" Style="margin-left: 12px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:Label ID="Label14" runat="server" Text="查詢及聯絡方法<br>Enquireies &amp; Contact Informaion"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label15" runat="server" Text="聯絡人 Contact Person:"></asp:Label>
                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                            <asp:CheckBox ID="CheckBox18" runat="server" Text="女士 Ms/" />
                            <asp:CheckBox ID="CheckBox19" runat="server" Text="先生 Mr" />
                            <br />
                            <asp:Label ID="Label16" runat="server" Text="聯絡電話 Phone:"></asp:Label>
                            <asp:TextBox ID="TextBox14" runat="server" Style="margin-left: 56px"></asp:TextBox>
                            &nbsp;<br />
                            <asp:Label ID="Label17" runat="server" Text="電郵 Email:"></asp:Label>
                            <asp:TextBox ID="TextBox15" runat="server" Style="margin-left: 88px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <p>
                    &nbsp;</p>
                <table class="style1">
                    <tr>
                        <td align="left" class="style6">
                            要求特質<br />
                            Request Ability
                        </td>
                        <td class="style10">
                            <asp:Label ID="Label32" runat="server" Text="專業能力&lt;br&gt;Professional Competence"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </td>
                        <td class="style10">
                            <asp:Label ID="Label33" runat="server" Text="領導&lt;br&gt;Leadership"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label34" runat="server" Text="溝通&lt;br&gt;Communication"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList3" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label35" runat="server" Text="創造力&lt;br&gt;Creativity"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList4" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label36" runat="server" Text="主動性&lt;br&gt;Initiative"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList5" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            &nbsp;
                        </td>
                        <td class="style10">
                            <asp:Label ID="Label37" runat="server" Text="自我發展&lt;br&gt;Self Development"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList6" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style10">
                            <asp:Label ID="Label38" runat="server" Text="社會責任&lt;br&gt;Social Responsibility"></asp:Label>
                            <asp:DropDownList ID="DropDownList7" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </td>
                        <td>
                            <asp:Label ID="Label39" runat="server" Text="語言&lt;br&gt;Language"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList8" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label40" runat="server" Text="電腦應用&lt;br&gt;IT Application"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList9" runat="server">
                                <asp:ListItem Value="1">不重要</asp:ListItem>
                                <asp:ListItem Value="2">一般</asp:ListItem>
                                <asp:ListItem Value="3">有需要</asp:ListItem>
                                <asp:ListItem Value="4">重要</asp:ListItem>
                                <asp:ListItem Value="5">非常重要</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <br />
                        </td>
                    </tr>
                </table>
                <p>
                    &nbsp;</p>
                <table class="style3" frame="border">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label18" runat="server" Text="機構名稱<br>Organiztion Name"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="TextBox16" runat="server" Width="464px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label28" runat="server" Text="需填寫中英文名稱 Name in Chinese &amp; English are required"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label19" runat="server" Text="公司地址&lt;br&gt;Company Address"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox17" runat="server" Width="464px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label20" runat="server" Text="公司商業登記號碼<br>Commercial Reg No"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox18" runat="server" Width="464px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label21" runat="server" Text="本登記聯絡人&lt;br&gt;Contact Person for Job Posting"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox19" runat="server" Width="318px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label22" runat="server" Text="職位及部門&lt;br&gt;Position &amp; Department"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox20" runat="server" Width="318px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label23" runat="server" Text="電話&lt;br&gt;Telephone"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox21" runat="server" Width="148px"></asp:TextBox>
                            <asp:Label ID="Label24" runat="server" Text="傳真Fax"></asp:Label>
                            <asp:TextBox ID="TextBox22" runat="server" Width="207px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label25" runat="server" Text="電郵&lt;br&gt;E-mail"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox23" runat="server" Width="315px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label26" runat="server" Text="招聘訊息刊登日期<br>Date of Posting"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label29" runat="server" Text="由From"></asp:Label>
                            <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
                            <asp:Label ID="Label30" runat="server" Text="至to"></asp:Label>
                            <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
