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

public partial class testMultiselectCopyGrid1 : System.Web.UI.Page
{
    DataTable dtNew = new DataTable();

    string seletedIds = "";
    string seletedValues = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["selected"] = null;
        if (!IsPostBack)
        {
            GridView1.DataSource = GetDatatable();
            GridView1.DataBind();
            hdAllempIds.Value = "1,2,3,4,5,6,7,8,";

            //if (GridView2.Rows.Count == 0)
            //{
            //    DataTable dtTemp = new DataTable();

            //    dtTemp.Columns.Add("ID", typeof(string));
            //    dtTemp.Columns.Add("Value", typeof(string));
            //    dtTemp.Rows.Add("", "");
            //    dtTemp.Rows.Add("", "");
            //    dtTemp.Rows.Add("", "");
            //    dtTemp.Rows.Add("", "");
            //    dtTemp.Rows.Add("", "");
            //    dtTemp.Rows.Add("", "");
            //    dtTemp.Rows.Add("", "");
            //    dtTemp.Rows.Add("", "");
            //    GridView2.DataSource = dtTemp;
            //    GridView2.DataBind();
            //    GridView2.ShowHeader = true;
            //    GridView2.Columns[0].Visible = false;

            //}
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string[] ArrStrIds = hdAllempIds.Value.Split(new char[] { ',' });
        DataTable dtitem = null;
        if (Session["seletedIds"] == null && Session["seletedValues"] == null)
        {
            for (int i = 0; i < ArrStrIds.Length - 1; i++)
            {
                if (Request.Form.Get("cb" + ArrStrIds[i]) != null)
                {
                    seletedIds += ArrStrIds[i] + ",";
                    if (Request.Form.Get("txt" + ArrStrIds[i]) != null)
                    {
                        seletedValues += Request.Form.Get("txt" + ArrStrIds[i]) + ",";
                    }
                }
            }
            dtitem = GetDatatable();
            Session["seletedIds"] = seletedIds;
            Session["seletedValues"] = seletedValues;
            Session["dtitem"] = dtitem;
        }
        else
        {
            dtitem = new DataTable();
            dtitem.Columns.Add("ID", typeof(int));
            dtitem.Columns.Add("Value", typeof(string));
            foreach (GridViewRow gr in GridView1.Rows)
            {
                Literal ltValue1 = (Literal)gr.FindControl("ltValue1");
                Literal ltID1 = (Literal)gr.FindControl("ltID1");
                dtitem.Rows.Add(ltID1.Text, ltValue1.Text);

            }
            if (GridView2.Rows.Count == 0)
            {
                seletedIds = Convert.ToString(Session["seletedIds"]);
                seletedValues = Convert.ToString(Session["seletedValues"]);
            }
            else
            {

            }
            for (int i = 0; i < ArrStrIds.Length - 1; i++)
            {
                if (Request.Form.Get("cb" + ArrStrIds[i]) != null)
                {
                    seletedIds += ArrStrIds[i] + ",";
                    if (Request.Form.Get("txt" + ArrStrIds[i]) != null)
                    {
                        seletedValues += Request.Form.Get("txt" + ArrStrIds[i]) + ",";
                    }
                }
            }
            Session["seletedIds"] = seletedIds;
            Session["seletedValues"] = seletedValues;
            Session["dtitem"] = dtitem;
        }
        string[] arrIds = seletedIds.ToString().Split(new char[] { ',' });
        string[] arrValues = seletedValues.ToString().Split(new char[] { ',' });

        dtNew.Columns.Add(Convert.ToString(GridView2.Columns[1].HeaderText), typeof(int));
        dtNew.Columns.Add(Convert.ToString(GridView2.Columns[2].HeaderText), typeof(string));
        if (fnRemoveValuesfromDT(dtitem, arrIds))
        {
            GridView1.DataSource = dtitem;
            GridView1.DataBind();

            //if (dtitem.Rows.Count > 0)
            //{
            //    GridView1.DataSource = dtitem;
            //    GridView1.DataBind();
            //    spGv1.InnerHtml = "";
            //    GridView1.Visible = true;
            //}
            //else
            //{
            //    spGv1.InnerHtml = "No Record";
            //    GridView1.Visible = false;
            //    GridView1.Rows.Count = 0;
            //}
            fnAddValuesToDT(dtNew, arrIds, arrValues);
        }
    }
    public DataTable GetDatatable()
    {
        DataTable table = new DataTable();
        table.Columns.Add("ID", typeof(int));
        table.Columns.Add("Value", typeof(string));
        table.Rows.Add(1, "test1");
        table.Rows.Add(2, "test2");
        table.Rows.Add(3, "test3");
        table.Rows.Add(4, "test4");
        table.Rows.Add(5, "test5");
        table.Rows.Add(6, "test6");
        table.Rows.Add(7, "test7");
        table.Rows.Add(8, "test8");
        //   hddt.Value = Convert.ToString(table);

        //  Session["dt"] = table;
        return table;
    }
    public DataTable MakeDatatable()
    {
        DataTable table = new DataTable();
        table.Columns.Add("ID", typeof(int));
        table.Columns.Add("Value", typeof(string));
        table.Rows.Add(1, "test1");
        table.Rows.Add(2, "test2");
        table.Rows.Add(3, "test3");
        table.Rows.Add(4, "test4");
        table.Rows.Add(5, "test5");
        table.Rows.Add(6, "test6");
        table.Rows.Add(7, "test7");
        table.Rows.Add(8, "test8");
        //   hddt.Value = Convert.ToString(table);

        //  Session["dt"] = table;
        return table;
    }
    public bool fnRemoveValuesfromDT(DataTable dtitem, string[] arrIds)
    {
        bool flag = false;
        if (dtitem.Rows.Count > 0)
        {
            for (int j = 0; j < arrIds.Length - 1; j++)
            {

                for (int i = 0; i < dtitem.Rows.Count; i++)
                {
                    DataRow dr = dtitem.Rows[i];
                    if (Convert.ToInt32(dr["ID"]) == Convert.ToInt32(arrIds[j]))
                    {
                        dtitem.Rows.Remove(dr);
                        flag = true;
                    }
                }
            }
            Session["dtitem"] = dtitem;
        }
        return flag;
    }


