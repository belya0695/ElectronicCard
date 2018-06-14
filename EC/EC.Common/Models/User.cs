using System;
using System.Collections.Generic;

namespace EC.Common.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public Post UserPost { get; set; }
        public DateTime BirthDate { get; set; }
        public Image Photo { get; set; }
        public string Workplace { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Login { get; set; }
        public List<Role> Roles { get; set; }
        public Phone[] Phones { get; set; }
    }
}