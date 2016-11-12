using System.Diagnostics;

namespace Home.Infra.Config
{
    public static class UriWebApi
    {
        private static string Server => Debugger.IsAttached ? "http://localhost" : "http://www.fimple.com.br";
        public static string Login => $"{Server}:5000/api/authentication/Login/";
        public static string Usuario => $"{Server}:5000/api/usuario/";
        public static string Curso => $"{Server}:5000/api/curso/";
        public static string Chat => $"{Server}:5000/api/chat/";
        public static string Publicacao => $"{Server}:5000/api/timeline/publicacao/";
    }
}
