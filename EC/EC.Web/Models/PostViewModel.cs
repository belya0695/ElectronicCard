using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class PostViewModel
    {
        [Required(ErrorMessage = "Enter post name")]
        public string PostName { get; set; }
    }
}