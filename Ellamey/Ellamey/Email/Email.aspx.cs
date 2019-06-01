using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System;
using System.Collections.Generic;
using System.Net;
using System.Collections.Specialized;

namespace Ellamey.Email
{
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.mail.yahoo.com");

                mail.From = new MailAddress("shinebalaji@gmail.com");
                mail.To.Add("shinebalaji@yahoo.co.in");
                mail.Subject = "Test Mail";
                mail.Body = "This is for testing SMTP mail from GMAIL";

                SmtpServer.Port = 587;
                //tpServer.Credentials = new System.Net.NetworkCredential("shinebalaji", );
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                //MessageBox.Show("mail Send");
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.ToString());
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String message = HttpUtility.UrlEncode("This is your message");
            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "HwJthEvtEkY-A7G0gqhfOGsbjvX2JiSTev0XHbp079"},
                {"numbers" , "919940470004"},
                {"message" , "Test"},
                {"sender" , "TXTLCL"}
                });
                string result = System.Text.Encoding.UTF8.GetString(response);
                Response.Write(result);
            }
        }
    }
}