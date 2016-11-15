using Home.Infra;
using System.Web.Mvc;

namespace Home.Controllers.Notificacao
{
    public class NotificacaoController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}