using Home.Application.Cadastro;
using Home.Models.Entity;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Cadastro
{
    public class CadastroController : Controller
    {
        private readonly ICadastroApp _cadastroApp;

        public CadastroController(ICadastroApp cadastroApp)
        {
            _cadastroApp = cadastroApp;
        }
  
        public ActionResult Index()
        {
            return View("Index");
        }

        public ActionResult Post(Usuario usuario)
        {
            try
            {
                var retorno = _cadastroApp.Post(usuario);
                if(!retorno.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, retorno.Content.ReadAsStringAsync().Result);

                var model = JsonConvert.DeserializeObject<Usuario>(retorno.Content.ReadAsStringAsync().Result);

                return RedirectToAction("Login", "Login");
            }
            catch(Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }

           
        }
    }
}