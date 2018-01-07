using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class jqery_gv_ddl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ListItem lst;
        //string text;
        //for (int i = 0; i < 10; i++)
        //{
        //    text = i.ToString() + " Checkbox in DDL";
        //    lst = new ListItem(text, i.ToString());
        //    chkList.Items.Add(lst);
        //}
        DataTable dtListItem = GetListItem();
        GridView1.DataSource = dtListItem;
        GridView1.DataBind();


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
}
