<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Covid.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
    <div style="float:left;width:85%">
    <h2 class="textAlignCenter">User's Information</h2>
    </div>
    <div style="float:right;width:15%">
        <asp:button runat="server" id="btn_submit" style="min-width: 20%;margin-left:10%" OnClick="ShowNonVerifiedUsers" class="btn btn-primary" Text="Pending Verification"></asp:button>
    </div>
    <br/>
    <div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
                <asp:GridView runat="server" id="grd_users" AutoGenerateColumns="False" CssClass="adminUserGrid" ShowHeaderWhenEmpty="true"
                DataKeyNames="userid" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting"
                      emptydatatext="No Doctors.">
            <Columns>
                <asp:TemplateField HeaderText="User ID">
                    <ItemStyle Width="100"/>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"
                                   Text='<%# DataBinder.Eval(Container, "DataItem.userid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server"
                                   Text='<%# DataBinder.Eval(Container, "DataItem.name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUserName" runat="server" Text='<%# Eval("name") %>' Width="150"></asp:TextBox>
                    </EditItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Type">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server"
                                   Text='<%# DataBinder.Eval(Container, "DataItem.user_type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server"
                                   Text='<%# DataBinder.Eval(Container, "DataItem.address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUserAdd" runat="server" Text='<%# Eval("address") %>' Width="150"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Of Birth">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server"
                                   Text='<%# DataBinder.Eval(Container, "DataItem.dob","{0:dd, MMM yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUserDob" runat="server" Text='<%# Eval("dob") %>' Width="150"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server"
                                   Text='<%# DataBinder.Eval(Container, "DataItem.phone_no") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUserPh" runat="server" Text='<%# Eval("phone_no") %>' Width="150"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server"
                                   Text='<%# DataBinder.Eval(Container, "DataItem.email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUserEmail" runat="server" Text='<%# Eval("email") %>' Width="150"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Created On">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server"
                                   Text='<%# DataBinder.Eval(Container, "DataItem.created_on","{0:dd, MMM yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
    </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>
