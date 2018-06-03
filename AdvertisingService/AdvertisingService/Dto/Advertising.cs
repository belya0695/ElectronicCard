using System.Runtime.Serialization;

namespace AdvertisingService.Dto
{
    [DataContract]
	public class Advertising
	{
		[DataMember]
		public byte[] ImageData { get; set; }
		[DataMember]
		public string Extensions { get; set; }
	}
}