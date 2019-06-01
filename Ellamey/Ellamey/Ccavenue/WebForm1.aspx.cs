using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Collections;
using System.Collections.Specialized;

namespace Ellamey.Ccavenue
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection Params = new NameValueCollection();
            Params.Add("k1", "v1");
            Response.Write(Params.Get("k1"));
            //string encResponse = "p";
            //string encResponse = "order_id=19&tracking_id=308004988991&bank_ref_no=1555316700843&order_status=Success&failure_message=&payment_mode=Net Banking&card_name=AvenuesTest&status_code=null&status_message=Y¤cy=INR&amount=1.20&billing_name=Balaswamy&billing_address=7/1109a.gn gardex, Tirupur.9cv vb&billing_city=tirupur&billing_state=tamilnadu&billing_zip=641602&billing_country=India&billing_tel=9894524954&billing_email=sdsd@sds.com&delivery_name=Balaswamy&delivery_address=7/1109a.gn gardex, Tirupur.9cv vb&delivery_city=tirupur&delivery_state=tamilnadu&delivery_zip=641602&delivery_country=India&delivery_tel=9894524954&merchant_param1=&merchant_param2=&merchant_param3=&merchant_param4=&merchant_param5=&vault=N&offer_type=null&offer_code=null&discount_value=0.0&mer_amount=1.20&eci_value=null&retry=N&response_code=0&billing_notes=&trans_date=15/04/2019 13:55:25&bin_country=StatusCode: 400, ReasonPhrase: Bad Request, Version: 1.1, Content: System.Net.Http.StreamContent, Headers: { Connection: close Date: Mon, 15 Apr 2019 08:25:29 GMT Server: Microsoft-HTTPAPI/2.0 Content-Length: 324 Content-Type: text/html; charset=us-ascii }";
            string order_id = "19";
            string TrackingId = "19";
            string BankRefNo = "19";
            string OrderStatus = "19";

            string URI = "http://ellamey.online/";
            //string URI = "http://localhost:9191/";
            string myParameters = string.Format("api/UpdateRestaurantOrderResponse/{0}/{1}/{2}/{3}", order_id, TrackingId, BankRefNo, OrderStatus);

            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(URI);
                var response = client.PutAsync(myParameters,null).Result;
                Response.Write(response);
            }
        }
    }

}