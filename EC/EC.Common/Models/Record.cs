using System;

namespace EC.Common.Models
{
    public class Record
    {
        public int recordId { get; set; }
        public DateTime date { get; set; }
        public int patientId { get; set; }
        public string patientFirstName { get; set; }
        public string patientMiddleName { get; set; }
        public string patientLastName { get; set; }
        public string diagnosisName { get; set; }
        public int sickLeaveId { get; set; }
        public bool IsSickLeaveIssued { get; set; }
        public DateTime validFrom { get; set; }
        public DateTime validTo { get; set; }
        public string doctorsFirstName { get; set; }
        public string doctorsLastName { get; set; }
        public string doctorsPost { get; set; }
    }
}