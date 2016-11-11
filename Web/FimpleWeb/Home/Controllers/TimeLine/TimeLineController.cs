using Home.Application.Timeline;
using Home.Infra;
using Home.Models.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Timeline
{
    public class TimelineController : BaseController
    {
        private readonly IPublicacaoApp _publicacaoApp;

        public TimelineController(IPublicacaoApp publicacaoApp)
        {
            _publicacaoApp = publicacaoApp;
        }

        public ActionResult Index()
        {
            try
            {
                ViewBag.NomeUsuario = UsuarioLogado.Nome;
                return View(UsuarioLogado);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        public ActionResult GetPublicacoes(int pagina)
        {
            try
            {
                var response = _publicacaoApp.GetAll(UsuarioLogado.Id, pagina);
                if (!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest,
                        response.Content.ReadAsStringAsync().Result);

                var publicacoes = JsonConvert.DeserializeObject<IEnumerable<Publicacao>>(
                    response.Content.ReadAsStringAsync().Result)
                    .OrderBy(x => x.updateAt);
                ViewBag.UsuarioLogado = UsuarioLogado.Id;
                return View("_Publicacao", publicacoes);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        public ActionResult PostPublicacao(Publicacao publicacao)
        {
            try
            {
                var response = _publicacaoApp.Post(publicacao);
                if (!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest,
                        response.Content.ReadAsStringAsync().Result);

                return Json(publicacao);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}