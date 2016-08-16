using Commom.Request;
using Home.Models.Entity;
using System;
using System.Net.Http;

namespace Home.Application.Cadastro
{
    public class CadastroApp : ICadastroApp
    {
        private readonly IRequest _request;

        public CadastroApp(IRequest request)
        {
            _request = request;
        }

        public HttpResponseMessage Post(Usuario usuario)
        {
            throw new NotImplementedException();
        }
    }
}