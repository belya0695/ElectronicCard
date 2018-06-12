namespace EC.Common.Models
{
    public class Procedure
    {
        public int RecordId { get; set; }
        public int ProcedureId { get; set; }
        public string ProcedureName { get; set; }
        public string AdministrationMode { get; set; }
        public int TreatmentDuration { get; set; }
    }
}