using Commom;
using Exemplo.ViewModels;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Mvc;

namespace Exemplo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Home()
        {
            try
            {
                var client = new HttpClient();
                var response = client.GetAsync(UriApi.Consulta).Result;

                if (!response.IsSuccessStatusCode)
                    return View(new List<Usuario>());

                var jsonModel = response.Content.ReadAsStringAsync().Result;
                return View(JsonConvert.DeserializeObject<List<Usuario>>(jsonModel));
            }
            catch (Exception ex)
            {
                return View(ex.Message);
            }
        }
    }
}