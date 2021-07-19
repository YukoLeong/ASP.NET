<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CareerFormManage.aspx.cs" Inherits="Operator_CFM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css" />
    <link rel="stylesheet" type="text/css" href="resources/syntax/shCore.css" />
    <link rel="stylesheet" type="text/css" href="resources/demo.css" />
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <style type="text/css">
        .content
        {
            margin-left: 120px;
            margin-right: 120px;
        }
        #ImageButton2{
            width:9%;
        }
    </style>
    <script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="resources/syntax/shCore.js"></script>
    <script type="text/javascript" language="javascript" src="resources/demo.js"></script>
    <script type="text/javascript" language="javascript">

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
//                stateSave: true,
                "order": [[0, "desc"]]

            });


            $('#example tbody').on('click', 'tr', function () {

                var temp1 = $('td', this).eq(0).text();
                var temp2 = table.$('input, select').serialize();

                //alert('You clicked on ' + temp1 + ' row');
                $("#IDTemp").val(temp1);
                $("#DropdownTemp").val(temp2);

                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            });

            $('#ViewButton').click(function () {
                 
                if (table.cell('.selected', 0).data() != null) {
                    //alert(table.cell('.selected', 0).data());
                    var temp1 = table.cell('.selected', 0).data();
                    PageMethods.SetSessionValue('IDTemp', temp1);

                    window.open('CareerFormManageView.aspx', '_blank');
                    return false;
                }
            });
        });



    </script>
</head>
<body background="../images/gp1.jpg" id="pic">
    <div class="content">
        <form id="form1" runat="server">
        <asp:ScriptManager EnablePageMethods="true" ID="MainSM" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
        <br />
        <br />
        <asp:Label ID="Label41" runat="server" Text="Job Management"
            Font-Size="Large" Style="padding-left: -20px;"></asp:Label>
            <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1554px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" OnClick="ImageButton2_Click" /> 
    </div>
        <br />
        <br />
        <asp:Button ID="ViewButton" runat="server" Text="View" CssClass="blue" />
        <asp:Button ID="UpdateButton" runat="server" Text="Update" CssClass="blue" 
            onclick="UpdateButton_Click" OnClientClick="alert(&quot;Update Success&quot;)" />
        <br />
        <br />
        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        PostingDate
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
                        ID
                    </th>
                    <th>
                        PostingDate
                    </th>
                    <th>
                        Organiztion
                    </th>
                    <th>
                        JobName
                    </th>
                    <th style="display:none">
                        Status
                    </th>
                </tr>
            </tfoot>
            <tbody>
                <asp:Literal runat="server" ID="kanonData"></asp:Literal>
            </tbody>
        </table>
        <br />
        <%--<asp:TextBox ID="IDTemp" runat="server"></asp:TextBox>--%>
        <asp:TextBox ID="IDTemp" runat="server" Style="display: none"></asp:TextBox>
        <asp:TextBox ID="DropdownTemp" runat="server" Style="display: none"></asp:TextBox>
        </form>
    </div>
</body>
</html>
