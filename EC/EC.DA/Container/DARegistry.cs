using StructureMap.Configuration.DSL;
using EC.DA.Repositories;
using EC.DA.Interfaces;
using EC.DA.Clients;

namespace EC.DA.Container
{
    public class DARegistry : Registry
    {
        public DARegistry()
        {
            For<IRecordRepository>().Use<RecordRepository>();
            For<IAdvClient>().Use<AdvClient>();
            For<IAdvertisingRepository>().Use<AdvertisingRepository>();
        }
    }
}