<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfEmployee.aspx.cs" Inherits="EmployeeWebApp.Employee.wfEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" OnClientClick="return searchValid();" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
            <asp:TextBox ID="txtSearchStr" runat="server"></asp:TextBox>
            <asp:GridView ID="gvEmployee" runat="server" OnRowCommand="gvEmployee_RowCommand" AutoGenerateColumns="False">
                <Columns>
                    <asp:CommandField ButtonType="Button" HeaderText="Controls" ShowEditButton="True" ShowHeader="True" />
                    <asp:TemplateField HeaderText="Employee ID">
                        <ItemTemplate>
                            <asp:Label ID="LblEmployeeId" runat="server" Text='<%# Bind("EmployeeId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FirstName">
                        <ItemTemplate>
                            <asp:Label ID="LblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LastName">
                        <ItemTemplate>
                            <asp:Label ID="LblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="LblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Zip">
                        <ItemTemplate>
                            <asp:Label ID="LblZip" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hire Date">
                        <ItemTemplate>
                            <asp:Label ID="LblHireDate" runat="server" Text='<%# Bind("HireDate",  "{0:MM/dd/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:Label ID="lblResultMessage" runat="server" Text=""></asp:Label>
            <asp:Button ID="BtnAddNewEmployee" runat="server" Text="Add New Employee" OnClick="BtnAddNewEmployee_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function searchValid() {
            var SearchCriteria;
            SearchCriteria = document.getElementById("MainContent_txtSearchStr").value;
            if (SearchCriteria == '') {
                alert("Please Enter Search Criteria");
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
