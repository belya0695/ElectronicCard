using StructureMap.Configuration.DSL;
using EC.Common.Log;

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
