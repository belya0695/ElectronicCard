using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class ProcedureViewModel
    {
        [Required(ErrorMessage = "Enter procedure name")]
        public string ProcedureName { get; set; }
    }
}