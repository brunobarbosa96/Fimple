﻿using System.Net.Http;

namespace Home.Application.Usuario
{
    public interface IUsuarioApp
    {
        HttpResponseMessage GetAll();
        HttpResponseMessage Get(int id);
        HttpResponseMessage Post(Models.Entity.Usuario usuario);
        HttpResponseMessage Put(Models.Entity.Usuario usuario);
        HttpResponseMessage Delete(int id);
    }
}