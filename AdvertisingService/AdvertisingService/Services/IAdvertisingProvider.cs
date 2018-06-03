using AdvertisingService.Dto;
using System.ServiceModel;

namespace AdvertisingService.Services
{
	[ServiceContract]
	public interface IAdvertisingProvider
	{
		[OperationContract]
		Advertising[] GetAdvertising(int quantity);
	}
}