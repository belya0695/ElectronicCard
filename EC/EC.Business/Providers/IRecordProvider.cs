﻿using System;
using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IRecordProvider
    {
        Record GetRecordById(int recordId);
        Record[] GetRecordByPatientIdAndDate(int patientId, DateTime recordDate);
        Record[] GetRecordDatesByPatientId(int patientId);
        Record[] GetRecordByPatientIdAndDiagnosis(int patientId, string diagnosis);
        Record[] GetRecordByPatientIdAndDoctorsPost(int patientId, string post);
        void AddRecordAndSickLeave(int patientId, int diagnosisId, int doctorId);
        void DeleteRecordAndSickLeave(int recordId);
    }
}