using Home.ViewModels.Entity;
using System.Net.Http;

namespace Home.Application.Interfaces.Login
{
    public interface ILoginApp
    {
        HttpResponseMessage Post(Usuario usuario);
    }
}