using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Specialized;
using CCA.Util;
using System.Net.Http;

namespace Ellamey.ASP.NET
{
    public partial class ccavResponseHandler : System.Web.UI.Page
    {
        public string encResponse = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string workingKey = "990827E4ED2713286AB108526ABB8B5B";//production
            //string workingKey = "990827E4ED2713286AB108526ABB8B5B";//testing
            CCACrypto ccaCrypto = new CCACrypto();
            encResponse = ccaCrypto.Decrypt(Request.Form["encResp"], workingKey);
            NameValueCollection Params = new NameValueCollection();
            string[] segments = encResponse.Split('&');
            foreach (string seg in segments)
            {
                string[] parts = seg.Split('=');
                if (parts.Length > 0)
                {
                    string Key = parts[0].Trim();
                    string Value = parts[1].Trim();
                    Params.Add(Key, Value);
                }
            }

            for (int i = 0; i < Params.Count; i++)
            {
                Response.Write(Params.Keys[i] + " = " + Params[i] + "<br>");
            }
            
            if(Params.Get("merchant_param1") == "Restaurateur Payment")
            {
                string URI = "http://ellamey.online/";
                string myParameters = string.Format("api/UpdateRestaurantOrderResponse/{0}/{1}/{2}/{3}", Params.Get("order_id"), Params.Get("tracking_id"), Params.Get("bank_ref_no"), Params.Get("order_status"));

                using (HttpClient client = new HttpClient())
                {
                    client.BaseAddress = new Uri(URI);
                    var response = client.PutAsync(myParameters, null).Result;
                    Response.Write(response);
                }
            }
            else if (Params.Get("merchant_param1") == "Grocer Payment")
            {
                string URI = "http://ellamey.online/";
                string myParameters = string.Format("api/UpdateGroceryOrderResponse/{0}/{1}/{2}/{3}", Params.Get("order_id"), Params.Get("tracking_id"), Params.Get("bank_ref_no"), Params.Get("order_status"));

                using (HttpClient client = new HttpClient())
                {
                    client.BaseAddress = new Uri(URI);
                    var response = client.PutAsync(myParameters, null).Result;
                    Response.Write(response);
                }
            }
           
           
        }
    }
}