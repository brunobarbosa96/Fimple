using Home.Application.Interfaces.Login;
using Home.Application.Login;
using SimpleInjector;

namespace Home
{
    public static class SimpleInjectorContainer
    {
        public static Container RegisterServices()
        {
            var container = new Container();

            container.Register<ILoginApp, LoginApp>();

            container.Verify();
            return container;
        }
    }
}