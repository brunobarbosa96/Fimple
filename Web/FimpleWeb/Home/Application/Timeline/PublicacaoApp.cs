using Home.Models.Entity;
using System.Net.Http;
using IRequest = Home.Infra.Request.IRequest;
using UriWebApi = Home.Infra.Config.UriWebApi;

namespace Home.Application.Timeline
{
    public class PublicacaoApp : IPublicacaoApp
    {
        private readonly IRequest _request;

        public PublicacaoApp(IRequest request)
        {
            _request = request;
        }

        public HttpResponseMessage GetAll(int idUsuario, int pagina)
        {
            return _request.Get($"{UriWebApi.Publicacao}idUsuario.ToString()?Pagina={pagina}");
        }

        public HttpResponseMessage Get(int id)
        {
            return _request.Get(UriWebApi.Usuario, id.ToString());
        }

        public HttpResponseMessage Post(Publicacao publicacao)
        {
            return _request.Post(UriWebApi.Usuario, publicacao);
        }

        public HttpResponseMessage Put(Publicacao publicacao)
        {
            return _request.Put(UriWebApi.Usuario, publicacao);
        }

        public HttpResponseMessage Delete(int id)
        {
            return _request.Delete(UriWebApi.Usuario, id.ToString());
        }
    }
}