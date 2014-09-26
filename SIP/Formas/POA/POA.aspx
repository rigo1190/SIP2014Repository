<%@ Page Title="" Language="C#" MasterPageFile="~/NavegadorPrincipal.Master" AutoEventWireup="true" CodeBehind="POA.aspx.cs" Inherits="SIP.Formas.POA.POA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">

         $(document).ready(function () {
             $("#<%=txtNumero.ClientID %>").attr('maxlength', '50');
        });

         function fnc_Validar() {


             var numero = $("#<%=txtNumero.ClientID%>").val();
             if (numero == null || numero.length == 0 || numero == undefined) {
                 alert("El campo Número no puede estar vacio");
                 return false;
             }

            var desc = $("#<%=txtDescripcion.ClientID%>").val();
            if (desc == null || desc.length == 0 || desc == undefined) {
                alert("El campo descripción no puede estar vacio");
                return false;
            }

            var municipio = $("#<%=ddlMunicipio.ClientID%>").val();
             if (municipio == null || municipio.length == 0 || municipio == undefined || municipio == 0) {
                alert("El campo Municipio no puede estar vacio");
                return false;
            }

             var localidad = $("#<%=txtLocalidad.ClientID%>").val();
             if (localidad == null || localidad.length == 0 || localidad == undefined) {
                 alert("El campo Localidad no puede estar vacio");
                 return false;
             }

             var tipolocalidad = $("#<%=ddlTipoLocalidad.ClientID%>").val();
             if (tipolocalidad == null || tipolocalidad.length == 0 || tipolocalidad == undefined || tipolocalidad == 0) {
                 alert("Debe indicar el tipo de localidad");
                 return false;
             }

             var subsubprograma = $("#<%=ddlTipologia.ClientID%>").val();
             if (subsubprograma == null || subsubprograma.length == 0 || subsubprograma == undefined || subsubprograma == 0) {
                 alert("Debe indicar el tipo de la apertura programatica");
                 return false;
             }

             var meta = $("#<%=ddlMeta.ClientID%>").val();
             if (meta == null || meta.length == 0 || meta == undefined || meta == 0) {
                 alert("Debe indicar la unidad y beneficiario de la meta");
                 return false;
             }

             var numeroBeneficiarios = $("#<%=txtNumeroBeneficiarios.ClientID%>").val();
             if (numeroBeneficiarios == null || numeroBeneficiarios.length == 0 || numeroBeneficiarios == undefined) {
                 alert("El campo Número de beneficiarios no puede estar vacio");
                 return false;
             }

             var cantidadUnidades = $("#<%=txtCantidadUnidades.ClientID%>").val();
             if (cantidadUnidades == null || cantidadUnidades.length == 0 || cantidadUnidades == undefined) {
                 alert("El campo Cantidad de Unidades no puede estar vacio");
                 return false;
             }

             var situacionObra = $("#<%=ddlSituacionObra.ClientID%>").val();
             if (situacionObra == null || situacionObra.length == 0 || situacionObra == undefined || situacionObra == 0) {
                 alert("Debe indicar la situación de la obra");
                 return false;
             }

             var modalidad = $("#<%=ddlModalidad.ClientID%>").val();
             if (modalidad == null || modalidad.length == 0 || modalidad == undefined || modalidad == 0) {
                 alert("Debe indicar la modalidad de la obra");
                 return false;
             }

             var importetotal = $("#<%=txtImporteTotal.ClientID%>").val();
             if (importetotal == null || importetotal.length == 0 || importetotal == undefined) {
                 alert("El campo Importe total no puede estar vacio");
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
       
    
    <div class="container">

       <%--  <div>
                <asp:Label ID="lblTituloPOA" class="well" runat="server" Text=""></asp:Label>
         </div>--%>

        <div class="page-header">
  <h3><asp:Label ID="lblTituloPOA" runat="server" Text=""></asp:Label></h3>
</div>

        <asp:GridView Height="25px" ShowHeaderWhenEmpty="true" CssClass="table" ID="GridViewObras" DataKeyNames="Id" AutoGenerateColumns="False" runat="server" AllowPaging="True">
            <Columns>

                       <asp:TemplateField HeaderText="Acciones" ItemStyle-CssClass="col-md-1" HeaderStyle-CssClass="panel-footer">
                            <ItemTemplate>
                                                    
                                <asp:ImageButton ID="imgBtnEdit" ToolTip="Editar" runat="server" ImageUrl="~/img/Edit1.png" OnClick="imgBtnEdit_Click" />
                                <asp:ImageButton ID="imgBtnEliminar" ToolTip="Borrar" runat="server" ImageUrl="~/img/close.png" OnClientClick="return confirm('¿Está seguro de eliminar el registro?');" OnClick="imgBtnEliminar_Click"/>

                            </ItemTemplate>                         
                        </asp:TemplateField>     
                                         
                       <asp:TemplateField HeaderText="Numero" ItemStyle-CssClass="col-md-1" HeaderStyle-CssClass="panel-footer">                          
                            <ItemTemplate>
                                <asp:Label ID="LabelNumero" runat="server" Text='<%# Bind("Numero") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                       <asp:TemplateField HeaderText="Descripcion" ItemStyle-CssClass="col-md-3" HeaderStyle-CssClass="panel-footer">                            
                            <ItemTemplate>
                                <asp:Label ID="labelDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

            </Columns>
                    
            <PagerSettings FirstPageText="Primera" LastPageText="Ultima" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
                    
        </asp:GridView>

         <div id="divBtnNuevo" runat="server" style="display:block">
              <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" OnClick="btnNuevo_Click" AutoPostBack="false" />
         </div>

        <div id="divEdicion" runat="server" class="panel-footer" style="display:none">

             <div class="panel-footer alert alert-danger" id="divMsg" style="display:none" runat="server">
                <asp:Label ID="lblMensajes" runat="server" Text=""></asp:Label>
            </div>


            <div class="row">


                 <div class="col-md-4">

                      <div class="form-group">
                           <label for="Numero">Numero</label>
                         <div>
                            <input type="text" class="input-sm required form-control" id="txtNumero" runat="server" style="text-align: left; align-items:flex-start" autocomplete="off"/>                           
                        </div>
                      </div>

                     <div class="form-group">
                           <label for="Descripcion">Descripcion</label>
                         <div>
                            <textarea id="txtDescripcion" class="input-sm required form-control" runat="server" style="text-align: left; align-items:flex-start" rows="3"></textarea>
                        </div>
                      </div>

                     <div class="form-group">
                           <label for="Municipio">Municipio</label>
                         <div>
                             <asp:DropDownList ID="ddlMunicipio" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                      </div>

                      <div class="form-group">
                           <label for="Localidad">Localidad</label>
                         <div>
                            <input type="text" class="input-sm required form-control" id="txtLocalidad" runat="server" style="text-align: left; align-items:flex-start" />
                        </div>
                      </div>

                     <div class="form-group">
                           <label for="TipoLocalidad">Tipo de localidad</label>
                         <div>
                             <asp:DropDownList ID="ddlTipoLocalidad" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                      </div>

                     <div class="form-group">
                           <label for="EsAccion">Es acción</label>
                         <div>
                             <input type="checkbox" class="input-sm required form-control" id="txtEsAccion" runat="server" style="text-align: right; align-items:flex-start" />
                        </div>
                      </div>

                 </div>

                 <div class="col-md-4">

                      <div class="form-group">
                           <label for="Programa">Programa</label>
                         <div>
                             <asp:DropDownList OnSelectedIndexChanged="ddlPrograma_SelectedIndexChanged" ID="ddlPrograma" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
                        </div>
                      </div>

                      <div class="form-group">
                           <label for="SubPrograma">SubPrograma</label>
                         <div>
                             <asp:DropDownList ID="ddlSubprograma" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubprograma_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                      </div>

                       <div class="form-group">
                           <label for="SubSubPrograma">SubSubPrograma</label>
                         <div>
                             <asp:DropDownList ID="ddlTipologia" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTipologia_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                      </div>

                       <div class="form-group">
                           <label for="Metas">Metas</label>
                         <div>
                             <asp:DropDownList ID="ddlMeta" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                      </div>

                      <div class="form-group">
                           <label for="NumeroBeneficiarios">Número de beneficiarios</label>
                         <div>
                            <input type="text" class="input-sm required form-control" id="txtNumeroBeneficiarios" runat="server" style="text-align: left; align-items:flex-start" />
                        </div>
                      </div>

                       <div class="form-group">
                           <label for="CantidadUnidades">Cantidad de unidades</label>
                         <div>
                            <input type="text" class="input-sm required form-control" id="txtCantidadUnidades" runat="server" style="text-align: left; align-items:flex-start" />
                        </div>
                      </div>


                  </div>

                 <div class="col-md-4">

                      <div class="form-group">
                           <label for="SituacionObra">Situación</label>
                         <div>
                              <asp:DropDownList ID="ddlSituacionObra" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                      </div>

                      <div class="form-group">
                           <label for="ModalidadObra">Modalidad</label>
                         <div>
                              <asp:DropDownList ID="ddlModalidad" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                      </div>

                     <div class="form-group">
                           <label for="ImporteTotal">Importe total</label>
                         <div>
                            <input type="text" class="input-sm required form-control" id="txtImporteTotal" runat="server" style="text-align: left; align-items:flex-start" />
                        </div>
                      </div>

                     <div class="form-group">
                           <label for="Observaciones">Observaciones</label>
                         <div>
                            <textarea id="txtObservaciones" class="input-sm required form-control" runat="server" style="text-align: left; align-items:flex-start" rows="4"></textarea>
                        </div>
                      </div>

                 </div>
                

            </div>
                      
                                            
            <div class="form-group">
                <asp:Button  CssClass="btn btn-default" Text="Guardar" ID="btnGuardar" runat="server" OnClientClick="return fnc_Validar()" OnClick="btnGuardar_Click" AutoPostBack="false" />
                <asp:Button  CssClass="btn btn-default" Text="Cancelar" ID="btnCancelar" runat="server" OnClientClick="return fnc_OcultarDivs()" AutoPostBack="false" />
            </div>                      

             <div style="display:none" runat="server">
                <asp:TextBox ID="_ID" runat="server" Enable="false" BorderColor="White" BorderStyle="None" ForeColor="White"></asp:TextBox>
                <asp:TextBox ID="_Accion" runat="server" Enable="false" BorderColor="White" BorderStyle="None" ForeColor="White"></asp:TextBox>                                    
             </div>
                       
            <%--  <div class="panel-footer" id="divMsg" style="display:none" runat="server">
                <asp:Label ID="lblMensajes" runat="server" Text="XXXXX?XXXXXXXXX"></asp:Label>
            </div>--%>

           

       </div>

    </div>
          

</asp:Content>
