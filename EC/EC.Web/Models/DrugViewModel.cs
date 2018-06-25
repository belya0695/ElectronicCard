using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class DrugViewModel
    {
        [Required(ErrorMessage = "Enter drug name")]

        public string DrugName { get; set; }
    }
}