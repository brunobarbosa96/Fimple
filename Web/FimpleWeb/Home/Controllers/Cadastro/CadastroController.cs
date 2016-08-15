using Home.Application.Cadastro;
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

        public ActionResult Post(Models.Entity.Cadastro cadastro)
        {
            try
            {
                var retorno = _cadastroApp.Post(cadastro);
                if(!retorno.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, retorno.Content.ReadAsStringAsync().Result);

                var model = JsonConvert.DeserializeObject<Models.Entity.Cadastro>(retorno.Content.ReadAsStringAsync().Result);

                return RedirectToAction("Login", "Login");
            }
            catch(Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }

           
        }
    }
}