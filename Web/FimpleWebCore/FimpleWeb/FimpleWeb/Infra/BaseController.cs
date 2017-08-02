using System.Collections.Generic;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Home.Infra
{
    public class BaseController : Controller
    {
        public Usuario UsuarioLogado
        {
            get { return (Usuario)Session["UsuarioLogado"]; }
            set { Session["UsuarioLogado"] = value; }
        }

        //protected override void OnActionExecuting(ActionExecutedContext filterContext)
        //{
        //    var actionsIgnored = new [] { "Index", "Entrar", "GetDados" };
        //    var actionName = filterContext.ActionDescriptor.ActionName;
        //    var controllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
        //    if (UsuarioLogado == null && controllerName != "Login" && actionsIgnored.Any(x => x == actionName) 
        //        && (controllerName != "Usuario" && actionName != "GetDados"))
        //    {
        //        filterContext.Result = new RedirectToRouteResult(
        //            new RouteValueDictionary {
        //                { "Controller", "Login" },
        //                { "Action", "Index" }
        //        });
        //    }

        //    base.OnActionExecuting(filterContext);
        //}

        protected IActionResult ViewResponse(HttpStatusCode status, string value = "")
        {
            Response.StatusCode = (int)status;
            //Response.TrySkipIisCustomErrors = true;
            return Content(value);
        }

        protected IActionResult ViewResponse(HttpStatusCode status, IEnumerable<string> value, string separador = "<br/>")
        {
            Response.StatusCode = (int)status;
            //Response.TrySkipIisCustomErrors = true;
            return Content(string.Join(separador, value));
        }

        //protected ActionResult JsonViewResponse(HttpStatusCode status, object value)
        //{
        //    Response.StatusCode = (int)status;
        //    //Response.TrySkipIisCustomErrors = true;
        //    return Json(value);
        //}

        protected IActionResult ErrorMessage(string message)
        {
            return ViewResponse(HttpStatusCode.BadRequest, message);
        }

        protected IActionResult ErrorMessage(IEnumerable<string> value)
        {
            return ViewResponse(HttpStatusCode.BadRequest, value);
        }
    }
}
