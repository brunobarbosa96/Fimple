using Home.Application.Login;
using Home.Models.Entity;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Login
{
    public class LoginController : Controller
    {
        private readonly ILoginApp _loginApp;

        public LoginController(ILoginApp loginApp)
        {
            _loginApp = loginApp;
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Post(Usuario usuario)
        {
            try
            {
                var response = _loginApp.Post(usuario);
                    if(!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, 
                        response.Content.ReadAsStringAsync().Result);

                var model = JsonConvert.DeserializeObject<Usuario>(response.Content.ReadAsStringAsync().Result);

                return View("_DadosLogin", model);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}