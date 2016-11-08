using Home.Models.Entity;
using System.Net.Http;
using IRequest = Home.Infra.Request.IRequest;
using UriWebApi = Home.Infra.Config.UriWebApi;

namespace Home.Application.Chat
{
    public class ChatApp : IChatApp
    {
        private readonly IRequest _request;

        public ChatApp(IRequest request)
        {
            _request = request;
        }

        public HttpResponseMessage Get(int idUsuario)
        {
            return _request.Get(UriWebApi.Chat, idUsuario.ToString());
        }

        public HttpResponseMessage Post(Mensagem mensagem)
        {
            return _request.Post(UriWebApi.Chat, mensagem);
        }
    }
}