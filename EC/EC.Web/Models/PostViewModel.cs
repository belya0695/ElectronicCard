using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class PostViewModel
    {
        [Required(ErrorMessage = "Enter post name")]
        [StringLength(100, ErrorMessage = "Max length of post name is 100 letters")]
        public string PostName { get; set; }
    }
}