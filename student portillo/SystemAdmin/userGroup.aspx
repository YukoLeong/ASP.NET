<%@ Page Language="VB" AutoEventWireup="false" CodeFile="userGroup.aspx.vb" Inherits="userGroup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
        .style2
        {
            width: 100%;
            height: 118px;
        }
        .style3
        {
            width: 418px;
        }
    </style>
       <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../button1.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style1"><strong>User Group Management&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <asp:Button ID="Button1" runat="server" CssClass="blue" Text="Home" />
        </span><strong><br 
            class="style1" />

        <br class="style1" />
        </strong>
                        <asp:GridView ID="userGView" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" DataKeyNames="id" 
                            DataSourceID="SqlDataSource1" 
            GridLines="Horizontal" Height="288px" Width="826px" BorderStyle="None">
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                                    SortExpression="id" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:TemplateField HeaderText="sp" SortExpression="sp">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("sp") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("sp") %>' 
                                            Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="lr" SortExpression="lr">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("lr") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("lr") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ea" SortExpression="ea">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("ea") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("ea") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="cv" SortExpression="cv">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("cv") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("cv") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ia" SortExpression="ia">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("ia") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("ia") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ap" SortExpression="ap">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("ap") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("ap") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="jms" SortExpression="jms">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("jms") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("jms") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="lra" SortExpression="lra">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Bind("lra") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Bind("lra") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ar">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox34" runat="server" Checked='<%# Bind("ar") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox33" runat="server" Checked='<%# Bind("ar") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ra" SortExpression="ra">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Bind("ra") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# Bind("ra") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="rg">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox26" runat="server" Checked='<%# Bind("rg") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox25" runat="server" Checked='<%# Bind("rg") %>' 
                                            Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="sa">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox28" runat="server" Checked='<%# Bind("sa") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox27" runat="server" Checked='<%# Bind("sa") %>' 
                                            Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="sara">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox30" runat="server" Checked='<%# Bind("sara") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox29" runat="server" Checked='<%# Bind("sara") %>' 
                                            Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="sscs">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox32" runat="server" Checked='<%# Bind("sscs") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox31" runat="server" Checked='<%# Bind("sscs") %>' 
                                            Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="str" SortExpression="str">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox10" runat="server" Checked='<%# Bind("str") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox10" runat="server" Checked='<%# Bind("str") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ds" SortExpression="ds">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox11" runat="server" Checked='<%# Bind("ds") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox11" runat="server" Checked='<%# Bind("ds") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ps" SortExpression="ps">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox12" runat="server" Checked='<%# Bind("ps") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox12" runat="server" Checked='<%# Bind("ps") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ys" SortExpression="ys">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox13" runat="server" Checked='<%# Bind("ys") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox13" runat="server" Checked='<%# Bind("ys") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ts" SortExpression="ts">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox14" runat="server" Checked='<%# Bind("ts") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox14" runat="server" Checked='<%# Bind("ts") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="aa" SortExpression="aa">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox15" runat="server" Checked='<%# Bind("aa") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox15" runat="server" Checked='<%# Bind("aa") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="paa" SortExpression="paa">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox16" runat="server" Checked='<%# Bind("paa") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox16" runat="server" Checked='<%# Bind("paa") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="aiweb" SortExpression="aiweb">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox24" runat="server" Checked='<%# Bind("aiweb") %>' 
                                            Enabled="False" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox24" runat="server" Checked='<%# Bind("aiweb") %>' 
                                            Enabled="False"  />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="sr" SortExpression="sr">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox17" runat="server" Checked='<%# Bind("sr") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox17" runat="server" Checked='<%# Bind("sr") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="sm" SortExpression="sm">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox18" runat="server" Checked='<%# Bind("sm") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox18" runat="server" Checked='<%# Bind("sm") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
<asp:TemplateField HeaderText="gm">
<ItemTemplate>
                                        <asp:CheckBox ID="CheckBox35" runat="server" Checked='<%# Bind("gm") %>' 
                                            Enabled="False" />
                                    
</ItemTemplate>
    <EditItemTemplate>
        <asp:CheckBox ID="CheckBox36" runat="server" Checked='<%# Bind("gm") %>' 
            Enabled="False" />
    </EditItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ge">
<ItemTemplate>
                                        <asp:CheckBox ID="CheckBox37" runat="server" Checked='<%# Bind("ge") %>' 
                                            Enabled="False" />
                                    
</ItemTemplate>
    <EditItemTemplate>
        <asp:CheckBox ID="CheckBox38" runat="server" Checked='<%# Bind("ge") %>' 
            Enabled="False" />
    </EditItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ger">
