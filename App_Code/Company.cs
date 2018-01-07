using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for Company
/// </summary>
public class Company
{

    public string CompanyID { get; set; }
    public string CompanyName { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string Region { get; set; }
    public string PostalCode { get; set; }
    public string Country { get; set; }
    public string Phone { get; set; }
    public string Fax { get; set; }

}
namespace ExtM
{
    public static class ExtensionM
    {
        public static bool IsValidEmailAddress(this string s)
        {
            Regex regex = new Regex(@"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
            return regex.IsMatch(s);
        }

        public static string Reverse(this String strReverse)
        {
            char[] charArray = new char[strReverse.Length];
            int len = strReverse.Length - 1;
            for (int i = 0; i <= len; i++)
            {
                charArray[i] = strReverse[len - i];
            }
            return new string(charArray);
        }
    }

    
}
