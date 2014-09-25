<%@ Page Title="" Language="C#" MasterPageFile="~/MLogin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SIP.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       
         
        <div class="container">

             <div class="well text-center"><h3>Sistema de Inversión Pública</h3></div>     
            
            <div class="form-group">
                 <img class="img-circle center-block" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                            alt="">
            </div>          
            
                                                             
            <div class="row">
                                
               
                 <div class="col-md-offset-4 col-md-4">  
                                            
                   
                    <p>Por favor proporcione los datos requeridos.</p>
                   
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control" id="txtLogin" placeholder="Usuario" required autofocus runat="server" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                             <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            <input type="password" class="form-control" id="txtContrasena" placeholder="Password" required runat="server" />
                        </div>
                    </div>
                    
                    <div class="form-group pull-right">
                        <div class="input-group">
                            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn btn-default" onclick="btnEntrar_Click" />
                        </div>
                    </div>

                  </div>
                               
                
            </div>

            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4 alert alert-danger">
                    <asp:Label ID="lblMensajes" EnableViewState="false" runat="server" Text="" CssClass="font-weight:bold"></asp:Label>
                </div>
                <div class="col-md-4"></div>                
            </div>
            
        </div>

   
 
       
    
   
</asp:Content>
