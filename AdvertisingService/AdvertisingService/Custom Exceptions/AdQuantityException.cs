using System.Runtime.Serialization;

namespace AdvertisingService.Custom_Exceptions
{
    [DataContract]
    class AdQuantityException
    {
        [DataMember]
        public string CustomError;
        public AdQuantityException()
        {
        }
        public AdQuantityException(string error)
        {
            CustomError = error;
        }
    }
}