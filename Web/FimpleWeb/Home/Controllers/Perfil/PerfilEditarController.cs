using Home.Application.Usuario;
using Home.Infra;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
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
                    return ErrorMessage(retorno.Content.ReadAsStringAsync().Result);

                var usuario = JsonConvert.DeserializeObject<Models.Entity.Usuario>(
                    retorno.Content.ReadAsStringAsync().Result);

                return View("Index", usuario);

            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }


        #region --> Abas <--
        public ActionResult GetInfo()
        {
            try
            {
                var retorno = _usuarioApp.Get(UsuarioLogado.Id);
                if (!retorno.IsSuccessStatusCode)
                    return ErrorMessage(retorno.Content.ReadAsStringAsync().Result);

                var usuario = JsonConvert.DeserializeObject<Models.Entity.Usuario>(
                    retorno.Content.ReadAsStringAsync().Result);

                return View("Abas/_InformacaoPessoal", usuario);
            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }

        public ActionResult GetMudarAvatar()
        {
            return PartialView("Abas/_MudarAvatar");
        }

        public ActionResult GetMudarSenha()
        {
            return PartialView("Abas/_MudarSenha");
        }

        public ActionResult GetUsuarioBloqueado()
        {
            var retorno = _usuarioApp.GetUsuarioBloqueado(UsuarioLogado.Id);
            if (!retorno.IsSuccessStatusCode)
                return ErrorMessage(retorno.Content.ReadAsStringAsync().Result);

            var usuario = JsonConvert.DeserializeObject<IEnumerable<Models.Entity.Usuario>>(
                retorno.Content.ReadAsStringAsync().Result);

            return PartialView("Abas/_UsuarioBloqueado", usuario);

        }
        #endregion

        public ActionResult AtualizaUsuario(Models.Entity.Usuario usuarioEditar)
        {
            try
            {
                var retorno = _usuarioApp.Put(usuarioEditar);

                if (!retorno.IsSuccessStatusCode)
                    return ErrorMessage(retorno.Content.ReadAsStringAsync().Result);

                var usuario = JsonConvert.DeserializeObject<Models.Entity.Usuario>(
                    retorno.Content.ReadAsStringAsync().Result);

                return View("Abas/_InformacaoPessoal", usuario);

            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }
    }
}