<%@ Page Title="" Language="C#" MasterPageFile="~/NavegadorCatalogos.Master" AutoEventWireup="true" CodeBehind="PlantillasPadre.aspx.cs" Inherits="SIP.Formas.Catalogos.PlantillasPadre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         var id = 0;
         $(document).ready(function () {
             try {

                $("#<%= divArbol.ClientID %>").bind("contextmenu", function (e) {
                    e.preventDefault();
                    $("#custom-menu").css({ top: e.pageY + "px", left: e.pageX + "px" }).show(100);
                });

                $("#<%= divArbol.ClientID %>").mouseup(function (e) {
                    var container = $("#custom-menu");
                    if (container.has(e.target).length == 0) {
                        container.hide();
                    }
                });

                $(document).bind(function () {
                    $(document).bind("contextmenu", function (e) {
                        return false;
                    });
                });

                $(document).mouseup(function (e) {
                    var container = $("#custom-menu");
                    if (container.has(e.target).length == 0) {
                        container.hide();
                    }
                });

                $('.evento').click(function () {
                    var control = $(this).attr("id");
                    $("#<%= treePlantilla.ClientID %>").attr("disabled", true)
                    fnc_ClickMenu(control);
                });
            }
            catch (err) {
                alert(err);
            }

        });


         function SetSelectedTreeNodeVisible(controlID) {

             var elem = document.getElementById("<%=treePlantilla.ClientID%>" + "_SelectedNode");
            if (elem != null) {
                var node = document.getElementById(elem.value);
                if (node != null) {
                    node.scrollIntoView(true);
                    $("#<%= divArbol.ClientID %>").scrollLeft = 0;
                }
            }

        }

        function fnc_ClickMenu(sender) {

            $("#<%= divGuardar.ClientID%>").css("display", "block"); //Se muestran los botones de guardar y cancelar
            $("#<%= btnCancelar.ClientID%>").css("display", "block"); //Se muestran los botones de guardar y cancelar
            $("#<%= btnGuardar2.ClientID%>").css("display", "block"); //Se muestran los botones de guardar y cancelar
            $("#<%= divMsg.ClientID%>").css("display", "none"); //Se oculta el mensaje

            switch (sender) {

                case "<%= add.ClientID %>": //AGREGAR UNA PLANTILLA PADRE

                    //SE HABILITAN LOS CONTROLES PARA AGREGAR UN NUEVA PLNATILLA PADRE
                    $("#<%= txtDescripcion.ClientID%>").removeAttr("disabled");
                    $("#<%= txtClave.ClientID%>").removeAttr("disabled");
                    $("#<%= ddlEjercicio.ClientID%>").removeAttr("disabled");
                    $("#<%= txtOrden.ClientID%>").removeAttr("disabled");

                    //Se indica que se va a agregar un fondo padre, se coloca una  S en la caja de texto oculto _PAdre
                    $("#<%= _Padre.ClientID%>").val("S");

                    //Se indica que el estado de la forma es NUEVO, a traves del campo oculto Estado
                    $("#<%= _Accion.ClientID%>").val("N");


                    //Se limpian los controles
                    $("#<%= txtDescripcion.ClientID%>").val("");
                    $("#<%= txtClave.ClientID%>").val("");
                    $("#<%= ddlEjercicio.ClientID%>").selectedindex = 0;
                    $("#<%= txtOrden.ClientID%>").val("");


                    break;

                case "<%= adds.ClientID %>": //AGREGAR SUBPLANTILLA

                    var idPadre = parseInt($("#<%= _IDPlantilla.ClientID%>").val());

                    if (idPadre != 0) {
                        //SE HABILITAN LOS CONTROLES PARA AGREGAR NUEVA PLNATILLA PADRE
                        $("#<%= txtDescripcion.ClientID%>").removeAttr("disabled");
                        $("#<%= txtClave.ClientID%>").removeAttr("disabled");
                        $("#<%= ddlEjercicio.ClientID%>").removeAttr("disabled");
                        $("#<%= txtOrden.ClientID%>").removeAttr("disabled");

                        //Se indica que se va a agregar un subfondo, se coloca una N en la caja de texto oculto_PAdre
                        $("#<%= _Padre.ClientID%>").val("N");

                        //Se indica que el estado de la forma es NUEVO, a traves del campo oculto Estado
                        $("#<%= _Accion.ClientID%>").val("N");

                        //Se limpian los controles
                        $("#<%= txtDescripcion.ClientID%>").val("");
                        $("#<%= txtClave.ClientID%>").val("");
                        $("#<%= ddlEjercicio.ClientID%>").selectedindex = 0;
                        $("#<%= txtOrden.ClientID%>").val("");
                    }
                    break;

                case "<%= edit.ClientID %>": //EDITAR UN REGISTRO
                    //SE HABILITAN LOS CONTROLES PARA EDITAR EL REGISTRO
                    $("#<%= txtDescripcion.ClientID%>").removeAttr("disabled");
                    $("#<%= txtClave.ClientID%>").removeAttr("disabled");
                    $("#<%= ddlEjercicio.ClientID%>").removeAttr("disabled");
                    $("#<%= txtOrden.ClientID%>").removeAttr("disabled");

                    //Se indica que el estado de la forma es EDICION, a traves del campo oculto Estado
                    $("#<%= _Accion.ClientID%>").val("A");
                    break;

            }


            //Se inhabilitan los botnes de agregar PLANTILLA, SUBPLANTILLA y ELIMINAR, y el propio arbol
            $("#<%= add.ClientID %>").attr("disabled", true)
            $("#<%= adds.ClientID %>").attr("disabled", true)
            $("#<%= btnDel.ClientID %>").attr("disabled", true)
            $("#btnBorrar").attr("disabled", true);
            $("#btnPD").attr("disabled", true);
            $("#btnPD2").attr("disabled", true);
            $("#<%= edit.ClientID %>").attr("disabled", true)
            $("#<%= divArbol.ClientID %>").attr("disabled", true)

            $("#custom-menu").hide();

           
        }

         function fnc_OcultarMC() {
            var container = $("#custom-menu");
            container.hide();

         }

        function fnc_Validar() {

            var desc = $("#<%=txtDescripcion.ClientID%>").val();
            if (desc == null || desc.length == 0 || desc == undefined) {
                fnc_EjecutarMensaje("La descripcion no puede ir vacia");
                return false;
            }
            return true;
        }

         function fnc_IrPreguntasDetalle() {
             var url = "PlantillaPreguntas.aspx?p=" + $("#<%=_IDPlantilla.ClientID%>").val();
             $(location).attr('href', url);
         }

    </script>
     <style type="text/css">
        
        
        #custom-menu
        {
        z-index: 1000;
        position: absolute;
        border: solid 2px black;
        background-color: white;
        padding: 5px 0;
        display: none;
        }
        #custom-menu ol
        {
        padding: 0;
        margin: 0;
        list-style-type: none;
        min-width: 130px;
        width: auto;
        max-width: 200px;
        font-family:Verdana;
        font-size:12px;
        }
        #custom-menu ol li
        {
        margin: 0;
        display: block;
        list-style: none;
        padding: 5px 5px;
        }
        #custom-menu ol li:hover
        {
        background-color: #efefef;
        }

        #custom-menu ol li:active
        {
        color: White;
        background-color: #000;
        }

        #custom-menu ol .list-devider
        {
        padding: 0px;
        margin: 0px;
        }

        #custom-menu ol .list-devider hr
        {
        margin: 2px 0px;
        }

        #custom-menu ol li a
        {
        color: Black;
        text-decoration: none;
        display: block;
        padding: 0px 5px;
        }
        #custom-menu ol li a:active
        {
        color: White;
        }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
        <div class="row"> 
            <div id="divPlantilla" >
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Catálogo de Plantillas</h3>
                    </div>
                    <div class="panel-body" id="divArbol" style="height:150px; overflow:scroll" runat="server"> 
                        <asp:TreeView runat="server" SelectedNodeStyle-ForeColor="Black" AutoPostBack="false" ID="treePlantilla"  ShowLines="True"  NodeIndent="25"  AutoGenerateDataBindings="False" Width="117px" OnSelectedNodeChanged="treePlantilla_SelectedNodeChanged" >
                            <ParentNodeStyle Font-Bold="true" />  
                            <SelectedNodeStyle Font-Bold="true" BackColor="LightGray" ForeColor="Green" />  
                        </asp:TreeView>
                         <div id="custom-menu">
                                <ol>
                                <li>
                                    <asp:Button ID="add" Width="160px" AutoPostBack="false" CssClass="btn btn-default evento" OnClientClick="return false" runat="server" Text="Agregar Plantilla" /> </li>
                                <li>
                                    <asp:Button ID="adds" Width="160px" AutoPostBack="false" CssClass="btn btn-default evento" OnClientClick="return false" runat="server" Text="Agregar SubPlantilla" /> 
                                </li>
                                <li class="list-devider">
                                <hr />
                                </li>
                                <li>
                                    <asp:Button ID="edit" Width="160px" AutoPostBack="false" OnClientClick="return false" CssClass="btn btn-default evento" runat="server" Text="Editar" /> 
                                </li>
                                
                                <li><input id="btnBorrar" style="width:160px"  data-toggle="modal" data-target="#myModal" class="btn btn-default" onclick="fnc_OcultarMC()" type="button" value="Borrar" /></li>
                                <li>
                                    <input type="button" style="width:160px" id="btPD2" onclick="fnc_IrPreguntasDetalle()" runat="server" class="btn btn-default" value="Detalle Preguntas"/> 
                                </li>
                                
                                <li><asp:Button ID="btnGuardar2"  Width="160px" runat="server" Text="Guardar" OnClick="btnGuardar_Click" OnClientClick="return fnc_Validar()" CssClass="btn btn-default" /></li>
                                <li><asp:Button ID="btnCancelar" Width="160px" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CssClass="btn btn-default" AutoPostBack="false" /></li>
                                <li class="list-devider">
                                <hr />
                                </li>
                                </ol>
                            </div> 
                    </div>
                </div>
             </div>
        </div>
        
        <div class="row">
            <div id="divCaptura" class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Datos de la Plantilla</h3>
                    </div>
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
                            <p class="text-right"><strong>Descripción</strong></p>
                        </div>
                        <div class="col-md-10">
                            <asp:TextBox Width="800px" Height="60px" TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                   <div class="row top-buffer">
                       <div class="col-md-2">  
                            <p class="text-right"><strong>Ejercicio</strong></p>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList  Width="180px" ID="ddlEjercicio" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                   <div class="row top-buffer">
                       <div class="col-md-2"> 
                            <p class="text-right"><strong>Orden</strong></p>
                        </div>
                        <div class="col-md-6">
                            <input type="number" class="form-control" id="txtOrden" runat="server" />
                        </div>
                    </div>
                     <div class="row top-buffer">
                       <div class="col-md-2"> 
                            <p class="text-right"><strong>Detalle de preguntas</strong></p>
                        </div>
                        <div class="col-md-6">
                            <button type="button" style="width:160px" id="btnPD" onclick="fnc_IrPreguntasDetalle()" runat="server" class="btn btn-default"> <span class="glyphicon glyphicon-folder-open"></span></button>
                            
                        </div>
                    </div>
               <div>

               </div>

                <div class="panel-footer" id="divGuardar" runat="server">
                    
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClientClick="return fnc_Validar()" OnClick="btnGuardar_Click" CssClass="btn btn-default" />
                    <asp:Button ID="btnCancelar2" runat="server" Text="Cancelar" CssClass="btn btn-default" OnClick="btnCancelar_Click" AutoPostBack="false" OnClientClick="return fnc_OcultarDivs()" />
                </div> 

                 <div class="panel-footer" id="divMsg" style="display:none" runat="server">
                    <asp:Label  ID="lblMensajes" runat="server"></asp:Label>
                </div>

            </div>
        </div>

         
       
        <div runat="server" style="display:none">
            <input type="hidden" runat="server" id="_Accion" />
            <input type="hidden" runat="server" id="_IDPlantilla" />
            <input type="hidden" runat="server" id="_Padre" />
            <input type="hidden" runat="server" id="_rutaNodoSeleccionado" />
            <input type="hidden" runat="server" id="_PageIndex" />
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
        <asp:Button ID="btnDel" runat="server" CssClass="btn btn-default" Text="Aceptar" OnClick="btnDel_Click"  />
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
        
    </div>
  </div>
</div>
</asp:Content>
