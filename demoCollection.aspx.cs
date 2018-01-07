using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using Rob;


public partial class demoCollection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populateStateddl();
            Response.Write("Visiotrnmber:"+Convert.ToString(Application["activeVisitors"]));

        }
        string strErr="";
        Login objlogin = new Login();
        objlogin.username = "aa";
        objlogin.Address2 = "bb";
        DataManipulationClass objdata = new DataManipulationClass();
        objdata.AddExpert(objlogin, ref strErr);
        
        ArrayList MyList = new ArrayList();

        MyList.Add(1);
        MyList.Add(2);
        MyList.Add(3);
        MyList.Add(4);
        MyList.Add(5);
        // Create an iEnumerator object
        IEnumerator iEnum = MyList.GetEnumerator();

        // Loop through the data using the iEnumerator
        while (iEnum.MoveNext())
        {
            Response.Write((iEnum.Current.ToString()) + "<br>");

        }



       List<User> users = new List<User>();
        for (int x = 0; x < 5; x++)
        {
            User user = new User();
            user.Name = "Rob" + x;
            user.Age = x;
            users.Add(user);
        }

        //foreach (User user in users)
        //{
        //    Response.Write(System.String.Format("{0}:{1}", user.Name, user.Age)+"<br>");
        //}
        Response.Write("<br>");
      //  System.Console.ReadLine();

        //for (int x = 0; x < users.Count; x++)
        //{
        //    Response.Write(System.String.Format("{0}:{1}", users[x].Name, users[x].Age));
        //}

        
        
        
        IEnumerator<User> ie = users.GetEnumerator();

        // Loop through the data using the iEnumerator
        while (ie.MoveNext())
        {
            Response.Write(ie.Current.Name.ToString() + ":"+ie.Current.Age.ToString()+"<br>");

        }





        //        List lst = new List();
        //lst.add("Abhishek");
        //lst.add("Abhijit");
        //lst.add("Manimoy");
        //lst.Add("Raj");
        //lst.Add("Ayan");
        //foreach(string x in lst){
        //if(x.length >5)
        //yeild return x;


        //    }





    }

    public void populateStateddl()
    {

        GCommon<State> obj = new DataManipulationClass().populateState();
        IEnumerator<State> ie = obj.GetEnumerator();
        while (ie.MoveNext())
        {
            ListItem li = new ListItem();
            li.Text = ie.Current.sname.ToString();
            li.Value = ie.Current.sid.ToString();
            ddlState.Items.Add(li);

        }


    }


    //public GCommon<student> fun()
    //{
    //GCommon<student> coll =new GCommon<student>;
    //    student objstd=new student();
    //   objstd.name="Ram";
    //    objstd.rollno=5;
    //    coll.ADD(objstd);
    //}
}