    public void fnAddValuesToDT(DataTable dtNew, string[] arrIds, string[] arrValues)
    {
        bool flag = false;
        if (Session["seletedIds"] == null && Session["seletedValues"] == null)
        {
            for (int i = 0; i < arrIds.Length - 1; i++)
            {
                for (int j = 0; j < arrValues.Length - 1; j++)
                {
                    if (i == j)
                    {
                        dtNew.Rows.Add(Convert.ToInt32(arrIds[i]), Convert.ToString(arrValues[j]));
                        flag = true;
                    }
                }
            }
            Session["dtNew"] = dtNew;
            GridView2.DataSource = dtNew;
            GridView2.DataBind();
            //if (dtNew.Rows.Count > 0)
            //{
            //    GridView2.DataSource = dtNew;
            //    GridView2.DataBind();
            //    GridView2.Visible = true;
            //    spGv2.InnerHtml = "";
            //}
            //else
            //{
            //    spGv2.InnerHtml = "No Record";
            //    GridView2.Visible = false;
            //}
        }
        else
        {
            if (GridView2.Rows.Count != 0)
            {
                foreach (GridViewRow gr in GridView2.Rows)
                {
                    Literal ltValue = (Literal)gr.FindControl("ltValue");
                    Literal ltID = (Literal)gr.FindControl("ltID");
                    dtNew.Rows.Add(ltID.Text, ltValue.Text);
                }
            }
            else
            {
            }
            for (int i = 0; i < arrIds.Length - 1; i++)
            {
                for (int j = 0; j < arrValues.Length - 1; j++)
                {
                    if (i == j)
                    {
                        dtNew.Rows.Add(Convert.ToInt32(arrIds[i]), Convert.ToString(arrValues[j]));
                        flag = true;
                    }
                }
            }
            Session["dtNew"] = dtNew;
            GridView2.DataSource = dtNew;
            GridView2.DataBind();
            //if (dtNew.Rows.Count > 0)
            //{
            //    GridView2.DataSource = dtNew;
            //    GridView2.DataBind();
            //    GridView2.Visible = true;
            //    spGv2.InnerHtml = "";
            //}
            //else
            //{
            //    spGv2.InnerHtml = "No Record";
            //    GridView2.Visible = false;
            //}
        }

    }

