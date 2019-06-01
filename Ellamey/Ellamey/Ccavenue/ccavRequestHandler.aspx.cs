﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CCA.Util;

namespace Ellamey.ASP.NET
{
    public partial class ccavRequestHandler : System.Web.UI.Page
    {
        CCACrypto ccaCrypto = new CCACrypto();
        string workingKey = "990827E4ED2713286AB108526ABB8B5B";//Production
        //string workingKey = "990827E4ED2713286AB108526ABB8B5B";//Testing
        string ccaRequest = "";
        public string strEncRequest="";
        public string strAccessCode = "AVPV84GD47AJ71VPJA";// Production
        //public string strAccessCode = "AVPV84GD47AJ71VPJA";// Testing

         protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {
               //foreach (string name in Request.Form)
               // {
               //     if (name != null)
               //     {
               //         if (!name.StartsWith("_"))
               //         {
               //             ccaRequest = ccaRequest + name + "=" + Request.Form[name] + "&";
               //           /* Response.Write(name + "=" + Request.Form[name]);
               //             Response.Write("</br>");*/
               //         }
               //     }
               // }
                strEncRequest = ccaCrypto.Encrypt(Request.QueryString.ToString(), workingKey);
            }
        }
    }
}



