using System.IO;
using System.Linq;
using System.Web.Mvc;
using EC.Business.Interfaces;
using EC.Common.Models;

namespace EC.Web.Controllers
{
    public class AdvController : Controller
    {
        private readonly IAdvProvider _advProvider;

        public AdvController(IAdvProvider advProvider)
        {
            _advProvider = advProvider;
        }

        public ActionResult AdvBlock()
        {
            return View();
        }

        public FileResult GetImage(int id)
        {
            Image img = _advProvider.GetAdvertisings(1).SingleOrDefault();
            if (img == null)
            {
                var dir = Server.MapPath("/Content/Images");
                var path = Path.Combine(dir, "noAdv.jpg");
                return File(path, "image/jpeg");
            }
            return File(img.ImageData, img.Extensions);
        }
    }
}