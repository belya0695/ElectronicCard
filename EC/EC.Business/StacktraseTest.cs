using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC.Business
{
    public interface IStacktraseTest
    {
        void TestMethod();
    }

    public class StacktraseTest : IStacktraseTest
    {
        public void TestMethod()
        {
            throw new ArgumentException();
        }
    }
}

