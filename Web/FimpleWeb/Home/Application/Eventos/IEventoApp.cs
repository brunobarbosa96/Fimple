using System.Net.Http;
using Home.Models.Entity;

namespace Home.Application.Eventos
{
    public interface IEventoApp
    {
        HttpResponseMessage GetAll(int idUsuario, int pagina);
        HttpResponseMessage Get(int id);
        HttpResponseMessage Post(Evento evento);
        HttpResponseMessage Put(Evento evento);
        HttpResponseMessage Delete(int id);
    }
}