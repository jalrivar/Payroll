using System;
using System.Web.UI;

namespace EmployeeWebApp
{
    public class Utils
    {
        public static void Alert(Control page, string mensaje)
        {
            try
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script language='javascript'>");
                sb.Append(@"alert('");
                sb.Append(mensaje);
                sb.Append("');");
                sb.Append(@"</script>");

                ScriptManager.RegisterStartupScript(page, page.GetType(), "ajax", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}