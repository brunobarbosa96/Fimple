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
            return _request.Get($"{UriWebApi.Chat}conversa/", idUsuario.ToString());
        }
    }
}