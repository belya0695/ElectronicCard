using System;
using System.Collections.Generic;
using EC.Common.Models;

namespace EC.Business.Interfaces
{
    public interface IRecordProvider
    {
        Record GetRecordById(int recordId);
        List<Record> GetRecordByPatientIdAndDate(int patientId, DateTime recordDate);
        List<Record> GetRecordDatesByPatientId(int patientId);
    }
}