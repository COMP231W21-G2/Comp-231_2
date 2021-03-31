<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Covid.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="float: left; min-height: 65% !important; width: 40%; padding: 16px;" class="border-gradient border-gradient-purple">
        <br/><br/>
        <label style="padding-left: 25%;"><b>Total Amount : </b></label>  <asp:label ID="lbl_amt" runat="server"><b>$ 0.0</b></asp:label> <br/>
        <br/><br/>
        <button runat="server" id="btn_credit" OnClientClick="alert('Hi');" style="min-width: 60%;margin-left:10%" class="btn btn-primary">Credit Card</button> <br/><br/>
        <button id="btn_debit" style="min-width: 60%;margin-left:10%" class="btn btn-primary">Debit Card</button><br/><br/>
        <button id="btn_debitpin" style="min-width: 60%;margin-left:10%" class="btn btn-primary">Debit Card + ATM PIN</button><br/><br/>
        <button id="btn_iebanking" style="min-width: 60%;margin-left:10%" class="btn btn-primary">Internet Banking</button><br/><br/>
        </div>
    <div style="float: left; min-height: 65% !important; width: 60%; padding: 10px;" class="border-gradient border-gradient-purple">
        <div id="creditCardDiv">
            <h4 class="textAlignCenter">Pay Using Card</h4> <br>
            <div>
                <div style="padding-left:10%">
                <button id="btn_visa" style="min-width: 15%;margin-left:10%" class="btn btn-primary">Visa</button>
                <button id="btn_master" style="min-width: 15%;margin-left:10%" class="btn btn-primary">Master</button>
                <button id="btn_maestro" style="min-width: 15%;margin-left:10%" class="btn btn-primary">Maestro</button>
                    </div>
                <br/>
                <div id="creditCardForm" style="padding-left: 2%;border: 1px solid grey; margin-left: 10%; margin-right: 10%;">
                    <div style="float: left;width:22%"><label>Card Number </label></div>
                    <input type="text" style="min-width: 30%" placeholder="Enter Card Number" /> <br/>
                    <div style="float: left; width: 22%;"><label>Expiration Date </label></div>
                    <input type="text" style="min-width: 10%" placeholder="Month" />
                    <input type="text" style="min-width: 10%" placeholder="Year" /> <br/>
                        <div style="float: left;width:22%"><label>CVV/CVC </label></div>
                    <input type="text" style="min-width: 10%" placeholder="CVV" /> <br>
                            <div style="float: left;width:22%"><label>Card Holder Name </label></div>
                    <input type="text" style="min-width: 30%" placeholder="Enter Name" />

                </div>
            </div>
            <br/>
            <div style="padding-left: 20%;"><button id="btn_payment_credit" style="min-width: 50%;margin-left:10%" class="btn btn-primary">Make Payment</button></div>
        </div>
        <div id="ieBankingDiv">
            <h4 class="textAlignCenter">Pay Using Internet Banking</h4>
            <button id="btn_td" style="min-width: 30%;margin-left:10%" class="btn btn-primary">TD</button>
            <button id="btn_cibc" style="min-width: 30%;margin-left:10%" class="btn btn-primary">CIBC</button>
            <button id="btn_rbc" style="min-width: 30%;margin-left:10%" class="btn btn-primary">RBC</button>
            <button id="btn_tangerine" style="min-width: 30%;margin-left:10%" class="btn btn-primary">Tangerine</button>
        </div>
    </div>
</asp:Content>
