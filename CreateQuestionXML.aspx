<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateQuestionXML.aspx.cs"
    Inherits="CreateQuestionXML" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
    function valid()
    {
            var c= confirm('will you wat to delete?');
            if(c==true)
            {
               return true;
            }
           else
           {
                return false;
           }
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table width="100%" cellpadding="0" cellspacing="0">
            
            <tr>
                <td colspan="2">
                   <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label> 
                </td>
                
               
            </tr>
            <tr>
                <td>
                    Question:
                </td>
                <td>
                    <asp:TextBox ID="txtQues" runat="server" Width="231px"></asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td>
                    Ans1:
                </td>
                <td>
                    <asp:TextBox ID="txtAns1" runat="server" Width="231px"></asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td>
                    Ans2:
                </td>
                <td>
                    <asp:TextBox ID="txtAns2" runat="server" Width="231px"></asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td>
                    Ans3:
                </td>
                <td>
                    <asp:TextBox ID="txtAns3" runat="server" Width="231px"></asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td>
                    Ans4:
                </td>
                <td>
                    <asp:TextBox ID="txtAns4" runat="server" Width="231px"></asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td>
                    Ans:
                </td>
                <td>
                    <asp:TextBox ID="txtAns" runat="server" Width="231px"></asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" />
                                    <asp:GridView Width="100%" ID="GridView1" runat="server" AllowSorting="true" AllowPaging="True" 
                                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                    GridLines="None" onrowediting="GridView1_RowEditing" 
                                    onrowcancelingedit="GridView1_RowCancelingEdit" 
                                    onrowupdating="GridView1_RowUpdating"  
                                    onrowdeleting="GridView1_RowDeleting" onsorting="GridView1_Sorting">
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <Columns>
                                        <asp:TemplateField HeaderText="ques No." >
                                               <%-- <EditItemTemplate>
                                                    <asp:TextBox ID="txtques" runat="server" Text='<%#Eval("ques_no") %>'></asp:TextBox>
                                                </EditItemTemplate>--%>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblques_no" runat="server" Text='<%#Eval("ques_no") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        
                                        
                                            <asp:TemplateField HeaderText="ques" SortExpression="ques">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtques" runat="server" Text='<%#Eval("ques") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblques" runat="server" Text='<%#Eval("ques") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ans1" SortExpression="ans1">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtans1" runat="server" Text='<%# Eval("ans1") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblans1" runat="server" Text='<%# Eval("ans1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ans2" SortExpression="ans2">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtans2" runat="server" Text='<%# Eval("ans2") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblans2" runat="server" Text='<%# Eval("ans2") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ans3" SortExpression="ans3">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtans3" runat="server" Text='<%# Eval("ans3") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblans3" runat="server" Text='<%# Eval("ans3") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ans4" SortExpression="ans4">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtans4" runat="server" Text='<%# Eval("ans4") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblans4" runat="server" Text='<%# Eval("ans4") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ans" SortExpression="ans">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtans" runat="server" Text='<%# Eval("ans") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblans" runat="server" Text='<%# Eval("ans") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                                        CommandName="Update" Text="Update"></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" OnClientClick="javascript:return valid();" Text="Delete"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" />
                                                             <%-- <asp:LinkButton ID="lnkAdd" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Add" runat="server"  CausesValidation="False">Add</asp:LinkButton>   --%>

                                    </asp:GridView>
                            </td>
                           
                           
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
