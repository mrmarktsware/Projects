<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
          
   
              <table  width="600px">
                  <td height="100px"></td><td></td><td></td><tr></tr>

                  <td width="150px"></td>
                  <h4><td width="50px"><asp:Label runat="server" Text="Login" ID="Label2"></asp:Label></td></h4>
                  <td width="100px"><asp:TextBox runat="server" BorderStyle="Solid">username</asp:TextBox></td>
                  <tr></tr>

                  <td width="150px"></td>
                  <td><asp:Label runat="server" Text="Password" ID="Label3"></asp:Label></H2></a></td>
                  <td><asp:TextBox runat="server" BorderStyle="Solid">password</asp:TextBox></td>
                   <td height="100px"></td><td></td><td></td><tr></tr>

              </table>



                
            </Centre>
        </section>
    </main>

</asp:Content>
