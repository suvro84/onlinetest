using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class floatingdiv_gv : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindUsers();
    }
    public void BindUsers()
    {
        //DataTable dt = GetUsersForModeration();
        DataTable dt = new DataTable();
        if (Session["dt"] == null)
        {
            dt = GetDatatable();
        }
        else
        {
            dt = GetDatatable();
        }
        gvUsers.DataSource = dt;
        gvUsers.DataBind();
       // hdTot.Value = Convert.ToString(dt.Rows.Count);
        ViewState["dtdata1"] = dt;
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script> document.getElementById('0').style.backgroundColor = '#ff0000';</script>");
    }

    public DataTable GetDatatable()
    {
        DataTable table = new DataTable();
        table.Columns.Add("ID", typeof(int));
        table.Columns.Add("Value", typeof(string));
        table.Rows.Add(50, "test1");
        table.Rows.Add(40, "test2");
        table.Rows.Add(30, "test3");
        table.Rows.Add(20, "test4");
        table.Rows.Add(10, "test5");
        table.Rows.Add(5, "test6");
        table.Rows.Add(70, "test7");
        table.Rows.Add(80, "test8");
        //   hddt.Value = Convert.ToString(table);

        //  Session["dt"] = table;
        return table;
    }
}
