using Commom.Config;
using Commom.Request;
using Home.Models.Entity;
using System.Net.Http;

namespace Home.Application.Login
{
    public class LoginApp : ILoginApp
    {
        private readonly IRequest _request;

        public LoginApp(IRequest request)
        {
            _request = request;
        }

        public HttpResponseMessage Post(Usuario usuario)
        {
            return _request.Post(UriWebApi.Login, usuario);
        }
    }
}