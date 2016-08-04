using Home.Application.Interfaces.Login;
using Home.ViewModels.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
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

                var model = JsonConvert.DeserializeObject<IEnumerable<Usuario>>(response.Content.ReadAsStringAsync().Result);

                return View("_DadosLogin", model.FirstOrDefault());
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}