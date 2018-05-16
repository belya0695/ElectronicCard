using StructureMap.Configuration.DSL;
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
