﻿using System;
using log4net;
using log4net.Config;

namespace EC.Common.Log
{
    public class Logger : ILogger
    {
        private static readonly ILog log;

        static Logger()
        {
            log = LogManager.GetLogger("logger");
            XmlConfigurator.Configure();
        }

        public void LogInfo(string message)
        {
            log.Info(message);
        }

        public void LogError(Exception exception)
        {
            log.Error(exception);
        }

        public void LogError(string message)
        {
            log.Error(message);
        }
    }
}