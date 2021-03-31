<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="Covid.Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
    <h4 class="textAlignCenter">Book Appointment</h4>

    <div id="appointmentDiv">
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
            <label>Doctor</label>
            <asp:DropDownList CssClass="form-select" style="display: inline; min-width:15%" ID="ddl_doctor" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ErrorMessage="&laquo; (Required)" 
                                        ControlToValidate="ddl_doctor"
                                        ForeColor="Red" Display = "Dynamic">
            </asp:RequiredFieldValidator>
        </div>
        <div>
            <label>Date</label>
            <input type="date" id="txt_appt_date" name="appt_date" style="height:50px; border: 1px solid #ccc;" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="&laquo; (Required)" 
                                        ControlToValidate="txt_appt_date"
                                        ForeColor="Red" Display = "Dynamic" />
            <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <div style="display: inline-block; width: 20px;">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="17px"
                                 ImageUrl="~/images/Calendar.PNG" onclick="ImageButton1_Click" Width="21px" CausesValidation="False"  />
            </div>
            <asp:Calendar style="margin-left:75%" ID="Calendar1" runat="server" onselectionchanged="Calendar1_SelectionChanged"
                          Visible="False">
            </asp:Calendar>--%>
            <label style="min-width:13%">Time</label>
            <asp:DropDownList CssClass="form-select" style="display: inline; min-width:15%" ID="ddl_time"  runat="server">
                <asp:listitem text="--Select--" value="--Select--"></asp:listitem>
                <asp:listitem value="10:00" text="10.00 AM"></asp:listitem>
                <asp:listitem value="11:00" text="11.00 AM"></asp:listitem>
                <asp:listitem value="12:00" text="12.00 PM"></asp:listitem>
                <asp:listitem value="13:00" text="1.00 PM"></asp:listitem>
                <asp:listitem value="14:00" text="2.00 PM"></asp:listitem>
                <asp:listitem value="15:00" text="3.00 PM"></asp:listitem>
                <asp:listitem value="16:00" text="4.00 PM"></asp:listitem>
                <asp:listitem value="17:00" text="5.00 PM"></asp:listitem>
                <asp:listitem value="18:00" text="6.00 PM"></asp:listitem>
            </asp:DropDownList>
        </div>
        <div>
            <label>Comments</label>
            <asp:TextBox ID="txt_comments" runat="server"/>
        </div>
        <br/>
        <asp:Button ID="btn_patient_signup" runat="server" style="min-width: 20%;margin-left:45%" class="btn btn-primary" OnClick="BookAppointment"  Text="Book Appointment" />
    </div>
</asp:Content>