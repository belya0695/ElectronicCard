﻿using StructureMap.Configuration.DSL;
using EC.Business.Interfaces;
using EC.Business.Providers;

namespace EC.Business.Container
{
    public class BusinessRegistry : Registry
    {
        public BusinessRegistry()
        {
            For<IStacktraseTest>().Use<StacktraseTest>();
            For<IRecordProvider>().Use<RecordProvider>();
            For<IAdvProvider>().Use<AdvProvider>();
        }
    }
}
