using System;
using System.Collections.Generic;
using System.Linq;
using log4net;
using log4net.Config;

namespace EC.Common.Loggers
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
            throw new NotImplementedException();
        }

        public void LogError(string message)
        {
            throw new NotImplementedException();
        }
    }
}