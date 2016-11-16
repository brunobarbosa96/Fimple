using System;
using System.Web.Mvc;
using Home.Infra;
using Home.Infra.Security;
using Newtonsoft.Json;

namespace Home.Controllers.Mapa
{
    public class MapaController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}