<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ccavRequestHandler.aspx.cs" Inherits="Ellamey.ASP.NET.ccavRequestHandler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>  
        <script type="text/javascript">
            $(document).ready(function () {
                
                $("#nonseamless").submit();
            });
       </script>
</head>
<body>
    
    <div>
     <form runat="server" id="nonseamless" method="post" name="redirect" action="https://secure.ccavenue.com/transaction.do?command=initiateTransaction"> 
        <input type="hidden" id="encRequest" name="encRequest" value="<%=strEncRequest%>"/>
        <input type="hidden" name="access_code" id="accesscode" value="<%=strAccessCode%>"/>
    </form>
    </div>
   
</body>
</html>

   

