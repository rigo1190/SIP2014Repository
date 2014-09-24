using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;
using System.Security.Cryptography;
using BusinessLogicLayer;

namespace SIP
{
    public partial class Login : System.Web.UI.Page
    {
        private UnitOfWork uow;
        public string clave = "3ncript4d4"; // Clave de cifrado.
        
        protected void Page_Load(object sender, EventArgs e)
        {
            uow = new UnitOfWork();
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {

            var user = uow.UsuarioBusinessLogic.Get(u => u.Login == txtLogin.Value && u.Password == txtContrasena.Value).FirstOrDefault();

            if (user!=null)
            {                               
                
                                    

                        //FormsAuthentication.RedirectFromLoginPage(user.Login, false);
                        
                        Session.Timeout = 60;
                        Session["NombreUsuario"] = user.Nombre;
                        Session["Login"] = user.Login;
                        Session["UnidadPresupuestalId"] = user.DetalleUnidadesPresupuestales.FirstOrDefault().Id;
                        Session["EjercicioId"] = 6;      

                        //switch (u.Tipo)
                        //{
                        //    case 1: // tipo oic
                        //        Response.Redirect("~/Formas/Cedulas/PeriodosActivos.aspx");
                        //        break;
                        //    case 2: // tipo admninistrador
                        //        Response.Redirect("Default.aspx");
                        //        break;

                        //}

                        Response.Redirect("Default.aspx");

            }

            else
            {
                lblMensajes.Text = "Nombre de usuario o contraseña incorrectos";
                lblMensajes.CssClass = "error";
            }
          
        }

        private string Encriptar(string pass)
        {
            //cifrar datos
            byte[] llave; //Arreglo donde guardaremos la llave para el cifrado 3DES.

            byte[] arreglo = UTF8Encoding.UTF8.GetBytes(pass); //Arreglo donde guardaremos la cadena descifrada.

            // Ciframos utilizando el Algoritmo MD5.
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            llave = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(clave));
            md5.Clear();

            //Ciframos utilizando el Algoritmo 3DES.
            TripleDESCryptoServiceProvider tripledes = new TripleDESCryptoServiceProvider();
            tripledes.Key = llave;
            tripledes.Mode = CipherMode.ECB;
            tripledes.Padding = PaddingMode.PKCS7;
            ICryptoTransform convertir = tripledes.CreateEncryptor(); // Iniciamos la conversión de la cadena
            byte[] resultado = convertir.TransformFinalBlock(arreglo, 0, arreglo.Length); //Arreglo de bytes donde guardaremos la cadena cifrada.
            tripledes.Clear();


            return Convert.ToBase64String(resultado, 0, resultado.Length);
        }
    }
}