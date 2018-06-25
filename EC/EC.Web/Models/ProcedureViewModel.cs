using System.ComponentModel.DataAnnotations;

namespace EC.Web.Models
{
    public class ProcedureViewModel
    {
        public int ProcedureId { get; set; }

        [Required(ErrorMessage = "Please, enter procedure name")]
        [StringLength(150, ErrorMessage = "Max length of procedure name is 150 letters")]
        public string ProcedureName { get; set; }
    }
}