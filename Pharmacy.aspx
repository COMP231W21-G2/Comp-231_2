<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pharmacy.aspx.cs" Inherits="Covid.Pharmacy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="pharmacydiv" style=" margin-left: 5%; margin-right: 2%;" >
        <div id="listdiv" style="float: left; min-height: 60% !important; width: 100%; padding: 10px;" >
           
            <div>
                <h4 class="textAlignCenter" style="float:left">Medicines List</h4>
                <asp:button id="btn_lab_reports" runat="server" CssClass="btn btn-primary floatRight" Width="10%" OnClick="btn_labreport_OnClick" Text="Lab Reports"></asp:button>
                <asp:button id="btn_cart" runat="server" CssClass="btn btn-primary floatRight" Width="10%" Text="Cart" Visible="False"></asp:button>
                    
            </div>
            <div style="width: 40%;">
            <asp:TextBox runat="server" placeholder="Search for medicine" min-width="20%"  Height="35px"/>
                </div>
            <ul id="medicinesList"></ul>
            <div id="medicineDiv" style="height: 320px; width: 60%; overflow-y:auto;float: left; border: 2px solid green;" >
                <asp:CheckBoxList runat="server" CssClass="checkboxlistformat" id="medicineChkList" DisplayMode="LinkButton">
                </asp:CheckBoxList>
            </div>
        </div>
        <div style="float: left; min-height: 60% !important; width: 40%">
            
           <div style="margin-top: 0px;">
                <asp:button id="btn_addtocart" runat="server" Width="20%" OnClick="btn_addtocart_OnClick"  CssClass="btn btn-primary" Text="Add to Cart"></asp:button>
                <asp:button id="btn_buy" runat="server" Width="20%" CssClass="btn btn-primary" Text="Buy" OnClick="btn_buy_OnClick" ></asp:button>
                </div>
        </div>

    </div>
</asp:Content>
