<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Ellamey.Ccavenue.WebForm1" %>

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
                    this.close();
                }
                $("#submit").click(function () {
                    window.close();
                });
                setInterval(function () { alert("Hello"); }, 3000);
            });
            
       </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="button" name="submit" id="submit" value="ok"/>
    </div>
    </form>
</body>
</html>
