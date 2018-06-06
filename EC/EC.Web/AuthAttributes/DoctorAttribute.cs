using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using EC.Web.AuthAttributes.Models;

namespace EC.Web.AuthAttributes
{
    public class DoctorAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            UserPrincipal userPrincipal = HttpContext.Current.User as UserPrincipal;
            if (userPrincipal != null)
            {
                if (!userPrincipal.IsInRole("doctor"))
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Denied", requiredRole = "Doctor" }));
                }
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Login" }));
            }
        }

    }
}