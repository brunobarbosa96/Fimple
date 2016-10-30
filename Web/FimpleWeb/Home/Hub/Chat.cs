using Home.Models.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Home.Hub
{
    public class Chat : Microsoft.AspNet.SignalR.Hub
    {
        public List<Usuario> Usuarios = new List<Usuario>();
        public string NomeUsuario { get; set; }

        public override Task OnConnected()
        {
            if (Usuarios.All(x => x.ConnectionId != Context.ConnectionId))
                Usuarios.Add(new Usuario() { Nome = NomeUsuario, ConnectionId = Context.ConnectionId });

            return base.OnConnected();
        }

        public override Task OnDisconnected(bool stopCalled)
        {
            Usuarios.RemoveAll(x => x.ConnectionId == Context.ConnectionId);
            return base.OnDisconnected(stopCalled);
        }

        public void EnviarMensagem(string mensagem, string usuario)
        {
            if (usuario != "0")
                Clients.Clients(new[] { usuario, Context.ConnectionId }).TransmitirMensagem(RetornaNomeUsuario(), mensagem);
            else
                Clients.All.TransmitirMensagem(Context.ConnectionId, mensagem);
        }

        public string RetornaNomeUsuario()
        {
            return Usuarios.First(x => x.ConnectionId == Context.ConnectionId).Nome;
        }
    }
}   