﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NestedColapsableGvList.aspx.cs" Inherits="NestedColapsableGvList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
  <asp:GridView ID="gvParent" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvParent_RowDataBound"
            CellPadding="4" ForeColor="#333333" ShowHeader="True">
            <Columns>
                <asp:TemplateField ItemStyle-Width="20px">
                    <ItemTemplate>
                        <asp:Image runat="server" ID="img1" ImageUrl="images/Collapse.GIF" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Employee Id" DataField="EmployeeId">
                    <ItemStyle HorizontalAlign="Center" Width="140px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Employee Name" DataField="EmployeeName">
                    <ItemStyle HorizontalAlign="Center" Width="140px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Designation" DataField="Designation">
                    <ItemStyle HorizontalAlign="Center" Width="140px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label ID="lblEmpName" runat="server" Text='<%# Eval("Location")%>'></asp:Label>
                        <asp:Literal runat="server" ID="lit1" Text="</td><tr id='trCollapseGrid' style='display:none' ><td colspan='5'>" />
                            <asp:GridView ID="gvChild" AutoGenerateColumns="False" runat="server" EnableViewState="False"
                                ForeColor="#333333">
                                <RowStyle BackColor="#EFF3FB" /> 
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="Skill ID" DataField="SkillID">
                                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Employee Id" DataField="EmployeeId">
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Skill Set" DataField="SkillSet">
                                        <ItemStyle HorizontalAlign="Center" Width="110px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Remarks" DataField="Remarks">
                                        <ItemStyle HorizontalAlign="Center" Width="245px" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                        <asp:Literal runat="server" ID="lit2" Text="</td></tr>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">
    function OpenTable(trRow, imgId) {
        object = document.getElementById(trRow);
        if (object.style.display == "none") {
            object.style.display = "";
            document.getElementById(imgId).src = "images/Expand.gif";
        }
        else {
            object.style.display = "none";
            document.getElementById(imgId).src = "images/Collapse.gif";
        }
    }
</script>

