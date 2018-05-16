using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC.DA.Interfaces
{
    public interface IPatientRepository
    {
        void Insert(string connectionString);
        void Update(string connectionString);
        void Delete(string connectionString);
        void Select(string connectionString);
        void GetAllPatients(string connectionString);
    }
}