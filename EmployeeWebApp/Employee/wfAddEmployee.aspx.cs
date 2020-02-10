using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeWebApp.Employee
{
    public partial class wfAddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    var employee = new EmployeeDAL.EmployeeContext().SpGetEmployeeById(Convert.ToInt32(Request.Params["id"]));
                    TxtEmployeeId.Text = employee.EmployeeId.ToString();
                    TxtFirstName.Text = employee.FirstName;
                    TxtLastName.Text = employee.LastName;
                    TxtPhone.Text = employee.Phone;
                    TxtZip.Text = employee.Zip;
                    TxtHireDate.Text = employee.HireDate?.ToString("MM/dd/yyyy");
                }
                catch (Exception ex)
                {
                    LblResult.Text = ex.Message;
                    LblResult.Visible = true;
                }
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var employee = new EmployeeDAL.Models.Employee
                {
                    EmployeeId = Convert.ToInt32(TxtEmployeeId.Text),
                    FirstName = TxtFirstName.Text,
                    LastName = TxtLastName.Text,
                    Phone = TxtPhone.Text,
                    Zip = TxtZip.Text,
                    HireDate = Convert.ToDateTime(TxtHireDate.Text, new CultureInfo("en-US"))
                };

                new EmployeeDAL.EmployeeContext().SpEmployee(employee);

                TxtEmployeeId.Text = "";
                TxtFirstName.Text = "";
                TxtLastName.Text = "";
                TxtPhone.Text = "";
                TxtZip.Text = "";
                TxtHireDate.Text = "";

                Response.Redirect("wfEmployee");

                LblResult.Text = "Saved.";
            }
            catch (Exception ex)
            {
                LblResult.Text = ex.Message;
                throw;
            }

            LblResult.Visible = true;
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("wfEmployee");
        }
    }
}