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
using System.Data.SqlClient;

public partial class grid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Binding GridView with the datasource

            this.GridView3.DataSource = FillDataTable();
            this.GridView3.DataBind();



            this.GridView1.DataSource = FillDataTable();
            this.GridView1.DataBind();
            this.GridView2.DataSource = FillDataTable();
            this.GridView2.DataBind();

            DataTable dtnew = new DataTable();
            dtnew = getTable("select ROW_NUMBER() OVER(order by package_name) AS SlNo,emp_id,package_name,package_cost,checked from emp2");
            DataView dtdup = dtnew.DefaultView;
            gv.DataSource = dtnew;
            this.gv.DataBind();
            gv.FooterRow.Cells[1].Text = Convert.ToString(dtnew.Compute("SUM(emp_id)", ""));
            //gv.FooterRow.Cells[0].Visible = false;
            //gv.FooterRow.Visible = false;
            gv.FooterRow.Cells[2].ColumnSpan = 2;
            //  gv.FooterRow.Cells[1].BorderColor = System.Drawing.Color.White;
            foreach (GridViewRow gr in gv.Rows)
            {


                Literal ltempid = (Literal)gr.FindControl("ltemp_id");
                hdAllempIds.Value += ltempid.Text + "|";
                Literal ltcheck = (Literal)gr.FindControl("ltcheck");
                //CheckBox cb = (CheckBox)gr.FindControl("cb" + ltempid.Text);
                HtmlInputCheckBox cb = (HtmlInputCheckBox)gr.FindControl("cb");
                if (ltcheck.Text == "True")
                {
                    cb.Checked = true;
                }
                else
                {
                    cb.Checked = false;
                }

            }

            gvRowSelect.DataSource = dtnew;
            this.gvRowSelect.DataBind();
            foreach (GridViewRow gr in gvRowSelect.Rows)
            {
                Literal ltempid = (Literal)gr.FindControl("ltemp_id");
                hdAllids.Value += ltempid.Text + "|";


            }


        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString() == "Up")
        {

            TextBox txtsample = (TextBox)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtsample");
            Button btnUpdate = (Button)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("btnUpdate");
            //LinkButton btnUpdate = (LinkButton)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("btnUpdate");
            btnUpdate.Attributes.Add("onclick", "javascript:return valid('" + txtsample.ClientID + "');");

        }
        //if (e.CommandName.ToString() == "Add")
        //{

        //    TextBox txtsample = (TextBox)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("txtsample");
        //    LinkButton lnkAdd = (LinkButton)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("lnkAdd");
        //    lnkAdd.Attributes.Add("onclick", "javascript:return valid('" + txtsample.ClientID + "');");

        //}
        if (e.CommandName.ToString() == "Add")
        {

            TextBox lblPackName = (TextBox)GridView2.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("lblPackName");
            LinkButton lnkAdd = (LinkButton)GridView2.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("lnkAdd");
            lnkAdd.Attributes.Add("onclick", "javascript:return valid('" + lblPackName.ClientID + "');");

        }




    }
    protected DataTable FillDataTable()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ApplicationID");
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
        //hdtot.Value = Convert.ToString(dt.Rows.Count);
    }

    public DataTable getTable(string strSql)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(Convert.ToString(ConfigurationManager.AppSettings["connectionString"])))
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            using (SqlDataAdapter da = new SqlDataAdapter(strSql, con))
            {
                da.Fill(dt);
            }
        }
        return dt;
    }
    //public bool ExecuteProce(ref string strError, Hashtable ht)
    //{
    //    string returnstat = "";
    //    bool bflag = false;
    //    using (SqlConnection con = new SqlConnection(Convert.ToString(ConfigurationManager.AppSettings[""])))
    //    {
    //        if (con.State == ConnectionState.Closed)
    //        {
    //            con.Open();
    //        }
    //        using (SqlCommand cmd = new SqlCommand("sp_test", con))
    //        {
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.Add("@package_name", SqlDbType.VarChar, 250).Value = "";
    //            cmd.Parameters.Add("@package_cost", SqlDbType.Float).Value = "1.50";
    //            cmd.Parameters.Add("@returnstat", SqlDbType.VarChar, 250);
    //            cmd.Parameters.Add("@returnstat", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;
    //            cmd.ExecuteNonQuery();
    //            returnstat = Convert.ToString(cmd.Parameters["returnstat"]);
    //            bflag = true;
    //        }
    //    }

    //}

    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString() == "del")
        {
            Literal ltemp_id = (Literal)gv.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("ltemp_id");


        }
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
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='underline';";
            e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

            e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView2, "Select$" + e.Row.RowIndex);
        }

    }
    protected void gvRowSelect_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Attributes.Add("onclick",
            //                     Page.ClientScript.GetPostBackEventReference(sender as GridView,
            //                                                                 "Select$" + e.Row.RowIndex.ToString()));
            for (int i = 0; i < gvRowSelect.Columns.Count; i++)
            {
                e.Row.Cells[i].Attributes.Add("onclick", "FillColor('" + e.Row.Cells[i].ClientID + "','" + Convert.ToString(gvRowSelect.DataKeys[e.Row.RowIndex]) + "',event");
            }

        }
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
         //   e.Row.Attributes.Add("onmouseover", "this.className='mouseover'");
            if (e.Row.RowIndex % 2 != 0)
            {
                e.Row.Attributes.Add("class", "odd");
            }
            else
            {
                e.Row.Attributes.Add("class", "even");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox txttxtsample = (TextBox)GridView1.Rows[0].FindControl("txtsample");
        string st = txttxtsample.Text;
    }
}
