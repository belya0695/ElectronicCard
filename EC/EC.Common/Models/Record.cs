using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC.Common.Models
{
    public class Record
    {
        public int recordId;
        public DateTime date;
        public int patientId;
        public string patientFirstName;
        public string patientMiddleName;
        public string patientLastName;
        public string diagnosisName;
        public int sickLeaveId;
        public bool IsSickLeaveIssued;
        public DateTime validFrom;
        public DateTime validTo;
        public string doctorsFirstName;
        public string doctorsLastName;
        public string doctorsPost;
    }
}