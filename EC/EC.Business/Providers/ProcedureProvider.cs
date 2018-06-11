using EC.Common.Models;
using EC.DA.Repositories;

namespace EC.Business.Providers
{
    public class ProcedureProvider : IProcedureProvider
    {
        private readonly IProcedureRepository _procedureRepository;

        public ProcedureProvider(IProcedureRepository procedureRepository)
        {
            _procedureRepository = procedureRepository;
        }

        public void AddProcedure(string procedureName)
        {
            _procedureRepository.AddProcedure(procedureName);
        }

        public void DeleteProcedure(int procedureId)
        {
            _procedureRepository.DeleteProcedure(procedureId);
        }

        public Procedure[] GetProcedures()
        {
            return _procedureRepository.GetProcedures();
        }

        public void UpdateProcedure(int procedureId, string procedureName)
        {
            _procedureRepository.UpdateProcedure(procedureId, procedureName);
        }


        public void AddProcedureToProcedureList(int recordId, int procedureId, string admMode, int duration)
        {
            _procedureRepository.AddProcedureToProcedureList(recordId, procedureId, admMode, duration);
        }

        public void DeleteProcedureFromProcedureList(int recordId, int procedureId)
        {
            _procedureRepository.DeleteProcedureFromProcedureList(recordId, procedureId);
        }

        public Procedure[] GetProcedureList(int recordId)
        {
            return _procedureRepository.GetProcedureList(recordId);
        }

        public void UpdateProcedureList(int recordId, int procedureId, string admMode, int duration)
        {
            _procedureRepository.UpdateProcedureList(recordId, procedureId, admMode, duration);
        }

        public Procedure GetProcedure(int procedureId)
        {
            return _procedureRepository.GetProcedure(procedureId);
        }
    }
}