using StructureMap.Configuration.DSL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC.Business.Container
{
    public class BusinessRegistry : Registry
    {
        public BusinessRegistry()
        {
            For<IStacktraseTest>().Use<StacktraseTest>();
        }
    }
}
