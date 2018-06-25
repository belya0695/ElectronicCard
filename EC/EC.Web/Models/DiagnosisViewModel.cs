using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class DiagnosisViewModel
    {
        [Required(ErrorMessage = "Enter diagnosis name")]
        [StringLength(150, ErrorMessage = "Max length of diagnosis name is 150 letters")]
        public string DiagnosisName { get; set; }
    }
}