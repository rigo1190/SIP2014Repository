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
        protected void Page_Load(object sender, EventArgs e)
        {
            uow = new UnitOfWork();

            if (!IsPostBack)
            {
                BindGrid();
            }
            
        }

        private void BindGrid()
        {
            this.GridViewObras.DataSource = uow.POADetalleBusinessLogic.Get().ToList();
            this.GridViewObras.DataBind();
        }

        protected void imgBtnEdit_Click(object sender, ImageClickEventArgs e)
        {
            GridViewRow row = (GridViewRow)((ImageButton)sender).NamingContainer;
            _ID.Text = GridViewObras.DataKeys[row.RowIndex].Values["Id"].ToString();

            divEdicion.Style.Add("display", "block");
            divBtnNuevo.Style.Add("display", "none");

            int id = Convert.ToInt32(GridViewObras.DataKeys[row.RowIndex].Values["Id"].ToString());

            POADetalle poadetalle = uow.POADetalleBusinessLogic.GetByID(id);

            BinCatalogoSimple(this, poadetalle.Numero, poadetalle.Descripcion);            
        }

        protected void imgBtnEliminar_Click(object sender, ImageClickEventArgs e)
        {

        }

        public void BinCatalogoSimple(Control padre, string descripcion, string numero)
        {
            if (padre is HtmlInputText)
            {
                HtmlInputText t = (HtmlInputText)padre;

                if (t.Name.Contains("Descripcion"))
                    t.Value = descripcion;


                if (!numero.Equals(""))
                    if (t.Name.Contains("Numero"))
                        t.Value = numero;
            }
            else if (padre is TextBox)
            {
                TextBox t = (TextBox)padre;
                if (t.ID.Contains("Descripcion"))
                    t.Text = descripcion;


                if (!numero.Equals(""))
                    if (t.ID.Contains("Numero"))
                        t.Text = numero;

            }
            else if (padre.Controls.Count > 0)
            {
                foreach (Control c in padre.Controls)
                {
                    BinCatalogoSimple(c, descripcion, numero);
                }
            }

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {

        }



                

    }
}