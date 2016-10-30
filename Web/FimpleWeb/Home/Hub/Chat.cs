namespace Home.Hub
{
    public class Chat : Microsoft.AspNet.SignalR.Hub
    {
        public void SendMessage(string nickname, string message)
        {
            //Clients.TransmitirMensagem(apelido, mensagem);
        }
    }
}