using Home.Models.Entity;
using System.Web.Mvc;

namespace Home.Infra
{
    public class BaseController : Controller
    {
        public Usuario UsuarioLogado
        {
            get { return (Usuario)Session["UsuarioLoago"]; }
            set { Session["UsuarioLoago"] = value; }
        }
    }
}
