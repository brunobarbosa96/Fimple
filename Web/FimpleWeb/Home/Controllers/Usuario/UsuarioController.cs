using Home.Application.Usuario;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Usuario
{
    public class UsuarioController : Controller
    {
        private readonly IUsuarioApp _usuarioApp;

        public UsuarioController(IUsuarioApp usuarioApp)
        {
            _usuarioApp = usuarioApp;
        }

        public ActionResult GetDados()
        {
            return View("_Dados", new Models.Entity.Usuario());
        }

        public ActionResult Post(Models.Entity.Usuario usuario)
        {
            try
            {
                var retorno = _usuarioApp.Post(usuario);
                if (!retorno.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, retorno.Content.ReadAsStringAsync().Result);

                var model = JsonConvert.DeserializeObject<Models.Entity.Usuario>(retorno.Content.ReadAsStringAsync().Result);

                return RedirectToAction("Index", "Login", model);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }


        }
    }
}