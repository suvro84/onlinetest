using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Collections.ObjectModel;

/// <summary>
/// Summary description for CollectionOfClasses
/// </summary>
public class CollectionOfClasses
{
    public CollectionOfClasses()
    {
        //
        // TODO: Add constructor logic here
        //
    }

}


public class GCommon<T> : Collection<T> where T : ICommonInterface
{


    public void Add(T item)
    {
        base.Add(item);
    }
    public void Clear(T item)
    {
        base.Clear();
    }
}


public interface ICommonInterface
{
}
public class student : ICommonInterface
{
    private string _name;
    private int _rollno;
    public string name
    {
        get
        {
            return _name;
        }
        set
        {

            _name = value;
        }
    }

    public int rollno
    {
        get
        {
            return _rollno;
        }
        set
        {

            _rollno = value;
        }
    }

}


public class State : ICommonInterface
{
    private int _sid;
    private string _sname;

    public int sid
    {
        get
        {
            return _sid;
        }
        set
        {

            _sid = value;
        }
    }

    public string sname
    {
        get
        {
            return _sname;
        }
        set
        {

            _sname = value;
        }
    }

}


public class Login : ICommonInterface
{
    private string _username;
    private string _Password;
    private string _Address1;
    private string _Address2;
    private int _cityid;
    private int _state_id;
    private int _country_id;

    private string _pin;
    private string _phone;
    private string _Mobile;
    private string _Reference_no;

    public string username
    {
        get
        {
            return _username;
        }
        set
        {
            _username = value;

        }
    }

    public string Password
    {
        get
        {
            return _Password;
        }
        set
        {
            _Password = value;

        }
    }

   
    public string Address1
    {
        get
        {
            return _Address1;
        }
        set
        {
            _Address1 = value;

        }
    }

    public string Address2
    {
        get
        {
            return _Address2;
        }
        set
        {
            _Address2 = value;

        }
    }
    public int cityid
    {
        get
        {
            return _cityid;
        }
        set
        {

            _cityid = value;
        }
    }
    public int state_id
    {
        get
        {
            return _state_id;
        }
        set
        {

            _state_id = value;
        }
    }
    public int country_id
    {
        get
        {
            return _country_id;
        }
        set
        {

            _country_id = value;
        }
    }
    public string pin
    {
        get
        {
            return _pin;
        }
        set
        {

            _pin = value;
        }
    }
    public string Mobile
    {
        get
        {
            return _Mobile;
        }
        set
        {
            _Mobile = value;

        }
    }
    public string Reference_no
    {
        get
        {
            return _Reference_no;
        }
        set
        {
            _Reference_no = value;

        }
    }

}

public class AddressDetails : ICommonInterface
{
    private string _Address1;
    private string _Address2;
    private int _cityid;
    private int _state_id;
    private int _country_id;

    private string _pin;
    private string _phone;
    private string _Mobile;
    private string _Reference_no;

    public string Address1
    {
        get
        {
            return _Address1;
        }
        set
        {
            _Address1 = value;

        }
    }

    public string Address2
    {
        get
        {
            return _Address2;
        }
        set
        {
            _Address2 = value;

        }
    }
    public int cityid
    {
        get
        {
            return _cityid;
        }
        set
        {

            _cityid = value;
        }
    }
    public int state_id
    {
        get
        {
            return _state_id;
        }
        set
        {

            _state_id = value;
        }
    }
    public int country_id
    {
        get
        {
            return _country_id;
        }
        set
        {

            _country_id = value;
        }
    }
    public string pin
    {
        get
        {
            return _pin;
        }
        set
        {

            _pin = value;
        }
    }
    public string Mobile
    {
        get
        {
            return _Mobile;
        }
        set
        {
            _Mobile = value;

        }
    }
    public string Reference_no
    {
        get
        {
            return _Reference_no;
        }
        set
        {
            _Reference_no = value;

        }
    }

}


public enum RecordStatus
{


}
public class City : ICommonInterface
{
    private int _city_id;
    private string _city_name;
    private DateTime _city_datetime;
    private int _city_status;


    public int city_id
    {
        get
        {
            return _city_id;
        }
        set
        {

            _city_id = value;
        }
    }

    public string city_name
    {
        get
        {
            return city_name;
        }
        set
        {
            city_name = value;

        }
    }


    public DateTime city_datetime
    {
        get
        {
            return _city_datetime;
        }
        set
        {
            _city_datetime = value;

        }
    }


    public int city_status
    {
        get
        {
            return _city_status;
        }
        set
        {
            _city_status = value;

        }
    }
}

public class Service : ICommonInterface
{
    private int _service_id;
    private string _service_name;
    private DateTime _service_datetime;
    private int _service_status;


    public int service_id
    {
        get
        {
            return _service_id;
        }
        set
        {

            _service_id = value;
        }
    }

    public string service_name
    {
        get
        {
            return _service_name;
        }
        set
        {
            _service_name = value;

        }
    }


    public DateTime service_datetime
    {
        get
        {
            return _service_datetime;
        }
        set
        {
            _service_datetime = value;

        }
    }


    public int service_status
    {
        get
        {
            return _service_status;
        }
        set
        {
            _service_status = value;

        }
    }
}

public class SubService : ICommonInterface
{
    private int _subservice_id;
    private string _subservice_name;
    private DateTime _subservice_datetime;
    private int _subservice_status;


    public int subservice_id
    {
        get
        {
            return _subservice_id;
        }
        set
        {

            _subservice_id = value;
        }
    }

    public string subservice_name
    {
        get
        {
            return _subservice_name;
        }
        set
        {
            _subservice_name = value;

        }
    }


    public DateTime subservice_datetime
    {
        get
        {
            return _subservice_datetime;
        }
        set
        {
            _subservice_datetime = value;

        }
    }


    public int subservice_status
    {
        get
        {
            return _subservice_status;
        }
        set
        {
            _subservice_status = value;

        }
    }
}





