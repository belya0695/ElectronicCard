using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

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