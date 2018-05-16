using StructureMap.Configuration.DSL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC.Common.Loggers;

namespace EC.Common.Container
{
    public class CommonRegistry : Registry
    {
        public CommonRegistry()
        {
            For<ILogger>().Use<Logger>();
        }
    }
}
