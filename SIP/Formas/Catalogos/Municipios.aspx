<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Municipios.aspx.cs" Inherits="SIP.Formas.Catalogos.Municipios" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#<%= txtNombre.ClientID %>").attr('maxlength', '100');
        });

        function fnc_Validar() {

            var desc = $("#<%=txtNombre.ClientID%>").val();
                if (desc == null || desc.length == 0 || desc == undefined) {
                    alert("El nombre no puede estar vacio");
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

    <div class="panel-heading">
            <h3 class="panel-title">Municipios</h3>
    </div>


    <asp:GridView Height="25px" ShowHeaderWhenEmpty="true" CssClass="table" ID="grid" DataKeyNames="Id" AutoGenerateColumns="False" runat="server" AllowPaging="True" >
                <Columns>
                        <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                                                    
                            <asp:ImageButton ID="imgBtnEdit" ToolTip="Editar" runat="server" ImageUrl="~/img/Edit1.png" OnClick="imgBtnEdit_Click" />
                            <asp:ImageButton ID="imgBtnEliminar" ToolTip="Borrar" runat="server" ImageUrl="~/img/close.png" OnClientClick="return fnc_Confirmar()" OnClick="imgBtnEliminar_Click"/>

                        </ItemTemplate>
                        <HeaderStyle BackColor="#EEEEEE" />
                        <ItemStyle HorizontalAlign="right" VerticalAlign="Middle" Width="50px" BackColor="#EEEEEE" />
                    </asp:TemplateField>                                  
                    <asp:TemplateField HeaderText="Clave" SortExpression="Razón Social">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="input-sm" ID="txtClave" runat="server" Text='<%# Bind("Clave") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Clave") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="input-sm" ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="labelNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                    
                <PagerSettings FirstPageText="Primera" LastPageText="Ultima" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
                    
        </asp:GridView>
    <div id="divBtnNuevo" runat="server">
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click" AutoPostBack="false" />
    </div>
    <div class="row"> 
            <div id="divEdicion" runat="server" class="panel-footer">
                <div class="row top-buffer">
                    <div class="col-md-2">
                        <label for="Clave">Clave</label>
                    </div>
                    <div class="col-md-2">
                        <input type="text" class="input-sm required" id="txtClave" runat="server" style="text-align: left; width:500px; align-items:flex-start" />
                    </div>
                </div>

                <div class="row top-buffer">
                    <div class="col-md-2">
                        <label for="Nombre">Nombre</label>
                    </div>
                    <div class="col-md-2">
                        <input type="text" class="input-sm required" id="txtNombre" runat="server" style="text-align: left; align-items:flex-start" />
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