<ItemTemplate>
                                        <asp:CheckBox ID="CheckBox39" runat="server" Checked='<%# Bind("ger") %>' 
                                            Enabled="False" />
                                    
</ItemTemplate>
    <EditItemTemplate>
        <asp:CheckBox ID="CheckBox40" runat="server" Checked='<%# Bind("ger") %>' 
            Enabled="False" />
    </EditItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="sga">
<ItemTemplate>
                                        <asp:CheckBox ID="CheckBox41" runat="server" Checked='<%# Bind("sga") %>' 
                                            Enabled="False" />
                                    
</ItemTemplate>
    <EditItemTemplate>
        <asp:CheckBox ID="CheckBox42" runat="server" Checked='<%# Bind("sga") %>' 
            Enabled="False" />
    </EditItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="gs">
<ItemTemplate>
                                        <asp:CheckBox ID="CheckBox43" runat="server" Checked='<%# Bind("gs") %>' 
                                            Enabled="False" />
                                    
</ItemTemplate>
    <EditItemTemplate>
        <asp:CheckBox ID="CheckBox44" runat="server" Checked='<%# Bind("gs") %>' 
            Enabled="False" />
    </EditItemTemplate>
</asp:TemplateField>
                                <asp:TemplateField HeaderText="rm" SortExpression="rm">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox50" runat="server" Checked='<%# Bind("rm") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox51" runat="server" Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="rr" SortExpression="rr">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox20" runat="server" Checked='<%# Bind("rr") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox20" runat="server" Checked='<%# Bind("rr") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="uam" SortExpression="uam">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox21" runat="server" Checked='<%# Bind("uam") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox21" runat="server" Checked='<%# Bind("uam") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ugm" SortExpression="ugm">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox22" runat="server" Checked='<%# Bind("ugm") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox22" runat="server" Checked='<%# Bind("ugm") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="lram" SortExpression="lram">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox23" runat="server" Checked='<%# Bind("lram") %>' 
                                            Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox23" runat="server" Checked='<%# Bind("lram") %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="mc" SortExpression="mc">
                                    <ItemTemplate>
                                        
                                        <asp:CheckBox ID="CheckBox47" runat="server" Checked='<%# Bind("mc") %>' 
                                            Enabled="False" />
                                    
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox46" runat="server" Enabled="False" 
                                            Checked='<%# Bind("mc") %>' />
                                    </EditItemTemplate>
                               
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                            <RowStyle HorizontalAlign="Center" CssClass="GridViewRowStyle" />
                        </asp:GridView>
                    <table class="style2">
                        <tr>
                            <td class="style3">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3">
                                sp - Student Profile<br />
                                lr - Learning Record<br />
                                ea - Extracurricular Activitie<br />
                                cv - Curriculum Vitae<br />
                                ia - Instructors&#39; Advices<br />
                                ap - Attribute Planning<br />
                                jms - Job Matching Simulation<br />
                                lra - Learning Record Attribute<br />
                                ar - Academic Results<br />
                                ra - Result Analysis<br />
                                rg - Register Gift<br />
                                sa - Student Attendance<br />
                                sara - Student Academic Result Ability<br />
                                sscs - Student Subject Category Score <br />
                                str - Student Recruitment<br />
                                
                              
                                <br />
                            </td>
                            <td>
                                ds - Director Subjects<br />
                                ps - Programme Subjects<br />
                                ys - Year Subjects<br />
                                ts - Teaching Subjects<br />
                                aa - Advisory Assistant<br />
                                paa - Program Attribute Analysis<br />
                                aiweb - Academic Information web<br />
                                sr - Seminar Registration<br />
                                sm - Seminar Management<br />
                                rm - Recruitment Management<br />
                                rr - Recruitment Registration<br />
                                uam - User Account Management<br />
                                ugm - User Group Management<br />
                                lram - Learning Record Attribute Management<br />
                                mc - Manage Comments<br />
                              
                                <br />
                            </td>
                        </tr>
        </table>
        <br />
    
    </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                DeleteCommand="DELETE FROM [userGroup] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [userGroup] ([id], [name], [ia], [sp], [ap], [ys], [ts], [ps], [ds], [cv], [jms], [lra], [aa], [paa], [uam], [sr], [sm], [lr], [ea], [ugm], [lram], [aiweb], [ra], [str], [rm], [rr]) VALUES (@id, @name, @ia, @sp, @ap, @ys, @ts, @ps, @ds, @cv, @jms, @lra, @aa, @paa, @cm, @uam, @sr, @sm, @lr, @ea, @ugm, @lram, @aiweb, @ra, @str, @rm, @rr)" 
                SelectCommand="SELECT * FROM [userGroup]" 
                
                
                
        
        
        
        
        
        
        
        
        UpdateCommand="UPDATE [userGroup] SET [name] = @name, [ia] = @ia, [sp] = @sp, [ap] = @ap, [ys] = @ys, [ts] = @ts, [ps] = @ps, [ds] = @ds, [cv] = @cv, [jms] = @jms, [lra] = @lra, [aa] = @aa, [paa] = @paa, [uam] = @uam, [sr] = @sr, [sm] = @sm, [lr] = @lr, [ea] = @ea, [ugm] = @ugm,[lram] = @lram, [aiweb] = @aiweb, [ra] = @ra, [str] = @str, [rm] = @rm, [rr] = @rr, [rg]=@rg, [sa]=@sa, [sara]=@sara, [sscs]=@sscs, [ar]=@ar, [gm]=@gm, [ge]=@ge, [ger]=@ger, [sga]=@sga, [gs]=@gs,[mc]=@mc WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="ia" Type="Boolean" />
                    <asp:Parameter Name="sp" Type="Boolean" />
                    <asp:Parameter Name="ap" Type="Boolean" />
                    <asp:Parameter Name="ys" Type="Boolean" />
                    <asp:Parameter Name="ts" Type="Boolean" />
                    <asp:Parameter Name="ps" Type="Boolean" />
                    <asp:Parameter Name="ds" Type="Boolean" />
                    <asp:Parameter Name="cv" Type="Boolean" />
                    <asp:Parameter Name="jms" Type="Boolean" />
                    <asp:Parameter Name="lra" Type="Boolean" />
                    <asp:Parameter Name="aa" Type="Boolean" />
                    <asp:Parameter Name="paa" Type="Boolean" />
                    <asp:Parameter Name="uam" Type="Boolean" />
                    <asp:Parameter Name="sr" Type="Boolean" />
                    <asp:Parameter Name="sm" Type="Boolean" />
                    <asp:Parameter Name="lr" Type="Boolean" />
                    <asp:Parameter Name="ea" Type="Boolean" />
                    <asp:Parameter Name="ugm" Type="Boolean" />
                    <asp:Parameter Name="lram" Type="Boolean" />
                    <asp:Parameter Name="aiweb" Type="Boolean" />
                    <asp:Parameter Name="ra" Type="Boolean" />
                    <asp:Parameter Name="str" Type="Boolean" />
                    <asp:Parameter Name="rm" Type="Boolean" />
                    <asp:Parameter Name="rr" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="ia" Type="Boolean" />
                    <asp:Parameter Name="sp" Type="Boolean" />
                    <asp:Parameter Name="ap" Type="Boolean" />
                    <asp:Parameter Name="ys" Type="Boolean" />
                    <asp:Parameter Name="ts" Type="Boolean" />
                    <asp:Parameter Name="ps" Type="Boolean" />
                    <asp:Parameter Name="ds" Type="Boolean" />
                    <asp:Parameter Name="cv" Type="Boolean" />
                    <asp:Parameter Name="jms" Type="Boolean" />
                    <asp:Parameter Name="lra" Type="Boolean" />
                    <asp:Parameter Name="aa" Type="Boolean" />
                    <asp:Parameter Name="paa" Type="Boolean" />
                    <asp:Parameter Name="uam" Type="Boolean" />
                    <asp:Parameter Name="sr" Type="Boolean" />
                    <asp:Parameter Name="sm" Type="Boolean" />
                    <asp:Parameter Name="lr" Type="Boolean" />
                    <asp:Parameter Name="ea" Type="Boolean" />
                    <asp:Parameter Name="ugm" Type="Boolean" />
                    <asp:Parameter Name="lram" Type="Boolean" />
                    <asp:Parameter Name="aiweb" Type="Boolean" />
                    <asp:Parameter Name="ra" Type="Boolean" />
                    <asp:Parameter Name="str" Type="Boolean" />
                    <asp:Parameter Name="rm" Type="Boolean" />
                    <asp:Parameter Name="rr" Type="Boolean" />
                    <asp:Parameter Name="rg" Type="Boolean" />
                    <asp:Parameter Name="sa" Type="Boolean" />
                    <asp:Parameter Name="sara" Type="Boolean" />
                    <asp:Parameter Name="sscs" Type="Boolean" />
                    <asp:Parameter Name="ar" Type="Boolean" />
                    <asp:Parameter Name="gm" Type="Boolean" />
                    <asp:Parameter Name="ge" Type="Boolean" />
                    <asp:Parameter Name="ger" Type="Boolean" />
                    <asp:Parameter Name="sga" Type="Boolean" />
                    <asp:Parameter Name="gs" Type="Boolean" />
                    <asp:Parameter Name="mc" Type="Boolean" />
                    <asp:Parameter Name="id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:Parameter DefaultValue="student" Name="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
