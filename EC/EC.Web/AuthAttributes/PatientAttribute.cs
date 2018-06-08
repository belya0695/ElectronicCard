using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using EC.Web.AuthAttributes.Models;

namespace EC.Web.AuthAttributes
{
    public class PatientAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            UserPrincipal userPrincipal = HttpContext.Current.User as UserPrincipal;
            if (userPrincipal != null)
            {
                if (!userPrincipal.IsInRole("patient"))
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Denied", requiredRole = "Patient" }));
                }
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Login" }));
            }
        }
    }
}