<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="wfEmployeeMaintenance.aspx.vb" Inherits="Employee.wfEmployeeMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnSearch" runat="server" Text="Search" />
            <asp:TextBox ID="txtSearchStr" runat="server"></asp:TextBox>
            <asp:GridView runat="server" ID="gvEmployee">
                <dx:gridviewdatatextcolumn caption="EmployeeId" fieldname="EmployeeId" name="EmployeeId" readonly="true"></dx:gridviewdatatextcolumn>
                <dx:gridviewdatatextcolumn caption="FirstName" fieldname="FirstName" name="FirstName" readonly="true"></dx:gridviewdatatextcolumn>
                <dx:gridviewdatatextcolumn caption="LastName" fieldname="LastName" name="LastName" readonly="true"></dx:gridviewdatatextcolumn>
                <dx:gridviewdatatextcolumn caption="Phone" fieldname="Phone" name="Phone" readonly="true"></dx:gridviewdatatextcolumn>
                <dx:gridviewdatatextcolumn caption="Zip" fieldname="Zip" name="Zip" readonly="true"></dx:gridviewdatatextcolumn>
                <dx:gridviewdatatextcolumn caption="HireDate" fieldname="HireDate" name="HireDate" readonly="true"></dx:gridviewdatatextcolumn>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
