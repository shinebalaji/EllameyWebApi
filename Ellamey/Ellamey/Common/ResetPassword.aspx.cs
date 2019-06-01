using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Collections;
using System.Collections.Specialized;

namespace Ellamey.Common
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string username = Request.QueryString["username"].Trim();
            string password = txtNewpassword.Text.Trim();

            string URI = "http://ellamey.online/";
            //string URI = "http://localhost:9191/";
            string myParameters = string.Format("api/ChangePassword/{0}/{1}", username, password);

            try
            {
                lblError.Text = "";

                if(txtNewpassword.Text.Trim() == txtConfirmPassword.Text.Trim())
                {
                    using (HttpClient client = new HttpClient())
                    {
                        client.BaseAddress = new Uri(URI);
                        var response = client.PutAsync(myParameters, null).Result;
                        Response.Redirect("PasswordChanged.aspx");
                    }
                }
                else
                {
                    lblError.Text = "Password and Confirm Password should match.";
                }
               
            }
            catch(Exception ex)
            {
                lblError.Text = "Error while change password.";
            }
           
        }
    }
}