using StructureMap.Configuration.DSL;
using EC.Business.Providers;
using EC.Business.Services;

namespace EC.Business.Container
{
    public class BusinessRegistry : Registry
    {
        public BusinessRegistry()
        {
            For<IRecordProvider>().Use<RecordProvider>();
            For<IAdvProvider>().Use<AdvProvider>();
            For<IUserProvider>().Use<UserProvider>();
            For<IAuthService>().Use<AuthService>();
            For<IDiagnosisProvider>().Use<DiagnosisProvider>();
            For<IDrugProvider>().Use<DrugProvider>();
            For<IProcedureProvider>().Use<ProcedureProvider>();
        }
    }
}