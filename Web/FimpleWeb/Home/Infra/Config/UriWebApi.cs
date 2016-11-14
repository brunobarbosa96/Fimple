using System.Diagnostics;

namespace Home.Infra.Config
{
    public static class UriWebApi
    {
        private static string Server => Debugger.IsAttached ? "http://localhost" : "http://www.fimple.com.br";
        public static string Login => $"{Server}:21066/api/authentication/Login/";
        public static string Usuario => $"{Server}:21066/api/usuario/";
        public static string Curso => $"{Server}:21066/api/curso/";
        public static string Chat => $"{Server}:21066/api/chat/";
        public static string Publicacao => $"{Server}:21066/api/timeline/publicacao/";
    }
}
