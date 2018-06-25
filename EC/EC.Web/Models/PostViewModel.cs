using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class PostViewModel
    {
        public int PostId { get; set; }

        [Required(ErrorMessage = "Please, enter post name")]
        [StringLength(100, ErrorMessage = "Max length of post name is 100 letters")]
        public string PostName { get; set; }
    }
}