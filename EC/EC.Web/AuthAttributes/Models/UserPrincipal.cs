using System.Collections.Generic;
using System.Security.Principal;
using EC.Common.Models;

namespace EC.Web.AuthAttributes.Models
{
    public class UserPrincipal : IPrincipal
    {
        public int UserId { get; set; }
        public string Login { get; set; }
        public List<Role> Roles  { get; set; }

        public IIdentity Identity { get; private set; }

        public UserPrincipal(string userName)
        {
            Identity = new GenericIdentity(userName);
        }

        public bool IsInRole(string role)
        {
            return Roles.Exists(r => r.RoleName.ToLower() == role.ToLower());
        }
    }
}