using Home.Application.Login;
using Home.Infra;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Home.Controllers.Login
{
    public class LoginController : BaseController
    {
        private readonly ILoginApp _loginApp;

        public LoginController(ILoginApp loginApp)
        {
            _loginApp = loginApp;
        }

        public ActionResult Index()
        {
            try
            {
                // Verificando se existe cookie e caso existir logar automaticamente
                if (Request.Cookies["fimpleUser"] != null)
                {

                }

                // Verificando se usuário possui sessão ativa
                if (UsuarioLogado == null)
                    return View("Index");

                return RedirectToAction("Index", "TimeLine");
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        public ActionResult GetDados()
        {
            return View("_Dados");
        }

        public ActionResult Entrar(Models.Entity.Usuario usuario, bool lembrar)
        {
            try
            {
                // Validando se parâmetro de usuário é valido
                if (!ModelState.IsValid)
                    return View("Index");

                // Requisição para validar login
                var response = _loginApp.Post(usuario);
                if (!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest,
                        response.Content.ReadAsStringAsync().Result);

                // Instanciando resposta
                var model = JsonConvert.DeserializeObject<Models.Entity.Usuario>(response.Content.ReadAsStringAsync().Result);

                // Verificando se foi encontrado algum usuário com este login
                if (model.Id == default(int))
                    return new HttpStatusCodeResult(HttpStatusCode.NoContent, "Usuario Não encontrato");

                // Verificando se a opção de lembrar senha está habilitada
                if (lembrar)
                {
                    // Serializando dados do usuário
                    var json = JsonConvert.SerializeObject(usuario);

                    // Criando cookie para lembrar a senha do usuário
                    var userCookie = new HttpCookie("fimpleUser", json);
                    userCookie.Expires.AddDays(365);
                    HttpContext.Response.Cookies.Add(userCookie);
                }

                // Gravando Sessão para este usuário
                UsuarioLogado = model;

                return RedirectToAction("Index", "TimeLine");
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        public ActionResult Sair()
        {
            try
            {
                // Removendo Sessão do usuário logado
                UsuarioLogado = null;

                // Removendo cooke caso existir
                if (Request.Cookies["fimpleUser"] != null)
                {
                    var userCookie = new HttpCookie("fimpleUser")
                    {
                        Expires = DateTime.Now.AddDays(-1),
                        Value = null
                    };
                    Response.Cookies.Add(userCookie);
                }

                return RedirectToAction("Index", "Login");
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}