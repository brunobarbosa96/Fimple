﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Home.Application.Eventos;
using Home.Application.Timeline;
using Home.Infra;
using Home.Models.Entity;
using Newtonsoft.Json;

namespace Home.Controllers.Eventos
{
    public class EventosController : BaseController
    {
        private readonly IEventoApp _eventoApp;
        private readonly IComentarioApp _comentarioApp;

        public EventosController(IEventoApp eventoApp, IComentarioApp comentarioApp)
        {
            _eventoApp = eventoApp;
            _comentarioApp = comentarioApp;
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
                return ErrorMessage(ex.Message);
            }
        }

        public ActionResult GetAll(int pagina)
        {
            try
            {
                var response = _eventoApp.GetAll(UsuarioLogado.Id, pagina);
                if (!response.IsSuccessStatusCode)
                    return ErrorMessage(response.Content.ReadAsStringAsync().Result);

                var eventos = JsonConvert.DeserializeObject<IEnumerable<Evento>>(response.Content.ReadAsStringAsync().Result);
                ViewBag.UsuarioLogado = UsuarioLogado;
                return View("_Evento", eventos);
            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }

        public ActionResult Post(Evento evento)
        {
            try
            {
                var response = _eventoApp.Post(evento);
                if (!response.IsSuccessStatusCode)
                    return ErrorMessage(response.Content.ReadAsStringAsync().Result);

                return new EmptyResult();
            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }

        public ActionResult Put(Evento evento)
        {
            try
            {
                var response = _eventoApp.Put(evento);
                if (!response.IsSuccessStatusCode)
                    return ErrorMessage(response.Content.ReadAsStringAsync().Result);

                return new EmptyResult();
            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }

        public ActionResult Delete(int id)
        {
            try
            {
                var response = _eventoApp.Delete(id);
                if (!response.IsSuccessStatusCode)
                    return ErrorMessage(response.Content.ReadAsStringAsync().Result);

                return new EmptyResult();
            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }

        [ValidateInput(false)]
        public ActionResult PostComentario(Comentario comentario)
        {
            try
            {
                var response = _comentarioApp.Post(comentario);
                if (!response.IsSuccessStatusCode)
                    return ErrorMessage(response.Content.ReadAsStringAsync().Result);

                return new EmptyResult();
            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }

        [ValidateInput(false)]
        public ActionResult PutComentario(Comentario comentario)
        {
            try
            {
                var response = _comentarioApp.Put(comentario);
                if (!response.IsSuccessStatusCode)
                    return ErrorMessage(response.Content.ReadAsStringAsync().Result);

                return new EmptyResult();
            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }

        public ActionResult DeleteComentario(int id)
        {
            try
            {
                var response = _comentarioApp.Delete(id);
                if (!response.IsSuccessStatusCode)
                    return ErrorMessage(response.Content.ReadAsStringAsync().Result);

                return new EmptyResult();
            }
            catch (Exception ex)
            {
                return ErrorMessage(ex.Message);
            }
        }
    }
}