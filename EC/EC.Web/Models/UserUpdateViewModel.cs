using EC.Web.ValidationAttributes;
using System;
using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class UserUpdateViewModel
    {
        public int UserId { get; set; }

        [Required(ErrorMessage = "Please enter First Name")]
        [StringLength(40, ErrorMessage = "Max length of First Name is 40 letters")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Please enter Middle Name")]
        [StringLength(40, ErrorMessage = "Max length of Middle Name is 40 letters")]
        public string MiddleName { get; set; }

        [Required(ErrorMessage = "Please enter Last Name")]
        [StringLength(40, ErrorMessage = "Max length of Last Name is 40 letters")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Please enter BirthDate")]
        [DateRange(ErrorMessage = "Please enter a valid BirthDate")]
        public DateTime BirthDate { get; set; }

        [Required(ErrorMessage = "Please enter Workplace")]
        [StringLength(100, ErrorMessage = "Max length of Workplace is 100 letters")]
        public string Workplace { get; set; }

        [Required(ErrorMessage = "Please enter Email")]
        [RegularExpression(@".+\@.+\..+", ErrorMessage = "Please enter a valid Email")]
        [StringLength(100, ErrorMessage = "Max length of Email is 100 letters")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please enter Post")]
        public int UserPostId { get; set; }

        [Required(ErrorMessage = "Please enter Role")]
        public int UserRoleId { get; set; }
    }
}