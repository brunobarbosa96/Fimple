using System.Diagnostics;

namespace Home.Infra.Config
{
    public static class UriWebApi
    {
        private static string Server => Debugger.IsAttached ? "http://localhost" : "http://www.fimple.com.br";
        public static string Login => $"{Server}:5000/api/authentication/Login/";
        public static string Usuario => $"{Server}:5000/api/usuario/";
    }
}
