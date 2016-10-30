using Home.Infra;
using System.Web.Mvc;

namespace Home.Controllers.Chat
{
    public class ChatController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}