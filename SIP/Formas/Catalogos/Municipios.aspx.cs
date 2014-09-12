using BusinessLogicLayer;
using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SIP.Formas.Catalogos
{
    public partial class Municipios : System.Web.UI.Page
    {
        private UnitOfWork uow;
        protected void Page_Load(object sender, EventArgs e)
        {
            uow = new UnitOfWork();

            if (!IsPostBack) 
            {
                BindGrid();
                //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                //Manoelito BABY, quiero mis chuquiluquis
            }

           
        }


        private void BindGrid()
        {
            this.grid.DataSource = uow.MunicipioBusinessLogic.Get().ToList();
            this.grid.DataBind();
        }

        protected void imgBtnEdit_Click(object sender, ImageClickEventArgs e)
        {
            GridViewRow row = (GridViewRow)((ImageButton)sender).NamingContainer;
            _ID.Text = grid.DataKeys[row.RowIndex].Values["Id"].ToString();
           
            divEdicion.Style.Add("display", "block");
            divBtnNuevo.Style.Add("display", "none");

            int id=Convert.ToInt32(grid.DataKeys[row.RowIndex].Values["Id"].ToString());

            Municipio municipio = uow.MunicipioBusinessLogic.GetByID(id);

            BinCatalogoSimple(this, municipio.Nombre, municipio.Clave);            
           

        }

        protected void imgBtnEliminar_Click(object sender, ImageClickEventArgs e)
        {

        }


        public void BinCatalogoSimple(Control padre, string descripcion, string clave = "")
        {
            if (padre is HtmlInputText)
            {
                HtmlInputText t = (HtmlInputText)padre;

                if (t.Name.Contains("Nombre"))
                    t.Value = descripcion;
                

                if (!clave.Equals(""))
                    if (t.Name.Contains("Clave"))
                        t.Value = clave;
            }
            else if (padre is TextBox)
            {
                TextBox t = (TextBox)padre;
                if (t.ID.Contains("Nombre"))
                    t.Text = descripcion;
               

                if (!clave.Equals(""))
                    if (t.ID.Contains("Clave"))
                        t.Text = clave;

            }
            else if (padre.Controls.Count > 0)
            {
                foreach (Control c in padre.Controls)
                {
                    BinCatalogoSimple(c, descripcion,  clave);
                }
            }

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            string msg = "Se ha actualizado correctamente";

            //Recuperamos la descripcion
            string clave = txtClave.Value;
            string nombre = txtNombre.Value;

            Municipio municipio;

            if (_Accion.Text.Equals("N"))
                //Creamos un nuevo objeto de tipo bien
                municipio = new Municipio();
            else
                //Buscamos el objeto a actualizar
                municipio = uow.MunicipioBusinessLogic.GetByID(Convert.ToInt16(_ID.Text));

            municipio.Nombre = nombre;
            municipio.Clave = clave;


            //Se almacena el objeto
            if (_Accion.Text.Equals("N"))
                uow.MunicipioBusinessLogic.Insert(municipio);
            else
                uow.MunicipioBusinessLogic.Update(municipio);

            uow.SaveChanges();
           
            if (uow.Errors.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "script", "fnc_EjecutarMensaje('" + msg + "')", true);
            }
            else
            { 
                
            }
                

            //if (Utilerias.R != null && !Utilerias.R.Correcto) //Si hay problemas al guardar, se notifica al usuario
            //{
            //    msg = Utilerias.R.Mensaje;
            //    //Se limpia R
            //    Utilerias.R = null;
            //    ClientScript.RegisterStartupScript(this.GetType(), "script", "fnc_EjecutarMensaje('" + msg + "')", true);
            //    return;
            //}

            //Se limpian los controles
            txtNombre.Value = string.Empty;
            txtClave.Value = string.Empty;



            BindGrid();  //Se bindean los datos 
            divEdicion.Style.Add("display", "none");
            
            divBtnNuevo.Style.Add("display", "block");

            //ClientScript.RegisterStartupScript(this.GetType(), "script", "fnc_EjecutarMensaje('" + msg + "')", true);

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            _Accion.Text = "N";
            divEdicion.Style.Add("display", "block");
            divBtnNuevo.Style.Add("display", "none");
        }



    }
}