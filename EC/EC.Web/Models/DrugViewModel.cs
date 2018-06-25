using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class DrugViewModel
    {
        [Required(ErrorMessage = "Enter drug name")]
        [StringLength(100, ErrorMessage = "Max length of drug name is 100 letters")]
        public string DrugName { get; set; }
    }
}