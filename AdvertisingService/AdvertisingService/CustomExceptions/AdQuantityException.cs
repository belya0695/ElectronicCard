using System.Runtime.Serialization;

namespace AdvertisingService.CustomExceptions
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