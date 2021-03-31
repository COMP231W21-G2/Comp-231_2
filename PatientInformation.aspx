<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientInformation.aspx.cs" Inherits="Covid.PatientInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="patinetinfdiv" style="height:100%">
        <div style="float: left; width: 50%; height: 100%;">
            <br>
            <h2 class="textAlignCenter">Patient's Record</h2>
            <%--<asp:Table id="pateintInfTable" runat="server" BorderStyle="Solid">
                <asp:TableRow>
                    <asp:TableCell>Name</asp:TableCell>
                    <asp:TableCell>Address</asp:TableCell>
                    <asp:TableCell>DOB</asp:TableCell>
                </asp:TableRow>
            </asp:Table>--%>
            <div>
                <label style="margin-left: 5%;"><b>Name</b></label>
                <label><b>Address</b></label>
                <label><b>DOB</b></label>
                </div>
            <div>
                <label id="lbl_name" runat="server" style="margin-left: 5%;"></label>
                <label id="lbl_address" runat="server"></label>
                <label id="lbl_dob" runat="server"></label>
                </div>
        </div>
        <div style="float: left; width: 45%; height: 70%; margin-right: 5%;">
            <br>
            <h2 class="textAlignCenter">Medical History</h2>
            <div id="medHistDiv" style="border: 1px solid grey; min-height: 70%;"><br/>
                <span style="height: 70%;"></span>
            </div>
            </div>
    </div>
</asp:Content>
