<%@ Page Title="" Language="C#" MasterPageFile="~/NavegadorCatalogos.Master" AutoEventWireup="true" CodeBehind="PlantillaPreguntas.aspx.cs" Inherits="SIP.Formas.Catalogos.PlantillaPreguntas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            

         });

        function fnc_OcultarDivs(sender) {
            $("#<%= divBtnNuevo.ClientID %>").css("display", "block");
            $("#<%= divCaptura.ClientID %>").css("display", "none");
            $("#<%= divGuardar.ClientID %>").css("display", "none");
            return false;
        }


        function fnc_Confirmar() {
            return confirm("¿Está seguro de eliminar el registro?");


        }


       

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div id="divPlantilla" runat="server">
                <div class="panel panel-success">
                    <div class="panel-heading">
                            <h3 id="titulo" runat="server" class="panel-title">Preguntas</h3>
                    </div>
                     <div class="panel-body">
                    <div class="row">
                       <asp:GridView ShowHeaderWhenEmpty="true" CssClass="table" Width="100%" ShowFooter="true" AutoGenerateColumns="false" ID="grid" DataKeyNames="Id"  runat="server">
                           <Columns>
                               <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate> 
                                                    
                                            <asp:ImageButton ID="imgBtnEdit" ToolTip="Editar" runat="server" ImageUrl="~/img/Edit1.png" OnClick="imgBtnEdit_Click" />
                                            <asp:ImageButton ID="imgBtnEliminar" ToolTip="Borrar" runat="server" ImageUrl="~/img/close.png" data-toggle="modal" data-target="#myModal" OnClientClick="return fnc_Confirmar()" OnClick="imgBtnEliminar_Click"/>
                                            <%--<input type="hidden" runat="server" id="ID" value='<%#DataBinder.Eval(Container.DataItem,"Id") %>'/>--%>
                                        </ItemTemplate>
                                        <HeaderStyle BackColor="#EEEEEE" />
                                        <ItemStyle HorizontalAlign="right" VerticalAlign="Middle" Width="50px" BackColor="#EEEEEE" />
                                        <FooterTemplate>
                                            <asp:Label ID="label" Font-Bold="true" runat="server" Text="Total" />
                                        </FooterTemplate>
                                </asp:TemplateField>
                               
                               <asp:TemplateField HeaderText="Plantilla">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "Plantilla.Descripcion") %>
                                    </ItemTemplate>                    
                                </asp:TemplateField>

                               <asp:TemplateField HeaderText="Clave">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "Clave") %>
                                    </ItemTemplate>                    
                                </asp:TemplateField>

                               <asp:TemplateField HeaderText="Pregunta">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "Pregunta") %>
                                    </ItemTemplate>                    
                                </asp:TemplateField>
                               
                           </Columns>
                            <PagerSettings FirstPageText="Primera" LastPageText="Ultima" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
                       </asp:GridView>
                    </div>
                    <div id="divBtnNuevo" runat="server">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo"  CssClass="btn btn-default" OnClick="btnNuevo_Click" AutoPostBack="false" />
                        <asp:Button ID="btnRegresar" runat="server" Text="Regresar a Plantillas"  CssClass="btn btn-default" OnClick="btnRegresar_Click" AutoPostBack="false" />
                        
                    </div>
                    <div id="divCaptura" runat="server" >
                        <div class="row top-buffer">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Clave</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox Width="180px" ID="txtClave" Text="0" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row top-buffer">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Pregunta</strong></p>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox Width="650px" ID="txtPregunta" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="panel-footer" id="divGuardar" style="display:none" runat="server">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" CssClass="btn btn-default" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default" AutoPostBack="false" OnClientClick="return fnc_OcultarDivs()" />
                    
                </div> 

                <div class="panel-footer" id="divMsg" style="display:none" runat="server">
                    <asp:Label ID="lblMensajes" runat="server" Text=""></asp:Label>
                </div>

                <div runat="server" style="display:none">
                    <input type="hidden" runat="server" id="_Accion" />
                    <input type="hidden" runat="server" id="_IDPlantilla" />
                    <input type="hidden" runat="server" id="_IDPregunta" />
                    <input type="hidden" runat="server" id="_PageIndex" />
                </div>


                

                </div>
               
            </div>
        </div>
    </div>
     <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="smallModal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Confirmación</h4>
      </div>
      <div class="modal-body">
        <h3>¿Está seguro que desea eliminar el registro?</h3>
      </div>
      <div class="modal-footer">
        <asp:Button ID="btnDel" runat="server" CssClass="btn btn-default" Text="Aceptar"  />
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
        
    </div>
  </div>
</div>
</asp:Content>
