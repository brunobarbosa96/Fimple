using Home.Models.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Home.Hubs
{
    public class Chat : Microsoft.AspNet.SignalR.Hub
    {
        public static List<Usuario> Usuarios = new List<Usuario>();

        public void Conectar(Usuario usuario)
        {
            var user = Usuarios.FirstOrDefault(x => x.Id == usuario.Id);
            usuario.ConnectionIds.Add(Context.ConnectionId);

            if (user == null)
                Usuarios.Add(usuario);
            else if (user.ConnectionIds.All(x => x != Context.ConnectionId))
                user.ConnectionIds.Add(Context.ConnectionId);

            if (Usuarios.FirstOrDefault(x => x.Id == usuario.Id)?.ConnectionIds.Count() == 1)
                Clients.All.AtualizaNovoUsuarioOnline(usuario);
            Clients.Caller.MontaListaLogados(Usuarios);
        }

        public override Task OnDisconnected(bool stopCalled)
        {
            var user = Usuarios.First(x => x.ConnectionIds.Any(y => y == Context.ConnectionId));
            user.ConnectionIds.Remove(Context.ConnectionId);

            if (!user.ConnectionIds.Any())
            {
                Usuarios.Remove(user);
                Clients.All.RemoverUsuarioChat(user);
            }

            return base.OnDisconnected(stopCalled);
        }

        public void EnviarMensagem(string mensagem, string usuario)
        {
            if (usuario != "0")
                Clients.Clients(new[] { usuario, Context.ConnectionId }).TransmitirMensagem(usuario, mensagem);
            else
                Clients.All.TransmitirMensagem(Context.ConnectionId, mensagem);
        }
    }
}   