    public void fnAddValuesToDTForGV1(DataTable dtNew, string[] arrIds, string[] arrValues)
    {
        bool flag = false;
        if (Session["seletedIds"] == null && Session["seletedValues"] == null)
        {
            for (int i = 0; i < arrIds.Length - 1; i++)
            {
                for (int j = 0; j < arrValues.Length - 1; j++)
                {
                    if (i == j)
                    {
                        dtNew.Rows.Add(Convert.ToInt32(arrIds[i]), Convert.ToString(arrValues[j]));
                        flag = true;
                    }
                }
            }
            Session["dtNew"] = dtNew;
            GridView2.DataSource = dtNew;
            GridView2.DataBind();
            //if (dtNew.Rows.Count > 0)
            //{
            //    GridView2.DataSource = dtNew;
            //    GridView2.DataBind();
            //    GridView2.Visible = true;
            //    spGv2.InnerHtml = "";
            //}
            //else
            //{
            //    spGv2.InnerHtml = "No Record";
            //    GridView2.Visible = false;
            //}
        }
        else
        {
            for (int i = 0; i < arrIds.Length - 1; i++)
            {
                for (int j = 0; j < arrValues.Length - 1; j++)
                {
                    if (i == j)
                    {
                        dtNew.Rows.Add(Convert.ToInt32(arrIds[i]), Convert.ToString(arrValues[j]));
                        flag = true;
                    }
                }
            }
            Session["dtNew"] = dtNew;
            GridView1.DataSource = dtNew;
            GridView1.DataBind();
            //if (dtNew.Rows.Count > 0)
            //{
            //    GridView1.DataSource = dtNew;
            //    GridView1.DataBind();
            //    spGv1.InnerHtml = "";
            //    GridView1.Visible = true;
            //}
            //else
            //{
            //    spGv1.InnerHtml = "No Record";
            //    GridView1.Visible = false;
            //}
        }
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        string[] ArrStrIds = hdAllempIds.Value.Split(new char[] { ',' });
        string seletedValues = "";
        string seletedIds = "";
        dtNew = new DataTable();
        //dtNew.Columns.Add("ID", typeof(int));
        //dtNew.Columns.Add("Value", typeof(string));
        dtNew.Columns.Add(Convert.ToString(GridView2.Columns[1].HeaderText), typeof(int));
        dtNew.Columns.Add(Convert.ToString(GridView2.Columns[2].HeaderText), typeof(string));
        foreach (GridViewRow gr in GridView2.Rows)
        {
            HtmlInputCheckBox cb = (HtmlInputCheckBox)gr.FindControl("cb1");

            Literal ltValue = (Literal)gr.FindControl("ltValue");
            Literal ltID = (Literal)gr.FindControl("ltID");
            dtNew.Rows.Add(ltID.Text, ltValue.Text);
            if (cb.Checked == true)
            {
                seletedValues += ltValue.Text + ",";
                seletedIds += ltID.Text + ",";
            }
            else
            {
            }
        }
        DataTable dtitem = null;
        //if (Session["dtNew"] != null)
        //{
        //    dtNew = (DataTable)Session["dtNew"];
        //}
        //if (Session["dtitem"] != null)
        //{
        //    dtitem = (DataTable)Session["dtitem"];
        //}
        dtitem = dtNew.Clone();
        if (GridView1.Rows.Count > 0)
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                //HtmlInputCheckBox cb =(HtmlInputCheckBox)gr.FindControl("cb1");

                Literal ltValue = (Literal)gr.FindControl("ltValue1");
                Literal ltID = (Literal)gr.FindControl("ltID1");
                dtitem.Rows.Add(ltID.Text, ltValue.Text);

            }
        }

        string[] arrIds = seletedIds.ToString().Split(new char[] { ',' });
        string[] arrValues = seletedValues.ToString().Split(new char[] { ',' });
        if (fnRemoveValuesfromDT(dtNew, arrIds))
        {
            //if (dtNew.Rows.Count > 0)
            //{
            //    GridView2.DataSource = dtNew;
            //    GridView2.DataBind();
            //    spGv2.InnerHtml = "";
            //    GridView2.Visible = true;
            //}
            //else
            //{

            //    spGv2.InnerHtml = "No Record";
            //    GridView2.Visible = false;

            //}
            GridView2.DataSource = dtNew;
            GridView2.DataBind();
            fnAddValuesToDTForGV1(dtitem, arrIds, arrValues);
        }
    }



    //protected void btnUp_Click(object sender, EventArgs e)
    //{
    //    DataTable dtitem = new DataTable();
    //    dtitem = GetDatatable();
    //    if (Session["selected"] == null)
    //    {
    //        Session["selected"] = 0;

    //    }
    //    else
    //    {
    //    }
    //    //DataRow drTemp = new DataRow();
    //    DataRow drTemp = dtitem.NewRow();
    //    for (int i = 0; i < dtitem.Rows.Count; i++)
    //    {
    //        if (i == Convert.ToInt32(Session["selected"]))
    //        {
    //            DataRow dr = dtitem.Rows[i];
    //            DataRow dr2 = dtitem.Rows[i + 1];
    //            //while (dr.GetChildRows())
    //            //{
    //            drTemp["id"] = dr2["id"];
    //            drTemp["Value"] = dr2["Value"];

    //            dr2["id"] = dr["id"];
    //            dr2["Value"] = dr["Value"];
    //            // dr2 = dr;

    //            dr["id"] = drTemp["id"];
    //            dr["Value"] = drTemp["Value"];
    //            //dr = drTemp;
    //            //}
    //            Session["selected"] = i + 1;
    //            // Page.RegisterStartupScript("xx", "<script>alert('hi');</script>");
    //            // ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>alert(document.getElementId('"+i+"').css({ \"background-color\": \"White\", \"color\": \"Black\" }));</script>");
    //            //ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>alert(document.getElementId('"+i+"'));</script>");

    //            ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>document.getElementById(1).bgColor = \"#800000\";</script>");



    //            // Page.ClientScript.RegisterStartupScript(GetType(Page), "PopupScript",  "<script>CallFunction();</script>")
    //            break;
    //        }


    //    }
    //    dtitem.AcceptChanges();
    //    if (dtitem.Rows.Count > 0)
    //    {
    //        GridView1.DataSource = dtitem;
    //        GridView1.DataBind();

    //    }
    //    //else
    //    //{
    //    //    spGv1.InnerHtml = "No Record";
    //    //    GridView1.Visible = false;
    //    //    GridView1.Rows.Count = 0;
    //    //}
    //}

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            string key = GridView1.DataKeys[e.Row.RowIndex].Value.ToString();

            e.Row.Attributes.Add("ID", key);

        }
    }

    protected void btnUp_Click(object sender, EventArgs e)
    {
        DataTable dtitem = new DataTable();
        dtitem = GetDatatable();
        if (Session["selected"] == null)
        {
            Session["selected"] = 0;

        }
        else
        {
        }
        //DataRow drTemp = new DataRow();
        DataRow drTemp = dtitem.NewRow();
        for (int i = 0; i < dtitem.Rows.Count; i++)
        {
            if (i == Convert.ToInt32(Session["selected"]))
            {
                DataRow dr = dtitem.Rows[i];
                DataRow dr2 = dtitem.Rows[i + 1];
                //while (dr.GetChildRows())
                //{
                drTemp["id"] = dr2["id"];
                drTemp["Value"] = dr2["Value"];

                dr2["id"] = dr["id"];
                dr2["Value"] = dr["Value"];
                // dr2 = dr;

                dr["id"] = drTemp["id"];
                dr["Value"] = drTemp["Value"];
                //dr = drTemp;
                //}
                Session["selected"] = i + 1;
                // Page.RegisterStartupScript("xx", "<script>alert('hi');</script>");
                // ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>alert(document.getElementId('"+i+"').css({ \"background-color\": \"White\", \"color\": \"Black\" }));</script>");
                //ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>alert(document.getElementId('"+i+"'));</script>");

                ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>document.getElementById(1).bgColor = \"#800000\";</script>");



                // Page.ClientScript.RegisterStartupScript(GetType(Page), "PopupScript",  "<script>CallFunction();</script>")
                break;
            }


        }
        dtitem.AcceptChanges();
        if (dtitem.Rows.Count > 0)
        {
            GridView1.DataSource = dtitem;
            GridView1.DataBind();

        }
        //else
        //{
        //    spGv1.InnerHtml = "No Record";
        //    GridView1.Visible = false;
        //    GridView1.Rows.Count = 0;
        //}
    }

}
