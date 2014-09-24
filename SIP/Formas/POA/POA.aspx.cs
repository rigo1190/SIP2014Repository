using BusinessLogicLayer;
using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SIP.Formas.POA
{
    public partial class POA : System.Web.UI.Page
    {
        private UnitOfWork uow;
        private int currentId;        
        private int unidadpresupuestalId;
        private int ejercicioId;
        protected void Page_Load(object sender, EventArgs e)
        {
            uow = new UnitOfWork();
               
            if (!IsPostBack)
            {
                
                unidadpresupuestalId = Utilerias.StrToInt(Session["UnidadPresupuestalId"].ToString());
                ejercicioId = Utilerias.StrToInt(Session["EjercicioId"].ToString());

                lblTituloPOA.Text = String.Format("POA proyectado ejercicio {0}", 2014);
                BindGrid();
                BindearDropDownList();
            }
            
        }
       
        private void BindGrid()
        {

            this.GridViewObras.DataSource = uow.POADetalleBusinessLogic.Get(o=>o.POA.UnidadPresupuestalId==unidadpresupuestalId).ToList();
            this.GridViewObras.DataBind();
        }
              
        
        public void BindControles(POADetalle poadetalle)
        {

            txtNumero.Value = poadetalle.Numero;
            txtDescripcion.Value = poadetalle.Descripcion;
            ddlMunicipio.SelectedValue = poadetalle.MunicipioId.ToString();
            ddlTipoLocalidad.SelectedValue = poadetalle.TipoLocalidadId.ToString();

            BindearDropDownListPrograma(ddlPrograma, poadetalle);
            BindearDropDownListSubPrograma(ddlSubprograma, poadetalle);
            BindearDropDownListSubSubPrograma(ddlTipologia, poadetalle);
            BindearDropDownListMeta(ddlMeta, poadetalle);            
           
            txtLocalidad.Value = poadetalle.Localidad;            
            txtNumeroBeneficiarios.Value = poadetalle.NumeroBeneficiarios.ToString();
            txtCantidadUnidades.Value = poadetalle.CantidadUnidades.ToString();
            ddlSituacionObra.SelectedValue = poadetalle.SituacionObraId.ToString();
            ddlModalidad.SelectedValue = ((int)poadetalle.ModalidadObra).ToString();
            txtImporteTotal.Value = poadetalle.ImporteTotal.ToString();
            txtObservaciones.Value = poadetalle.Observaciones;
            
        }
             

       

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            //Se limpian los controles

            txtNumero.Value = String.Empty;
            txtDescripcion.Value = String.Empty;
            ddlMunicipio.SelectedIndex = -1;
            txtLocalidad.Value = String.Empty;
            ddlTipoLocalidad.SelectedIndex = -1;
            txtEsAccion.Checked = false;
            ddlPrograma.SelectedIndex = -1;
            ddlSubprograma.Items.Clear();
            ddlTipologia.Items.Clear();
            ddlMeta.Items.Clear();
            txtNumeroBeneficiarios.Value = String.Empty;
            txtCantidadUnidades.Value = String.Empty;
            ddlSituacionObra.SelectedIndex = -1;
            ddlModalidad.SelectedIndex = -1;
            txtImporteTotal.Value = String.Empty;
            txtObservaciones.Value = String.Empty;


            divEdicion.Style.Add("display", "block");
            divBtnNuevo.Style.Add("display", "none");
            _Accion.Text = "N";
        }

        protected void imgBtnEdit_Click(object sender, ImageClickEventArgs e)
        {

            GridViewRow row = (GridViewRow)((ImageButton)sender).NamingContainer;
            _ID.Text = GridViewObras.DataKeys[row.RowIndex].Values["Id"].ToString();

            currentId = Convert.ToInt32(GridViewObras.DataKeys[row.RowIndex].Values["Id"].ToString());

            POADetalle poadetalle = uow.POADetalleBusinessLogic.GetByID(currentId);

            BindControles(poadetalle);

            divEdicion.Style.Add("display", "block");
            divBtnNuevo.Style.Add("display", "none");
            _Accion.Text = "A";
        }

        protected void imgBtnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            //Se busca l ID de la fila seleccionada
            GridViewRow row = (GridViewRow)((ImageButton)sender).NamingContainer;
            string msg = "Se ha eliminado correctamente";

            currentId = Utilerias.StrToInt(GridViewObras.DataKeys[row.RowIndex].Value.ToString());

            POADetalle poadetalle = uow.POADetalleBusinessLogic.GetByID(currentId);

            //Se elimina el objeto
            uow.POADetalleBusinessLogic.Delete(poadetalle);
            uow.SaveChanges();

            if (uow.Errors.Count > 0) //Si hubo errores
            {
                msg = string.Empty;
                foreach (string cad in uow.Errors)
                    msg += cad;

                lblMensajes.Text = msg;
                return;
            }

            BindGrid();
            divEdicion.Style.Add("display", "none");
            divBtnNuevo.Style.Add("display", "block");
            divMsg.Style.Add("display", "block");
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {          
            
            string msg = "Se ha guardado correctamente";

            unidadpresupuestalId = Utilerias.StrToInt(Session["UnidadPresupuestalId"].ToString());
            ejercicioId = Utilerias.StrToInt(Session["EjercicioId"].ToString());

            DataAccessLayer.Models.POA poa = uow.POABusinessLogic.Get(p => p.UnidadPresupuestalId == unidadpresupuestalId).FirstOrDefault();
            POADetalle poadetalle = null;

            if (poa == null) 
            {
                poa = new DataAccessLayer.Models.POA();
                poa.UnidadPresupuestalId = unidadpresupuestalId;
                poa.EjercicioId = ejercicioId;
            }
      
                       

            if (_Accion.Text.Equals("N"))
                poadetalle = new POADetalle();
            else
            {
                currentId = Convert.ToInt32(_ID.Text);
                poadetalle = uow.POADetalleBusinessLogic.GetByID(currentId);
                msg = "Se ha actualizado correctamente";
            }
                       
            poadetalle.Numero = txtNumero.Value;
            poadetalle.Descripcion = txtDescripcion.Value;
            poadetalle.MunicipioId = Convert.ToInt32(ddlMunicipio.SelectedValue);
            poadetalle.Localidad = txtLocalidad.Value;
            poadetalle.TipoLocalidadId = Convert.ToInt32(ddlTipoLocalidad.SelectedValue);
            poadetalle.EsAccion = txtEsAccion.Checked;
            poadetalle.AperturaProgramaticaId = Convert.ToInt32(ddlTipologia.SelectedValue);
            poadetalle.AperturaProgramaticaMetaId = Convert.ToInt32(ddlMeta.SelectedValue);
            poadetalle.NumeroBeneficiarios = Convert.ToInt32(txtNumeroBeneficiarios.Value);
            poadetalle.CantidadUnidades = Convert.ToInt32(txtCantidadUnidades.Value);
            poadetalle.SituacionObraId = Convert.ToInt32(ddlSituacionObra.SelectedValue);
            poadetalle.ModalidadObra = (enumModalidadObra)Convert.ToInt32(ddlModalidad.SelectedValue);
            poadetalle.ImporteTotal = Convert.ToDecimal(txtImporteTotal.Value);
            poadetalle.Observaciones = txtObservaciones.InnerText;

            if (_Accion.Text.Equals("N")) 
            {
                poadetalle.POA = poa;
                uow.POADetalleBusinessLogic.Insert(poadetalle);
            }               
            else
            {
                uow.POADetalleBusinessLogic.Update(poadetalle);
            }

            uow.SaveChanges();

            if (uow.Errors.Count > 0)
            {
                msg = string.Empty;
                foreach (string cad in uow.Errors)
                    msg += cad;

                lblMensajes.Text = msg;
                return;
            }

            lblMensajes.Text = msg;

           


            BindGrid();  //Se bindean los datos 
            divEdicion.Style.Add("display", "none");
            divMsg.Style.Add("display", "block");
            divBtnNuevo.Style.Add("display", "block");        


        }

        private void BindearDropDownList()
        {          

            //Se carga informnacion en el drop de Municipios

            ddlPrograma.DataSource = uow.AperturaProgramaticaBusinessLogic.Get(ap=> ap.ParentId==null && ap.EjercicioId==6).OrderBy(ap=>ap.Orden);
            ddlPrograma.DataValueField = "Id";
            ddlPrograma.DataTextField = "Nombre";
            ddlPrograma.DataBind();            
                
            ddlPrograma.Items.Insert(0, new ListItem("Seleccione...", "0"));


            ddlMunicipio.DataSource = uow.MunicipioBusinessLogic.Get().ToList();
            ddlMunicipio.DataValueField = "Id";
            ddlMunicipio.DataTextField = "Nombre";            
            ddlMunicipio.DataBind();

            ddlMunicipio.Items.Insert(0, new ListItem("Seleccione...", "0"));

            ddlTipoLocalidad.DataSource = uow.TipoLocalidadBusinessLogic.Get().ToList();
            ddlTipoLocalidad.DataValueField = "Id";
            ddlTipoLocalidad.DataTextField = "Nombre";
            ddlTipoLocalidad.DataBind();

            ddlTipoLocalidad.Items.Insert(0, new ListItem("Seleccione...", "0"));

            ddlTipologia.DataSource = uow.AperturaProgramaticaBusinessLogic.Get(ap=>ap.ParentId==16).ToList();
            ddlTipologia.DataValueField = "Id";
            ddlTipologia.DataTextField = "Nombre";
            ddlTipologia.DataBind();

            ddlTipologia.Items.Insert(0, new ListItem(String.Empty, "0"));

            ddlSituacionObra.DataSource = uow.SituacionObraBusinessLogic.Get().ToList();
            ddlSituacionObra.DataValueField = "Id";
            ddlSituacionObra.DataTextField = "Nombre";
            ddlSituacionObra.DataBind();

            ddlSituacionObra.Items.Insert(0, new ListItem("Seleccione...", "0"));

            BindDropDownToEnum(ddlModalidad, typeof(enumModalidadObra));

           
        }


        public void BindDropDownToEnum(DropDownList dropDown,Type enumType) 
        {
            string[] names = Enum.GetNames(enumType);
            int[] values = (int[])Enum.GetValues(enumType);
            for (int i = 0; i < names.Length; i++)
            {
                dropDown.Items.Add(
                   new ListItem(
                     names[i],
                     values[i].ToString()
                    )
                );
                                
            }

            dropDown.Items.Insert(0, new ListItem("Seleccione...", "0"));
        }

        protected void ddlPrograma_SelectedIndexChanged(object sender, EventArgs e)
        {
             DropDownList ctrol = sender as DropDownList;

            int programaId = Convert.ToInt32(ctrol.SelectedValue);

            ddlSubprograma.Items.Clear();
            ddlTipologia.Items.Clear();
            ddlMeta.Items.Clear();

            ddlSubprograma.DataSource = uow.AperturaProgramaticaBusinessLogic.Get(ap => ap.ParentId == programaId).OrderBy(r=>r.Orden);
            ddlSubprograma.DataValueField = "Id";
            ddlSubprograma.DataTextField = "Nombre";
            ddlSubprograma.DataBind();

            ddlSubprograma.Items.Insert(0, new ListItem("Seleccione ...", "0"));

        }
             
        protected void ddlSubprograma_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ctrol = sender as DropDownList;

            int subprogramaId = Convert.ToInt32(ctrol.SelectedValue);
           
            ddlTipologia.DataSource = uow.AperturaProgramaticaBusinessLogic.Get(ap => ap.ParentId == subprogramaId).OrderBy(ap => ap.Orden);
            ddlTipologia.DataValueField = "Id";
            ddlTipologia.DataTextField = "Nombre";
            ddlTipologia.DataBind();

            ddlTipologia.Items.Insert(0, new ListItem("Seleccione...", "0"));
        }

        protected void ddlTipologia_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ctrol = sender as DropDownList;

            int subsubprogramaId = Convert.ToInt32(ctrol.SelectedValue);

            ddlMeta.DataSource = uow.AperturaProgramaticaMetaBusinessLogic.Get(ap => ap.AperturaProgramaticaId == subsubprogramaId);
            ddlMeta.DataValueField = "Id";
            ddlMeta.DataTextField = "Descripcion";
            ddlMeta.DataBind();

            ddlMeta.Items.Insert(0, new ListItem("Seleccione...", "0"));

        }
        
        private void BindearDropDownListPrograma(DropDownList ddl, POADetalle poadetalle)
        {

            int programaId = poadetalle.AperturaProgramatica.Parent.Parent.Id;

            ddl.DataSource = uow.AperturaProgramaticaBusinessLogic.Get(ap => ap.ParentId == null).OrderBy(ap => ap.Orden);
            ddl.DataValueField = "Id";
            ddl.DataTextField = "Nombre";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("Seleccione", "0"));

            ddl.SelectedValue = programaId.ToString();

        }

        private void BindearDropDownListSubPrograma(DropDownList ddl, POADetalle poadetalle)
        {

            int programaId = poadetalle.AperturaProgramatica.Parent.Parent.Id;
            int subprogramaId = poadetalle.AperturaProgramatica.Parent.Id;

            ddl.DataSource = uow.AperturaProgramaticaBusinessLogic.Get(ap => ap.ParentId == programaId).OrderBy(ap => ap.Orden);
            ddl.DataValueField = "Id";
            ddl.DataTextField = "Nombre";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("Seleccione ...", "0"));

            ddl.SelectedValue = subprogramaId.ToString();

        }

        private void BindearDropDownListSubSubPrograma(DropDownList ddl, POADetalle poadetalle)
        {

            int subprogramaId = poadetalle.AperturaProgramatica.Parent.Id;

            ddl.DataSource = uow.AperturaProgramaticaBusinessLogic.Get(ap => ap.ParentId == subprogramaId).OrderBy(ap => ap.Orden);
            ddl.DataValueField = "Id";
            ddl.DataTextField = "Nombre";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("Seleccione ...", "0"));

            ddl.SelectedValue = poadetalle.AperturaProgramaticaId.ToString();

        }

        private void BindearDropDownListMeta(DropDownList ddl, POADetalle poadetalle)
        {

            ddl.DataSource = uow.AperturaProgramaticaMetaBusinessLogic.Get(m => m.AperturaProgramaticaId == poadetalle.AperturaProgramaticaId);
            ddl.DataValueField = "Id";
            ddl.DataTextField = "Descripcion";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("Seleccione ...", "0"));

            ddl.SelectedValue = poadetalle.AperturaProgramaticaMetaId.ToString();

        }

       

                

    }
}