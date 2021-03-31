<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientSignUp.aspx.cs" Inherits="Covid.PatientSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4 class="textAlignCenter">Patient SignUp</h4>
    <div id="patientsignupdiv">
        <div>
            <label>Name</label>
            <asp:TextBox ID="txt_patient_name" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ErrorMessage="&laquo; (Required)" 
                                        ControlToValidate="txt_patient_name"
                                        ForeColor="Red" Display = "Dynamic">
            </asp:RequiredFieldValidator>
            
        </div>
        <div>
            <label>Email</label>
            <asp:TextBox ID="txt_email" runat="server"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email"
                                            ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                            Display = "Dynamic" ErrorMessage = "Invalid email address"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_email"
                                        ForeColor="Red" Display = "Dynamic" ErrorMessage = "&laquo; (Required)" />
        </div>
        <div>
            <label>Password</label>
            <asp:TextBox TextMode="Password" ID="txt_pwd" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ErrorMessage="&laquo; (Required)" 
                                        ControlToValidate="txt_pwd"
                                        ForeColor="Red" Display = "Dynamic"/>
        </div>
        <div>
            <label>Confirm Password</label>
            <asp:TextBox TextMode="Password" ID="txt_cnfrm_pwd" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="&laquo; (Required)" 
                                        ControlToValidate="txt_cnfrm_pwd"
                                        ForeColor="Red" Display = "Dynamic">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                  ControlToValidate="txt_cnfrm_pwd"
                                  CssClass="ValidationError"
                                  ControlToCompare="txt_pwd" ForeColor="Red"
                                  ErrorMessage="Password must be the same" 
                                  ToolTip="Password must be the same" />
            

        </div>
        <div>
            <label>Date Of Birth</label>
            <%--<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>--%>
            <input type="date" id="txt_dob" name="dob" style="height:50px; border: 1px solid #ccc;">
           
        </div>
        <div>
            <label>Address</label>
            <asp:TextBox ID="txt_address" runat="server"/>
        </div>
        <asp:Button ID="btn_patient_signup" runat="server" style="min-width: 20%;margin-left:45%" class="btn btn-primary" OnClick="SubmitPatientSignUp"  Text="Sign Up" />
    </div>
</asp:Content>
