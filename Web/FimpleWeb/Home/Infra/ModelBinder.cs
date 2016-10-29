using System;
using System.Linq;
using System.Web.Mvc;

namespace Home.Infra
{
    public class ModelBinder : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var dateArgs =
                filterContext.ActionParameters.Where(
                    x => x.Value != null 
                    && x.Value.GetType()
                        .IsAssignableFrom(typeof(DateTime))).ToList();

            foreach (var keyValuePair in dateArgs)
            {
                var date = (DateTime)keyValuePair.Value;

                if (date.Kind == DateTimeKind.Local)
                    filterContext.ActionParameters[keyValuePair.Key] = date.ToUniversalTime();
            }

            base.OnActionExecuting(filterContext);
        }
    }
}