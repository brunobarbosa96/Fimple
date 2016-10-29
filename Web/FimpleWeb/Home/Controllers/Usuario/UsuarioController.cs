using Home.Application.Usuario;
using Home.Infra;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Usuario
{
    public class UsuarioController : BaseController
    {
        private readonly IUsuarioApp _usuarioApp;

        public UsuarioController(IUsuarioApp usuarioApp)
        {
            _usuarioApp = usuarioApp;
        }

        public ActionResult GetDados(Models.Entity.Usuario usuario)
        {
            return View("_Dados", usuario);
        }

        public ActionResult Post(Models.Entity.Usuario usuario)
        {
            try
            {
                var response = _usuarioApp.Post(usuario);
                if (!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, response.Content.ReadAsStringAsync().Result);

                var id = JsonConvert.DeserializeObject<Models.Entity.Usuario>(response.Content.ReadAsStringAsync().Result).Id;

                var responseUsuario = _usuarioApp.Get(id);
                var model = JsonConvert.DeserializeObject<Models.Entity.Usuario>(responseUsuario.Content.ReadAsStringAsync().Result);

                return RedirectToAction("Post", "Login", model);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}