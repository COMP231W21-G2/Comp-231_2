<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="Covid.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="myaccountdiv">
    <button style="font-size: 20px; float: right;"><i class="fa fa-gear"></i></button>
    <h4 class="textAlignCenter">My Account</h4>
        <div>
            <label>Name :</label>
            <asp:TextBox type="text" ID="txt_Name" class="form-control" runat="server"/>
        </div>
        <div>
            <label>Address :</label>
            <asp:TextBox type="text" ID="text_address" class="form-control" runat="server"/>
        </div>
        <div>
            <label>DOB :</label>
            <%--<input type="text" class="form-control">--%>
            <input type="date" ID="txt_dob" name="dob" style="height:50px; border: 1px solid #ccc;" runat="server" />
        </div>
        <div>
            <label>Phone Number :</label>
            <asp:TextBox type="text" ID="txt_phone" class="form-control" runat="server"/>
        </div>
        <div>
            <label>Email :</label>
            <asp:TextBox type="text" ID="txt_email" ReadOnly="True" class="form-control" runat="server"/>
        </div>
        <div>
            <label>Medical History</label>
            <asp:TextBox type="text" ID="txt_med_his" class="form-control" runat="server"/>
        </div>
    </div>
    <asp:Button ID="btn_update_account" runat="server" style="min-width: 15%;margin-left:50%" OnClick="btn_update_account_OnClick" class="btn btn-primary" Text="Update" />
    <br/>
    <asp:label id="lbl_Result" Visible="False" ForeColor="Green" runat="server" CssClass="text-center"></asp:label>
    <asp:HiddenField id="hdnDate" runat="server" />
</asp:Content>
water
