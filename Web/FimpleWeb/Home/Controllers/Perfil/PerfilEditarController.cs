using Home.Application.Usuario;
using Home.Infra;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Perfil
{
    public class PerfilEditarController : BaseController
    {
        private readonly IUsuarioApp _usuarioApp;

        public PerfilEditarController(IUsuarioApp usuarioApp)
        {
            _usuarioApp = usuarioApp;
        }
            
        public ActionResult Index()
        {
            try
            {
                var retorno = _usuarioApp.Get(UsuarioLogado.Id);
                if (!retorno.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, retorno.Content.ReadAsStringAsync().Result);

                var usuario = JsonConvert.DeserializeObject<Models.Entity.Usuario>(
                    retorno.Content.ReadAsStringAsync().Result);

                return View("Index", usuario);

            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        public ActionResult GetInfo()
        {
            try
            {
                var retorno = _usuarioApp.Get(UsuarioLogado.Id);
                if (!retorno.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, retorno.Content.ReadAsStringAsync().Result);

                var usuario = JsonConvert.DeserializeObject<Models.Entity.Usuario>(
                    retorno.Content.ReadAsStringAsync().Result);

                return View("Abas/_InformacaoPessoal", usuario);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}