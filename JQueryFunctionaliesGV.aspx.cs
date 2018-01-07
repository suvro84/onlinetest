using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class JQueryFunctionaliesGV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.GridView2.DataSource = FillDataTable();
        this.GridView2.DataBind();
    }

    protected DataTable FillDataTable()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("id");
        dt.Columns.Add("ApplicationName");
        dt.Columns.Add("ServerName");

        DataRow dr = dt.NewRow();
        dr[0] = "1";
        dr[1] = "Application 1";
        dr[2] = "Server 1";
        dt.Rows.Add(dr);

        DataRow dr1 = dt.NewRow();
        dr1[0] = "2";
        dr1[1] = "Application 2";
        dr1[2] = "Server 2";
        dt.Rows.Add(dr1);

        DataRow dr2 = dt.NewRow();
        dr2[0] = "3";
        dr2[1] = "Application 3";
        dr2[2] = "Server 3";
        dt.Rows.Add(dr2);

        DataRow dr3 = dt.NewRow();
        dr3[0] = "4";
        dr3[1] = "Application 4";
        dr3[2] = "Server 4";
        dt.Rows.Add(dr3);

        DataRow dr4 = dt.NewRow();
        dr4[0] = "5";
        dr4[1] = "Application 5";
        dr4[2] = "Server 5";
        dt.Rows.Add(dr4);

        DataRow dr5 = dt.NewRow();
        dr5[0] = "6";
        dr5[1] = "Application 6";
        dr5[2] = "Server 6";
        dt.Rows.Add(dr5);

        return dt;
        hdtot.Value = Convert.ToString(dt.Rows.Count);
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string key = "";

        //if (e.Row.RowType == DataControlRowType.DataRow &&
        //   e.Row.RowState == DataControlRowState.Normal)
        //{
        //    e.Row.CssClass = "customerRow";
        //    key = GridView2.DataKeys[e.Row.RowIndex].Value.ToString();

        //    e.Row.Attributes.Add("id", key);
        //}

        ////Add CSS class on alternate row.
        //if (e.Row.RowType == DataControlRowType.DataRow &&
        //          e.Row.RowState == DataControlRowState.Alternate)
        //{
        //    e.Row.CssClass = "altrow customerRow";
        //    key = GridView2.DataKeys[e.Row.RowIndex].Value.ToString();

        //    e.Row.Attributes.Add("id", key);
        //}
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int x=1;
        if (x == 1)
        {
       
           // btnSave.Attributes.Add("onclick", "<script>if (confirm(\"Are you certain that you want to insert with selected value 0?\"))return true; else return false;)</script>");
            btnSave.Attributes.Add("onclick", "return confirm('Are you sure you want to do this');");
            //Page.RegisterStartupScript("xx1", "<script>confirm('Are you sure you want to do this');</script>");
            x = 2;

        }
        if (x == 2)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>  confirm('Are you sure you want to do this');</script>");
            Page.RegisterStartupScript("xx", "<script>confirm('Are you sure you want to do this');</script>");
           // btnSave.Attributes.Add("onclick", "return confirm('Are you sure you want to do this');");
            // btnSave.Attributes.Add("onclick", "<script>if (confirm(\"Are you certain that you want to insert with selected value 0?\"))return true; else return false;)</script>");


        }
    }
    //protected void lnkDelete_Click(object sender, EventArgs e)
    //{

    //}
}
