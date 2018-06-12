using Microsoft.VisualStudio.TestTools.UnitTesting;
using EC.Business.Providers;
using EC.DA.Repositories;
using EC.Common.Models;
using Moq;
using System.Linq;
using System.Collections.Generic;

namespace EC.UnitTests
{
    [TestClass]
    public class DrugProviderTest
    {
        [TestMethod]
        public void DrugProviderGetDrugTest()
        {
            Mock<IDrugRepository> mock = new Mock<IDrugRepository>();
            mock.Setup(m => m.GetDrugs()).Returns(new Drug[]{
                new Drug {DrugId=1, DrugName="QQQ"},
                new Drug {DrugId=2, DrugName="WWW"}
                });

            IDrugProvider drugProvider = new DrugProvider(mock.Object);

            int expectedSize = 2;
            string expectedName = "QQQ";

            IEnumerable<Drug> TestResult = drugProvider.GetDrugs();
            Drug[] drugs = TestResult.ToArray();

            Assert.IsTrue(drugs.Length == expectedSize);
            Assert.AreEqual(drugs[0].DrugName, expectedName);
        }
    }
}
