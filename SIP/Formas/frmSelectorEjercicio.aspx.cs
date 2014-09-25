﻿using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIP.Formas
{
    public partial class frmSelectorEjercicio : System.Web.UI.Page
    {
        UnitOfWork uow;
        protected void Page_Load(object sender, EventArgs e)
        {
            uow = new UnitOfWork();

            if (!IsPostBack) 
            {
                BindearDropDownList();
            }

        }

        protected void ddlUnidadPresupuestal_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
        }

        protected void ddlEjercicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            Session["UnidadPresupuestalId"] = ddlUnidadPresupuestal.SelectedValue;
            Session["EjercicioId"] = ddlEjercicios.SelectedValue;     
            Response.Redirect("~/Formas/POA/POA.aspx");
        }

        private void BindearDropDownList()
        {
            
            ddlUnidadPresupuestal.DataSource = uow.UnidadPresupuestalBusinessLogic.Get().OrderBy(up=>up.Orden);
            ddlUnidadPresupuestal.DataValueField = "Id";
            ddlUnidadPresupuestal.DataTextField = "Nombre";
            ddlUnidadPresupuestal.DataBind();

            ddlUnidadPresupuestal.Items.Insert(0, new ListItem("Seleccione...", "0"));

            
            ddlEjercicios.DataSource = uow.EjercicioBusinessLogic.Get().OrderBy(up => up.Año);
            ddlEjercicios.DataValueField = "Id";
            ddlEjercicios.DataTextField = "Año";
            ddlEjercicios.DataBind();

            ddlEjercicios.Items.Insert(0, new ListItem("Seleccione...", "0"));


        }

       

       


    }
}