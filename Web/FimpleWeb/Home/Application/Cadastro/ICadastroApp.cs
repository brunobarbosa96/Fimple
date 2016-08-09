using System.Net.Http;

namespace Home.Application.Cadastro
{
    public interface ICadastroApp 
    {
        HttpResponseMessage Post(Models.Entity.Cadastro cadastro);
    }
}