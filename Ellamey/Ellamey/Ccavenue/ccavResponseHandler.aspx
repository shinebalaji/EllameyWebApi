<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ccavResponseHandler.aspx.cs" Inherits="Ellamey.ASP.NET.ccavResponseHandler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>  
        <script type="text/javascript">
            $(document).ready(function () {
                //var response = document.getElementById("encResp").value;
                localStorage.setItem('isCloseSelf', 'yes');
                //localStorage.setItem('encResponse', response);
                window.onbeforeunload = function () {
                    // Do something
                }
               
            });
       </script>
</head>
<body>
     <form runat="server" id="nonseamlessResponse" name="redirectResponse"> 
        <%--<input type="hidden" id="encResp" name="encResp" value="<%=encResponse%>"/>--%>
       
    </form>
</body>
</html>
