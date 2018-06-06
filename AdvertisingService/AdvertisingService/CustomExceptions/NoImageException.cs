using System.Runtime.Serialization;

namespace AdvertisingService.CustomExceptions
{
    [DataContract]
    public class NoImageException
    {
        [DataMember]
        public string CustomError;
        public NoImageException()
        {
        }
        public NoImageException(string error)
        {
            CustomError = error;
        }
    }
}