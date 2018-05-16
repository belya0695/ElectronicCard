using System;
using System.Collections.Generic;
using EC.Common.Models;

namespace EC.DA.Interfaces
{
    public interface IRecordRepository
    {
        Record GetRecordById(int recordId);
        List<Record> GetRecordByPatientIdAndDate(int patientId, DateTime recordDate);
        List<Record> GetRecordDatesByPatientId(int patientId);
    }
}