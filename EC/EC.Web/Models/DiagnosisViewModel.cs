using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class DiagnosisViewModel
    {
        public int DiagnosisId { get; set; }

        [Required(ErrorMessage = "Please, enter diagnosis name")]
        [StringLength(150, ErrorMessage = "Max length of diagnosis name is 150 letters")]
        public string DiagnosisName { get; set; }
    }
}