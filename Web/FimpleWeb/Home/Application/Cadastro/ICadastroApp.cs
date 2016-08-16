using Home.Models.Entity;
using System.Net.Http;

namespace Home.Application.Cadastro
{
    public interface ICadastroApp 
    {
        HttpResponseMessage Post(Usuario usuario);
    }
}