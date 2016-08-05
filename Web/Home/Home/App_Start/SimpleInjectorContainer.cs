﻿using Commom.Request;
using Home.Application.Login;
using SimpleInjector;

namespace Home
{
    public static class SimpleInjectorContainer
    {
        public static Container RegisterServices()
        {
            var container = new Container();

            container.Register<IRequest, Request>();
            container.Register<ILoginApp, LoginApp>();

            container.Verify();
            return container;
        }
    }
}