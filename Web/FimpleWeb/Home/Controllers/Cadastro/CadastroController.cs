using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Home.Controllers.Cadastro
{
    public class CadastroController : Controller
    {
  
        public ActionResult Index()
        {
            return View("Index");
        }

        public ActionResult Post()
        {
            return View("Index");
        }
    }
}