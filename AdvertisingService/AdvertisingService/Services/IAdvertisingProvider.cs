using AdvertisingService.CustomExceptions;
using AdvertisingService.Dto;
using System.ServiceModel;

namespace AdvertisingService.Services
{
	[ServiceContract]
	public interface IAdvertisingProvider
	{
		[OperationContract]
        [FaultContract(typeof(AdQuantityException))]
        [FaultContract(typeof(NoImageException))]
		Advertising[] GetAdvertising(int quantity);
	}
}