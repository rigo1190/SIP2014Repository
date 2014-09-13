using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BusinessLogicLayer
{
    public static class Utilerias
    {

        public static void LimpiarCampos(Control padre)
        {
            if (padre is HtmlInputText)
            {
                HtmlInputText t = (HtmlInputText)padre;
                t.Value = string.Empty;

            }
            else if (padre is TextBox)
            {
                TextBox t = (TextBox)padre;
                t.Text = string.Empty;
            }
            else if (padre is DropDownList)
            {
                DropDownList d = (DropDownList)padre;
                if (d.Items.Count > 0)
                    d.SelectedIndex = 0;
            }
            else if (padre.Controls.Count > 0)
            {
                foreach (Control c in padre.Controls)
                {
                    LimpiarCampos(c);
                }
            }

        }


        /// <summary>
        /// Funcion que se encarga de convertir una cadena a un valor int32
        /// Creado por Rigoberto TS
        /// 12/09/2014
        /// </summary>
        /// <param name="valor"></param>
        /// <returns></returns>
        public static int StrToInt(string valor)
        {
            int result;
            if (Int32.TryParse(valor, out result))
                return Convert.ToInt32(valor);

            return result;
        }


    }
}
