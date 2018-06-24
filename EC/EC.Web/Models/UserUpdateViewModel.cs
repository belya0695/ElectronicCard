using System;
using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class UserUpdateViewModel
    {
        public int UserId { get; set; }

        [Required(ErrorMessage = "Please enter First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Please enter Middle Name")]
        public string MiddleName { get; set; }

        [Required(ErrorMessage = "Please enter Last Name")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Please enter BirthDate")]
        public DateTime BirthDate { get; set; }

        [Required(ErrorMessage = "Please enter Workplace")]
        public string Workplace { get; set; }

        [Required(ErrorMessage = "Please enter Email")]
        [RegularExpression(@".+\@.+\..+", ErrorMessage = "Please enter a valid Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please enter Post")]
        public int UserPostId { get; set; }

        [Required(ErrorMessage = "Please enter Role")]
        public int UserRoleId { get; set; }
    }
}