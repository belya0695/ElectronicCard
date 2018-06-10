namespace EC.Common.Models
{
    public class Drug
    {
        public int RecordId { get; set; }
        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public string AdministrationMode { get; set; }
        public int TreatmentDuration { get; set; }
    }
}