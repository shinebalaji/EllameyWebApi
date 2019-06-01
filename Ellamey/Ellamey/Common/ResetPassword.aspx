<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Ellamey.Common.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
           <td>Error</td> 
            <td>
                <asp:Label ID="lblError" runat="server" style="color:red;"></asp:Label>
            </td> 
        </tr>
        <tr>
           <td>Username</td> 
            <td>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td> 
        </tr>
         <tr>
           <td>New Password</td> 
            <td><asp:TextBox ID="txtNewpassword" runat="server" TextMode="Password"></asp:TextBox></td> 
        </tr>
         <tr>
           <td>Confirm New Password</td> 
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td> 
        </tr>
         <tr>
          
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"></asp:Button>
            </td> 
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
