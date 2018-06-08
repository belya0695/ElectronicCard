using System;

namespace EC.Common.Log
{
    public interface ILogger
    {
        void LogInfo(string message);
        void LogError(Exception exception);
        void LogError(string message);
    }
}