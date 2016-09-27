using Commom.Entity;
using Home.Application.Login;
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

        public ActionResult Index()
        {
            return View("Index");
        }

        public ActionResult GetDados()
        {
            return View("_Dados");
        }

        public ActionResult Post(Models.Entity.Usuario usuario)
        {
            try
            {
                var response = _loginApp.Post(usuario);
                if (!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest,
                        response.Content.ReadAsStringAsync().Result);

                var model = JsonConvert.DeserializeObject<Models.Entity.Usuario>(response.Content.ReadAsStringAsync().Result);

                if (model.Id == default(int))
                    return new HttpStatusCodeResult(HttpStatusCode.NoContent, "Usuario Não encontrato");

                UsuarioLogado.Id = model.Id;
                UsuarioLogado.Senha = model.Senha;
                UsuarioLogado.Rgm = model.Rgm;
                UsuarioLogado.Nome = model.Nome;
                UsuarioLogado.Sobrenome = model.Sobrenome;
                UsuarioLogado.Apelido = model.Apelido;
                UsuarioLogado.Email = model.Email;
                UsuarioLogado.DataNascimento = model.DataNascimento;
                UsuarioLogado.DataInicioCurso = model.DataInicioCurso;

                return RedirectToAction("Index", "TimeLine");
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}