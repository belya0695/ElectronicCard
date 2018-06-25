using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class ProcedureViewModel
    {
        [Required(ErrorMessage = "Enter procedure name")]
        [StringLength(150, ErrorMessage = "Max length of procedure name is 150 letters")]
        public string ProcedureName { get; set; }
    }
}