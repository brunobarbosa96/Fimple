using Home.Application.Chat;
using Home.Infra;
using Home.Models.Dto;
using Home.Models.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.Chat
{
    public class ChatController : BaseController
    {
        private readonly IChatApp _chatApp;

        public ChatController(IChatApp chatApp)
        {
            _chatApp = chatApp;
        }

        public ActionResult Index()
        {
            try
            {
                // Fazendo requisição para buscar conversas do usuário
                var response = _chatApp.Get(UsuarioLogado.Id);
                if (!response.IsSuccessStatusCode)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest,
                        response.Content.ReadAsStringAsync().Result);

                // Instanciando Chat e deserializando resposta
                var chat = new ChatDto
                {
                    Usuario = UsuarioLogado,
                    Conversas = JsonConvert.DeserializeObject<IEnumerable<Conversa>>(response.Content.ReadAsStringAsync().Result)
                };

                return View(chat);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}