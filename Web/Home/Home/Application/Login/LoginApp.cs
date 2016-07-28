using Commom;
using Home.Application.Interfaces.Login;
using Home.ViewModels.Entity;
using Newtonsoft.Json;
using System.Net.Http;

namespace Home.Application.Login
{
    public class LoginApp : ILoginApp
    {
        public HttpResponseMessage Post(Usuario usuario)
        {
            var client = new HttpClient();

            var content = new StringContent(JsonConvert.SerializeObject(usuario));

            return client.PostAsync(UriWebApi.Login, content).Result;
        }
    }
}