using System.Net.Http;

namespace Home.Application.Usuario
{
    public interface IUsuarioApp 
    {
        HttpResponseMessage Post(Models.Entity.Usuario usuario);
    }
}