using System;
using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IRecordProvider
    {
        Record GetRecordById(int recordId);
        Record[] GetRecordByPatientIdAndDate(int patientId, DateTime recordDate);
        Record[] GetRecordDatesByPatientId(int patientId);
    }
}