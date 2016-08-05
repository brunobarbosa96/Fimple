using Home.Models.Entity;
using System.Net.Http;

namespace Home.Application.Login
{
    public interface ILoginApp
    {
        HttpResponseMessage Post(Usuario usuario);
    }
}