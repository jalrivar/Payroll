using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeWebApp.Employee
{
    public partial class wfEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetAllEmployee();
            }
        }

        private void GetAllEmployee()
        {
            var source = new EmployeeDAL.EmployeeContext().SpGetEmployee("");
            lblResultMessage.Text = $@"{source.Count} record(s) found.";
            gvEmployee.DataSource = source;
            gvEmployee.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var source = new EmployeeDAL.EmployeeContext().SpGetEmployee(txtSearchStr.Text);
            lblResultMessage.Text = $@"{source.Count} record(s) found.";
            gvEmployee.DataSource = source;
            gvEmployee.DataBind();
        }

        protected void gvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvEmployee.Rows[index];
            Label LblEmployeeId = (Label)row.FindControl("LblEmployeeId");            

            Response.Redirect($"wfAddEmployee.aspx?id={LblEmployeeId.Text}");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnAddNewEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("wfAddEmployee");
        }
    }
}