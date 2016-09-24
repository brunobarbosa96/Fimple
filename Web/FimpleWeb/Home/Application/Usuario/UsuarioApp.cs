using Commom.Config;
using Commom.Request;
using System.Net.Http;

namespace Home.Application.Usuario
{
    public class UsuarioApp : IUsuarioApp
    {
        private readonly IRequest _request;

        public UsuarioApp(IRequest request)
        {
            _request = request;
        }

        public HttpResponseMessage Post(Models.Entity.Usuario usuario)
        {
            return _request.Post(UriWebApi.Usuario, usuario);
        }
    }
}