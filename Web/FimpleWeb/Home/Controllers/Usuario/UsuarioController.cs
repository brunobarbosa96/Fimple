﻿using Home.Application.Curso;
using Home.Application.Usuario;
using Home.Infra;
using Home.Infra.Security;
using Home.Models.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
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
                usuario.ComboCurso = JsonConvert.DeserializeObject<IEnumerable<Curso>>(responseCurso.Content.ReadAsStringAsync().Result)
                    .OrderBy(x => x.Nome);

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
                // Criptografando senha
                usuario.Senha = Security.Encrypt(usuario.Senha);

                // Requisição para inserir usuário
                var response = _usuarioApp.Post(usuario);
                if (!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest, response.Content.ReadAsStringAsync().Result);

                // Recuperando usuário inserido
                var model = JsonConvert.DeserializeObject<Models.Entity.Usuario>(response.Content.ReadAsStringAsync().Result);
                model.Senha = Security.Decrypt(model.Senha);
                return RedirectToAction("Entrar", "Login", model);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}