﻿using Home.Infra;
using System;
using System.Net;
using System.Web.Mvc;

namespace Home.Controllers.TimeLine
{
    public class TimeLineController : BaseController
    {
        public ActionResult Index()
        {
            try
            {
                ViewBag.NomeUsuario = UsuarioLogado.Nome;
                return View();
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}