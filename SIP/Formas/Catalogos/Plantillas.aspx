<%@ Page Title="" Language="C#" MasterPageFile="~/NavegadorCatalogos.Master" AutoEventWireup="true" CodeBehind="Plantillas.aspx.cs" Inherits="SIP.Formas.Catalogos.Plantillas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
        <div class="row">
            <div id="divAnexo" runat="server">
                <div class="panel panel-success">
                    <div class="panel-heading">
                            <h3 id="titulo" runat="server" class="panel-title">Anexo Pasivos Proveedores</h3>
                    </div>
                     <div class="panel-body">
                    <div class="row">
                       <asp:GridView CssClass="table table-striped table-bordered grid sortable {disableSortCols: [0, 5, 8,9,10]}" Width="100%" OnRowDataBound="grid_RowDataBound" ShowFooter="true" AutoGenerateColumns="false" ID="grid" DataKeyNames="ID"  runat="server">
                           <Columns>
                               <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate> 
                                                    
                                            <asp:ImageButton ID="imgBtnEdit" ToolTip="Editar" runat="server" ImageUrl="~/img/Edit1.png" OnClick="imgBtnEdit_Click" />
                                            <asp:ImageButton ID="imgBtnEliminar" ToolTip="Borrar" runat="server" ImageUrl="~/img/close.png" OnClientClick="return fnc_Confirmar()" OnClick="imgBtnEliminar_Click"/>
                                            
                                        </ItemTemplate>
                                        <HeaderStyle BackColor="#EEEEEE" />
                                        <ItemStyle HorizontalAlign="right" VerticalAlign="Middle" Width="50px" BackColor="#EEEEEE" />
                                        <FooterTemplate>
                                            <asp:Label ID="label" Font-Bold="true" runat="server" Text="Total" />
                                        </FooterTemplate>
                                </asp:TemplateField>
                               
                               <asp:TemplateField HeaderText="Clave">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "Clave") %>
                                    </ItemTemplate>                    
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Descripción">
                                        <ItemTemplate>
                                             <%# DataBinder.Eval(Container.DataItem, "Descripcion") %>
                                        </ItemTemplate>          
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ejercicio">
                                        <ItemTemplate>
                                                <asp:Label ID="lblEjercicio" Font-Bold="true" runat="server"/>
                                        </ItemTemplate>                    
                                </asp:TemplateField>

                               <asp:TemplateField HeaderText="Detalle preguntas">
                                        <ItemTemplate>
                                                <button type="button" id="btnParcial" onserverclick="btnParcial_ServerClick" runat="server" class="btn btn-default"> <span class="glyphicon glyphicon-folder-open"></span></button>
                                                
                                        </ItemTemplate>
                                         <HeaderStyle HorizontalAlign="Center" BackColor="#EEEEEE" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" BackColor="#EEEEEE" />                    
                                </asp:TemplateField>

                           </Columns>
                            <PagerSettings FirstPageText="Primera" LastPageText="Ultima" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
                       </asp:GridView>
                    </div>
                    <div id="divBtnNuevo" runat="server">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click" AutoPostBack="false" />
                        <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-default" OnClick="btnRegresar_Click" />
                    </div>
                    <div id="divCaptura" runat="server">
                        <div class="row top-buffer" runat="server" id="divFondo">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Nombre Proveedor</strong></p>
                                
                            </div>
                            <div class="col-md-5">
                                <%--<asp:DropDownList Width="950px" ID="ddlProveedor" CssClass="form-control" runat="server"></asp:DropDownList>--%>
                                <input type="hidden" runat="server" id="__hIdProveedor" />
                                <asp:TextBox ID="txtProveedor" runat="server" CssClass="form-control"></asp:TextBox>
                                
                                <div id="msgProv" style="display:none">
                                    <span>&nbsp;</span>
                                    <span class="span">Ese proveedor no está en la lista. Verifíquelo por favor o pídale al administrador de catálogos que lo agregue.</span>
                                </div>

                                
                                
                            </div>
                            <div class="col-md-1">
                                <input type="image" src="../../img/close.png" id="btnCambiarProv" onclick="return false;" />
                                <input type="hidden" runat="server" id="__estado" />
                            </div>
                            
                        </div>
                        <div class="row top-buffer">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Monto</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox Width="180px" ID="txtMonto" Text="0" CssClass="form-control numeric" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row top-buffer">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Antiguedad</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox Width="180px" ID="txtAntiguedad" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row top-buffer" runat="server" id="div1">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Documento Legal</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList Width="180px" ID="ddlDocto" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="row top-buffer" runat="server" id="div4">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Num. de Docto. Legal</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox Width="180px" ID="txtNumDocto" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row top-buffer" runat="server" id="div2">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Proceso Legal/Administrativo</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList Width="180px" ID="ddlProceso" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>

                         <div class="row top-buffer" runat="server" id="div5">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Ejercicio deuda</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList Width="100px" ID="ddlAniosDeuda" CssClass="form-control" runat="server">
                                   
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row top-buffer" runat="server" id="div6">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Pagado parcialmente</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:CheckBox ID="chkPagadoParciamlenteC" CssClass="evento" Font-Bold="True" runat="server" />
                            </div>
                        </div>


                         <div class="row top-buffer" runat="server" id="div7">
                            <div class="col-md-2">
                                <p class="text-right"><strong>Pagado</strong></p>
                            </div>
                            <div class="col-md-6">
                                <asp:CheckBox ID="chkPagado" Font-Bold="True"  runat="server" />
                            </div>
                        </div>


                    </div>
                </div>
                    <div class="panel-footer" id="divGuardar" runat="server">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" CssClass="btn btn-default" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default" AutoPostBack="false" OnClientClick="return fnc_OcultarDivs()" />
                     <asp:Label ID="lblMensajes" runat="server" Text=""></asp:Label>
                </div> 

                     <div runat="server" style="display:none">
                        <asp:TextBox ID="_Accion" runat="server" Enable="false" BorderColor="White" BorderStyle="None" ForeColor="White"></asp:TextBox>
                         <input type="hidden" runat="server" id="_IDPasivo" />
                         <asp:TextBox ID="_ID" runat="server" Enable="false" BorderColor="White" BorderStyle="None" ForeColor="White"></asp:TextBox>
                         <input type="hidden" runat="server" id="_PageIndex" />
                    </div>
                </div>
               
            </div>
        </div>
    </div>


</asp:Content>
