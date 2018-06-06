using StructureMap.Configuration.DSL;
using EC.Business.Providers;
using EC.Business.Services;

namespace EC.Business.Container
{
    public class BusinessRegistry : Registry
    {
        public BusinessRegistry()
        {
            For<IStacktraseTest>().Use<StacktraseTest>();
            For<IRecordProvider>().Use<RecordProvider>();
            For<IAdvProvider>().Use<AdvProvider>();
            For<IUserProvider>().Use<UserProvider>();
            For<IAuthService>().Use<AuthService>();
        }
    }
}
