<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfAddEmployee.aspx.cs" Inherits="EmployeeWebApp.Employee.wfAddEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/jquery.datetimepicker.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/jquery.mask.min.js"></script>
    <script src="../Scripts/jquery.datetimepicker.full.min.js"></script>
    <script src="../Scripts/jquery.formats.js"></script>
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="LblResult" runat="server" Text="" Visible="false"></asp:Label>
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="TxtEmployeeId" runat="server" hidden="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>FisrtName</td>
                    <td>
                        <asp:TextBox ID="TxtFirstName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>LastName</td>
                    <td>
                        <asp:TextBox ID="TxtLastName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td>
                        <asp:TextBox ID="TxtPhone" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Zip</td>
                    <td>
                        <asp:TextBox ID="TxtZip" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Hire Date</td>
                    <td>
                        <asp:TextBox ID="TxtHireDate" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" /></td>
                    <td>
                        <asp:Button ID="BtnBack" runat="server" Text="Back To List" OnClick="BtnBack_Click" />
                    </td>
                </tr>

            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
