using Home.Models.Entity;
using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;

namespace Home.Infra
{
    public class BaseController : Controller
    {
        public Usuario UsuarioLogado
        {
            get { return (Usuario)Session["UsuarioLoago"]; }
            set { Session["UsuarioLoago"] = value; }
        }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var actionsIgnored = new [] { "Index", "Entrar", "GetDados" };
            var actionName = filterContext.ActionDescriptor.ActionName;
            var controllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
            if (UsuarioLogado == null && controllerName != "Login" && actionsIgnored.Any(x => x == actionName) 
                && (controllerName != "Usuario" && actionName != "GetDados"))
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary {
                        { "Controller", "Login" },
                        { "Action", "Index" }
                });
            }

            base.OnActionExecuting(filterContext);
        }
    }
}