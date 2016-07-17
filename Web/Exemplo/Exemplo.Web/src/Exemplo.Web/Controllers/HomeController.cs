using Microsoft.AspNetCore.Mvc;
using System;

namespace Exemplo.Web.Controllers
{
    public class HomeController : Controller
    {
        //public IActionResult Index()
        //{
        //    return View();
        //}

        public IActionResult Home()
        {
            try
            {

            }
            catch(Exception ex)
            {
                return View(ex.Message);
            }
        }
    }
}
