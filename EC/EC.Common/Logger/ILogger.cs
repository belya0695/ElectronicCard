﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC.Common.Loggers
{
    public interface ILogger
    {
        void LogInfo(string message);
        void LogError(Exception exception);
        void LogError(string message);
    }
}