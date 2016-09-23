using System.Diagnostics;

namespace Commom.Config
{
    public static class UriWebApi
    {
        private static string Server => Debugger.IsAttached ? "http://localhost" : "http://www.fimple.com.br";
        public static string Login => $"{Server}:5000/api/authentication/Login/";
    }
}
