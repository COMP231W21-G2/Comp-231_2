<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Questionary.aspx.cs" Inherits="Covid.Questionary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2 class="textAlignCenter">Questionary</h2>
    <h4 style="margin-left:10%;">Do you have any of the following:</h4>
    <div id="questionarydiv" style="margin-left:10%;">
        <div>
        <label>Fever</label>
        <select class="form-select" style="display: inline"class="form-select" style="display: inline" id="ddl_fever">
            <option>--Select--</option>
            <option>Yes</option>
            <option>No</option>
        </select>
            </div>
        <div>
            <label>Cough</label>
            <select class="form-select" style="display: inline"id="ddl_cough">
                <option>--Select--</option>
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>
        <div>
            <label>Shortness of breath</label>
            <select class="form-select" style="display: inline"id="ddl_breath">
                <option>--Select--</option>
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>
        <div>
            <label>Sore throat</label>
            <select class="form-select" style="display: inline"id="ddl_throat">
                <option>--Select--</option>
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>
        <div>
            <label>Runny nose</label>
            <select class="form-select" style="display: inline"id="ddl_nose">
                <option>--Select--</option>
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>
        <div>
            <label>Feeling unwell</label>
            <select class="form-select" style="display: inline"id="ddl_unweel">
                <option>--Select--</option>
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>
    </div>
    <br/>
    <button id="btn_submit_questionary" style="min-width: 25%;margin-left:20%" class="btn btn-primary">Submit</button>
</asp:Content>
