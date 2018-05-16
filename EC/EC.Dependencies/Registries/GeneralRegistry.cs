using StructureMap.Configuration.DSL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC.Business.Container;
using EC.Common.Container;
using EC.DA.Container;

namespace EC.Dependencies.Registries
{
    public class GeneralRegistry : Registry
    {
        public GeneralRegistry()
        {
            Scan(s => 
            {
                s.Assembly(typeof(BusinessRegistry).Assembly);
                s.Assembly(typeof(CommonRegistry).Assembly);
                s.Assembly(typeof(DARegistry).Assembly);
                s.WithDefaultConventions();
            });
            
        }
    }
}
