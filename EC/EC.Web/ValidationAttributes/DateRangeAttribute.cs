using System;
using System.ComponentModel.DataAnnotations;

namespace EC.Web.ValidationAttributes
{
    public class DateRangeAttribute : RangeAttribute
    {
        public DateRangeAttribute()
    : base(typeof(DateTime),
            DateTime.Now.AddYears(-120).ToShortDateString(),
            DateTime.Now.ToShortDateString())
        { }
    }
}