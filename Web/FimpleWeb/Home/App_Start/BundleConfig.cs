using System.Web.Optimization;

namespace Home
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/assets/js").Include(
                        "~/assets/js/metronic.js",
                        "~/assets/js/core/libraries/jquery.min.js",
                        "~/assets/js/layout.js",
                        "~/assets/js/login.js",
                        "~/assets/js/quick-sidebar.js",
                        "~/assets/js/timeline.js",
                        "~/assets/js/jquery.validate.min.js",
                        "~/assets/js/jquery.validate.unobtrusive.min.js"));

            bundles.Add(new ScriptBundle("~/assets/js/SignalR").Include(
                       "~/assets/js/jquery.signalR-{version}.min.js"));

            bundles.Add(new StyleBundle("~/assets/css").Include(
                      "~/assets/css/components-md.css",
                      "~/assets/css/custom.css",
                      "~/assets/css/darkblue.css",
                      "~/assets/css/layout.css",
                      "~/assets/css/login.css",
                      "~/assets/css/plugins-md.css",
                      "~/assets/css/timeline.css"));

            BundleTable.EnableOptimizations = false;
        }
    }
}
