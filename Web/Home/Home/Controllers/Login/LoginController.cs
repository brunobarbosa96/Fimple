using Home.ViewModels.Entity;
using System;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Login
{
    public class LoginController : Controller
    {
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Post(Usuario usuario)
        {
            try
            {
                return null;
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}