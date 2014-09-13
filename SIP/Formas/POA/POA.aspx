<%@ Page Title="" Language="C#" MasterPageFile="~/NavegadorPrincipal.Master" AutoEventWireup="true" CodeBehind="POA.aspx.cs" Inherits="SIP.Formas.POA.POA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">

         $(document).ready(function () {
             $("#<%=txtNumero.ClientID %>").attr('maxlength', '50');
        });

        function fnc_Validar() {

            var desc = $("#<%=txtDescripcion.ClientID%>").val();
            if (desc == null || desc.length == 0 || desc == undefined) {
                alert("El campo descripción no puede estar vacio");
                return false;
            }
            return true;
        }

        function fnc_OcultarDivs(sender) {
            $("#<%= divBtnNuevo.ClientID %>").css("display", "block");
            $("#<%= divEdicion.ClientID %>").css("display", "none");
            return false;
        }


        function fnc_EjecutarMensaje(mensaje) {
            alert(mensaje);
        }

    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView Height="25px" ShowHeaderWhenEmpty="true" CssClass="table" ID="GridViewObras" DataKeyNames="Id" AutoGenerateColumns="False" runat="server" AllowPaging="True">
        <Columns>
                   <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                                                    
                            <asp:ImageButton ID="imgBtnEdit" ToolTip="Editar" runat="server" ImageUrl="~/img/Edit1.png" OnClientClick="return fnc_Confirmar()" OnClick="imgBtnEdit_Click" />
                            <asp:ImageButton ID="imgBtnEliminar" ToolTip="Borrar" runat="server" ImageUrl="~/img/close.png" OnClientClick="return fnc_Confirmar()" OnClick="imgBtnEliminar_Click"/>

                        </ItemTemplate>
                        <HeaderStyle BackColor="#EEEEEE" />
                        <ItemStyle HorizontalAlign="right" VerticalAlign="Middle" Width="50px" BackColor="#EEEEEE" />
                    </asp:TemplateField>                                  
                   <asp:TemplateField HeaderText="Numero">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="input-sm" ID="txtNumero" runat="server" Text='<%# Bind("Numero") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelNumero" runat="server" Text='<%# Bind("Numero") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Descripcion">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="input-sm" ID="txtNombre" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="labelDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
        </Columns>
                    
        <PagerSettings FirstPageText="Primera" LastPageText="Ultima" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
                    
    </asp:GridView>

    <div id="divBtnNuevo" runat="server">
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click" AutoPostBack="false" />
    </div>

    <div class="row"> 
            <div id="divEdicion" runat="server" class="panel-footer" style="display:none">
                <div class="row top-buffer">
                    <div class="col-md-2">
                        <label for="Numero">Numero</label>
                    </div>
                    <div class="col-md-2">
                        <input type="text" class="input-sm required" id="txtNumero" runat="server" style="text-align: left; width:500px; align-items:flex-start" />
                    </div>
                </div>

                <div class="row top-buffer">
                    <div class="col-md-2">
                        <label for="Descripcion">Descripcion</label>
                    </div>
                    <div class="col-md-2">
                        <input type="text" class="input-sm required" id="txtDescripcion" runat="server" style="text-align: left; align-items:flex-start" />
                    </div>
                </div>

                                
                    <div class="form-group">
                    <asp:Button  CssClass="btn btn-default" Text="Guardar" ID="btnCrear" runat="server" OnClientClick="return fnc_Validar()" OnClick="btnCrear_Click" AutoPostBack="false" />
                    <asp:Button  CssClass="btn btn-default" Text="Cancelar" ID="btnCancelar" runat="server" OnClientClick="return fnc_OcultarDivs()" AutoPostBack="false" />
                </div>

                <div style="display:none" runat="server">
                    <asp:TextBox ID="_ID" runat="server" Enable="false" BorderColor="White" BorderStyle="None" ForeColor="White"></asp:TextBox>
                    <asp:TextBox ID="_Accion" runat="server" Enable="false" BorderColor="White" BorderStyle="None" ForeColor="White"></asp:TextBox>
                                    
                </div>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

            </div>
        </div>

</asp:Content>
