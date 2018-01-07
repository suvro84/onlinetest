using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class testMultiselectGridCopy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dtListItem = GetListItem();
        GridView1.DataSource = dtListItem;
        GridView1.DataBind();
        hdAllempIds.Value = "1,2,3,4,5,6,7,8";

        DataTable dt2 = new DataTable();
        if (dt2.Rows.Count == 0)
        {
            dt2.Columns.Add("ID", typeof(string));
            dt2.Columns.Add("Value", typeof(string));
            dt2.Rows.Add("", "");
            dt2.Rows.Add("", "");
            dt2.Rows.Add("", "");
            dt2.Rows.Add("", "");
            dt2.Rows.Add("", "");
            dt2.Rows.Add("", "");
            dt2.Rows.Add("", "");
            dt2.Rows.Add("", "");
            GridView2.DataSource = dt2;
            GridView2.DataBind();
            GridView2.ShowHeader = true;
            GridView2.Columns[0].Visible = false;

        }
            
           
        
      
        
        
       


    }

    public DataTable GetListItem()
    {
        DataTable table = new DataTable();
        table.Columns.Add("ID", typeof(int));
        table.Columns.Add("Value", typeof(string));

        table.Rows.Add(1, "ListItem1");
        table.Rows.Add(2, "ListItem2");
        table.Rows.Add(3, "ListItem3");
        table.Rows.Add(4, "My ListItem Wraps also");
        table.Rows.Add(5, "My New ListItem5");
        table.Rows.Add(6, "ListItem6");
        table.Rows.Add(7, "ListItem7");
        table.Rows.Add(8, "ListItem8");

        return table;

    }
    protected void btnServerDel_Click(object sender, EventArgs e)
    {
        string[] strCityIds = hdAllempIds.Value.Split(new char[] { '|' });

        string seletedcities = "";
        for (int i = 0; i < strCityIds.Length - 1; i++)
        {
            if (Request.Form.Get("cb" + strCityIds[i]) != null)
            {
                seletedcities += strCityIds[i] + "|";
            }
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {

        string[] strCityIds = hdAllempIds.Value.Split(new char[] { ',' });

        string seletedcities = "";
        string seletedValues = "";
        for (int i = 0; i < strCityIds.Length - 1; i++)
        {
            if (Request.Form.Get("cb" + strCityIds[i]) != null)
            {
                seletedcities += strCityIds[i] + ",";
                if (Request.Form.Get("sp" + strCityIds[i]) != null)
                {
                    seletedValues += Request.Form.Get("sp" + strCityIds[i]) + ",";
                }
            }


        }

        //seletedValues += Request.Form.Get("sp" + seletedcities + ",";

        DataTable dtitem = GetListItem();
        string[] arr = seletedcities.ToString().Split(new char[] { ',' });
        hdAllempIds.Value = hdAllempIds.Value.Replace(seletedcities, "");
        if (dtitem.Rows.Count > 0)
        {
            for (int j = 0; j < arr.Length - 1; j++)
            {

                for (int i = 0; i < dtitem.Rows.Count; i++)
                {
                    DataRow dr = dtitem.Rows[i];
                    if (Convert.ToInt32(dr["ID"]) == Convert.ToInt32(arr[j]))
                    {
                        //dr.Delete();
                        dtitem.Rows.Remove(dr);
                    }
                }
            }
        }

        GridView1.DataSource = dtitem;
        GridView1.DataBind();

    }
}
