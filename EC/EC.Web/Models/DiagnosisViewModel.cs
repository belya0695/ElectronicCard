using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class DiagnosisViewModel
    {
        [Required(ErrorMessage = "Enter diagnosis name")]
        public string DiagnosisName { get; set; }
    }
}