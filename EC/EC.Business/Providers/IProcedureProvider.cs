using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IProcedureProvider
    {
        void AddProcedure(string procedureName);
        void DeleteProcedure(int procedureId);
        Procedure[] GetProcedures();
        void UpdateProcedure(int procedureId, string procedureName);
        Procedure GetProcedure(int procedureId);

        void AddProcedureToProcedureList(int recordId, int procedureId, string admMode, int duration);
        void DeleteProcedureFromProcedureList(int recordId, int procedureId);
        Procedure[] GetProcedureList(int recordId);
        void UpdateProcedureList(int recordId, int procedureId, string admMode, int duration);
    }
}