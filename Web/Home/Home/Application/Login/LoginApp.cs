using Commom;
using Home.Application.Interfaces.Login;
using Home.ViewModels.Entity;
using Newtonsoft.Json;
using System;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;

namespace Home.Application.Login
{
    public class LoginApp : ILoginApp
    {
        public HttpResponseMessage Post(Usuario usuario)
        {
            var httpClient = new HttpClient();
            try
            {
                return httpClient.PostAsync(UriWebApi.Login, usuario, JsonMediaTypeFormatter).Result;
            }
            catch (Exception ex)
            {
                return new HttpResponseMessage(HttpStatusCode.ServiceUnavailable)
                {
                    Content = new ObjectContent(ex.GetType(), ex, JsonMediaTypeFormatter)
                };
            }
        }

        private static readonly JsonMediaTypeFormatter JsonMediaTypeFormatter = new JsonMediaTypeFormatter
        {
            SerializerSettings = new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                NullValueHandling = NullValueHandling.Include
            }
        };
    }
}