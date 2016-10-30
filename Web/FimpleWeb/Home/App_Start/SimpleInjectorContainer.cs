using Home.Application.Curso;
using Home.Application.Login;
using Home.Application.Usuario;
using SimpleInjector;
using ILoginApp = Home.Application.Login.ILoginApp;
using IRequest = Home.Infra.Request.IRequest;
using Request = Home.Infra.Request.Request;

namespace Home
{
    public static class SimpleInjectorContainer
    {
        public static Container RegisterServices()
        {
            var container = new Container();

            container.Register<IRequest, Request>();

            container.Register<ILoginApp, LoginApp>();
            container.Register<IUsuarioApp, UsuarioApp>();
            container.Register<ICursoApp, CursoApp>();

            container.Verify();
            return container;
        }
    }
}