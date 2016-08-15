using Commom.Request;
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

        public HttpResponseMessage Post(Models.Entity.Cadastro cadastro)
        {
            throw new NotImplementedException();
        }
    }
}