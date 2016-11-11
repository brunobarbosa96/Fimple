using Home.Application.Curso;
using Home.Application.Usuario;
using Home.Infra;
using Home.Models.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Usuario
{
    public class UsuarioController : BaseController
    {
        private readonly IUsuarioApp _usuarioApp;
        private readonly ICursoApp _cursoApp;

        public UsuarioController(IUsuarioApp usuarioApp, ICursoApp cursoApp)
        {
            _usuarioApp = usuarioApp;
            _cursoApp = cursoApp;
        }

        public ActionResult GetDados(Models.Entity.Usuario usuario)
        {
            try
            {
                // Buscando cursos disponíveis para listar combo
                var responseCurso = _cursoApp.GetAll();
                if(!responseCurso.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, responseCurso.Content.ReadAsStringAsync().Result);

                // Recuperando cursos retornados
                usuario.ComboCurso = JsonConvert.DeserializeObject<IEnumerable<Curso>>(responseCurso.Content.ReadAsStringAsync().Result);

                return View("_Cadastro", usuario);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        public ActionResult Post(Models.Entity.Usuario usuario)
        {
            try
            {
                //if (!ModelState.IsValid)
                //{
                //    ValidateModel(usuario);
                //    return RedirectToAction("GetDados", "Usuario", usuario);
                //}

                // Requisição para inserir usuário
                var response = _usuarioApp.Post(usuario);
                if (!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, response.Content.ReadAsStringAsync().Result);

                // Recuperando usuário inserido
                var model = JsonConvert.DeserializeObject<Models.Entity.Usuario>(response.Content.ReadAsStringAsync().Result);

                return RedirectToAction("Entrar", "Login", model);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}