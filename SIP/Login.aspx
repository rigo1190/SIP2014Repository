<%@ Page Title="" Language="C#" MasterPageFile="~/MLogin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SIP.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        SISECA
    </h2>
    <p>
        Por favor proporcione los datos requeridos.
    </p>


    
 

    <%--<div class="formulario">--%>
        <div class="row">
            <div class="col-xs-4">
                <div class="input-group">
                    
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" id="txtLogin" placeholder="Usuario" runat="server" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-xs-4">
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" class="form-control" id="txtContrasena" placeholder="Password" runat="server" />
                </div>
            </div>
        </div>
    <br />
       <%-- <div class="form-group">
            
            <label for="txtLogin">Usuario</label>
            
        </div>--%>
        <%--<div class="form-group">
            <label for="txtContrasena">Password</label>
            <input type="password" class="form-control" id="txtContrasena" placeholder="Password" runat="server" />
        </div>--%>
        <div>
            <span>&nbsp;</span>
            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn btn-default"
                onclick="btnEntrar_Click" />
        </div>
   <%-- </div>--%>
    <div style="clear:both">
        <asp:Label ID="lblMensajes" EnableViewState="false" runat="server" Text=""></asp:Label>
    </div>
    </asp:Content>
