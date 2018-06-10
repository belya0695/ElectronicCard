using StructureMap.Configuration.DSL;
using EC.DA.Repositories;
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
            For<IUserRepository>().Use<UserRepository>();
            For<IDiagnosisRepository>().Use<DiagnosisRepository>();
            For<IDrugRepository>().Use<DrugRepository>();
            For<IProcedureRepository>().Use<ProcedureRepository>();
        }
    }
}