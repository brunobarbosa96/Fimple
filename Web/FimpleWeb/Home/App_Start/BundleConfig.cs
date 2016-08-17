using System.Web.Optimization;

namespace Home
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/assets/js").Include(
                        "~/assets/js/plugins/loaders/pace.min.js",
                        "~/assets/js/core/libraries/jquery.min.js",
                        "~/assets/js/core/libraries/bootstrap.min.js",
                        "~/assets/js/plugins/loaders/blockui.min.js",
                        "~/assets/js/core/app.js"));

            bundles.Add(new StyleBundle("~/assets/css").Include(
                      "~/assets/css/icons/icomoon/styles.css",
                      "~/assets/css/minified/bootstrap.min.css",
                      "~/assets/css/minified/core.min.css",
                      "~/assets/css/minified/components.min.css",
                      "~/assets/css/minified/colors.min.css"));

            BundleTable.EnableOptimizations = false;
        }
    }
}
