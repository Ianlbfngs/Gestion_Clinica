using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Administrador
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] == null || string.IsNullOrEmpty(Session["nombreUsuario"].ToString()))
            {
                Response.Redirect("~/Login.aspx");
            }
            else lblUsuario.Text = Session["nombreUsuario"].ToString();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}