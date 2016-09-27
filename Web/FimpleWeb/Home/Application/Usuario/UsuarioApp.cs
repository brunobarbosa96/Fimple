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

        public HttpResponseMessage GetAll()
        {
            return _request.Get(UriWebApi.Usuario);
        }

        public HttpResponseMessage Get(int id)
        {
            return _request.Get(UriWebApi.Usuario, id.ToString());
        }

        public HttpResponseMessage Post(Models.Entity.Usuario usuario)
        {
            return _request.Post(UriWebApi.Usuario, usuario);
        }

        public HttpResponseMessage Put(Models.Entity.Usuario usuario)
        {
            return _request.Put(UriWebApi.Usuario, usuario);
        }

        public HttpResponseMessage Delete(int id)
        {
            return _request.Delete(UriWebApi.Usuario, id.ToString());
        }
    }
}