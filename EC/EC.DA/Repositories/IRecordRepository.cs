﻿using System;
using EC.Common.Models;

namespace EC.DA.Repositories
{
    public interface IRecordRepository
    {
        Record GetRecordById(int recordId);
        Record[] GetRecordByPatientIdAndDate(int patientId, DateTime recordDate);
        Record[] GetRecordDatesByPatientId(int patientId);
    }
}