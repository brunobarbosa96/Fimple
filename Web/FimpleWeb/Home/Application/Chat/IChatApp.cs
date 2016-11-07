using Home.Models.Entity;
using System.Net.Http;

namespace Home.Application.Chat
{
    public interface IChatApp
    {
        HttpResponseMessage Get(int idUsuario);
        HttpResponseMessage Post(Mensagem mensagem);
    }
}