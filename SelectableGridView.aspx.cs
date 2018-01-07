using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.Common;
using System.Data.SqlClient;
using System.Reflection;
using Rob;

public partial class SelectableGridView : System.Web.UI.Page
{
    private int _i = 0;
    // static Int32 rowID = 1;
    int _intcounter = 1;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
            BindUsers();
        if (ViewState["Icount"] == null)
        {
            ViewState["Icount"] = 0;
        }
        //Session["rowID"] = null;

        //List<Service> obj = new DataManipulationClass().populateService_list();
        //DataTable dt = GenericListToDataTable(obj);
        //ViewState["dtdata1"] = dt;
        //this.gridTest.DataSource = dt;
        //this.gridTest.DataBind();


        Type t = typeof(User);

        foreach (FieldInfo field in t.GetFields())
        {

            if (field.Name == "city")
            {
                //do stuff when we find the field that has the attribute we need
            }

        }

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
        hdTot.Value = Convert.ToString(dt.Rows.Count);
        ViewState["dtdata1"] = dt;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script> document.getElementById('0').style.backgroundColor = '#ff0000';</script>");
    }
    public DataTable GetUsersForModeration()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Sql"].ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand("SP_GetUsersForModeration", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter ada = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        ada.Fill(ds);
        return ds.Tables[0];
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
    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    string key = gvUsers.DataKeys[e.Row.RowIndex].Value.ToString();           
        //    e.Row.Attributes.Add("id", key);
        //}

        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate || e.Row.RowState == DataControlRowState.Normal))
        {
            e.Row.Attributes.Add("id", _i.ToString());
            e.Row.Attributes.Add("onKeyDown", "SelectRow();");
            e.Row.Attributes.Add("onClick", "MarkRow(" + _i.ToString() + ");");

            _i++;
        }
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        Response.Write(hdnEmailID.Value);
        //Do your action
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Response.Write(hdnEmailID.Value);
        //Do your action
        hdnEmailID.Value = "0";
    }

    protected void btnDown_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = GetDatatable();
        //int 
        //if (hdrowID.Value != null)
        //{
        //    hdrowID.Value = "1";
        //}
        //else
        //{
        //    Convert.ToInt32(hdrowID.Value)++;

        //}

        if (Session["rowID"] == null)
        {
            Session["rowID"] = 1;
        }
        else
        {

            Session["rowID"] = Convert.ToInt32(Session["rowID"]) + 1;
        }

        // Int32 rowID = 1;
        //Int32 rowID = (Int32)gvUsers.DataKeys[e.Item.ItemIndex];

        Int32 rowIndex = 0;
        DataRow rowToBeMoved = dt.NewRow();    //create a copy of the row to be moved
        for (Int16 i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["ID"].Equals(Convert.ToInt32(Session["rowID"])))
            {
                rowIndex = i;
                rowToBeMoved["ID"] = dt.Rows[i]["ID"];
                rowToBeMoved["Value"] = dt.Rows[i]["Value"];
                break;
            }
        }

        switch ("MoveDown")
        {
            case "MoveUp":
                if (rowIndex > 0)
                {
                    //delete the selected row
                    dt.Rows[rowIndex].Delete();
                    dt.AcceptChanges();
                    //add the rowToBeMoved
                    dt.Rows.InsertAt(rowToBeMoved, rowIndex - 1);
                    dt.AcceptChanges();
                    gvUsers.SelectedIndex = rowIndex - 1;

                }
                break;
            case "MoveDown":
                if (rowIndex < dt.Rows.Count - 1)
                {
                    dt.Rows[rowIndex].Delete();
                    dt.AcceptChanges();
                    dt.Rows.InsertAt(rowToBeMoved, rowIndex + 1);
                    dt.AcceptChanges();
                    gvUsers.SelectedIndex = rowIndex + 1;
                }
                break;
        }

        Session["FilesOrder"] = dt;
        dt.AcceptChanges();
        if (dt.Rows.Count > 0)
        {
            gvUsers.DataSource = dt;
            gvUsers.DataBind();

        }
        // rowID++;
    }


    protected void btn_dwn_Click(object sender, EventArgs e)
    {
        if ((Convert.ToInt32(hdcurrentRowId.Value) + 1) < Convert.ToInt16(hdTot.Value))
        {
            //Swap(Convert.ToInt32(ViewState["Icount"]), Convert.ToInt32(ViewState["Icount"]) + 1, "dwn");
            Swap(Convert.ToInt32(Convert.ToInt32(hdcurrentRowId.Value)), Convert.ToInt32(hdcurrentRowId.Value) + 1, "dwn");
            // ViewState["Icount"] = Convert.ToInt32(ViewState["Icount"]) + 1;
            hdcurrentRowId.Value = Convert.ToString(Convert.ToInt16(hdcurrentRowId.Value) + 1);

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script> document.getElementById('" + Convert.ToString(Convert.ToInt32(hdTot.Value) - 1) + "').style.backgroundColor = '#ff0000';;</script>");
            hdcurrentRowId.Value = Convert.ToString(Convert.ToInt32(hdTot.Value) - 1);
        }
    }

    protected void btn_up_Click(object sender, EventArgs e)
    {
        if ((Convert.ToInt32(hdcurrentRowId.Value) - 1) > 0)
        {

            //Swap(Convert.ToInt32(ViewState["Icount"]), Convert.ToInt32(ViewState["Icount"]) + 1, "dwn");
            Swap(Convert.ToInt32(Convert.ToInt32(hdcurrentRowId.Value)), Convert.ToInt32(hdcurrentRowId.Value) - 1, "up");
            // ViewState["Icount"] = Convert.ToInt32(ViewState["Icount"]) + 1;
            hdcurrentRowId.Value = Convert.ToString(Convert.ToInt16(hdcurrentRowId.Value) - 1);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script> document.getElementById('0').style.backgroundColor = '#ff0000';;</script>");
            hdcurrentRowId.Value = "0";
        }


        //Swap(Convert.ToInt32(ViewState["Icount"]), Convert.ToInt32(ViewState["Icount"]) - 1, "up");
        //ViewState["Icount"] = Convert.ToInt32(ViewState["Icount"]) + 1;
    }
    private void Swap(int index1, int index2, string opt)
    {
        //If the indexes are equal or one of them is illegal, return.
        //if (index1 == index2 || index1 < 0 || index2 < 0
        //    || index1 >= _bindSrc.Count || index2 >= _bindSrc.Count)
        //    return;

        DataTable dt = new DataTable();
        dt = (DataTable)ViewState["dtdata1"];
        if (opt == "dwn" && index2 != dt.Rows.Count)
        {


            //Make sure index1 <= index2
            if (index1 > index2)
            {
                int index = index1;
                index1 = index2;
                index2 = index;
            }

            //Create two rows with the same values.




            DataRow row1 = dt.NewRow();
            DataRow row2 = dt.NewRow();
            row1.ItemArray = dt.Rows[index1].ItemArray;
            row2.ItemArray = dt.Rows[index2].ItemArray;

            //Remove the old rows.
            dt.Rows.RemoveAt(index2);
            dt.Rows.RemoveAt(index1);

            //Add the new rows.
            dt.Rows.InsertAt(row2, index1);
            dt.Rows.InsertAt(row1, index2);

            //DataRow dr = dt.NewRow();
            // row2[0] = "1";
            //row1[0] = _intcounter++;

            //DataRow dr = dt.NewRow();
            //dr[0] = "1";
            //dr[1] = "Application 1";
            //dr[2] = "Server 1";
            //dt.Rows.Add(dr);

            //DataRow dr1 = dt.NewRow();
            //dr1[0] = "2";
            //dr1[1] = "Application 2";
            //dr1[2] = "Server 2";
            //dt.Rows.Add(dr1);



            //for (int i = 1; i <= index2; i++)
            //{
            //    foreach (DataRow dr in dt.Rows)
            //    {
            //        dr["ID"] = i;
            //    }
            //}

            for (int i = 1; i <= index2; i++)
            {
                //if (i == index2)
                //{
                dt.Rows[i]["id"] = i;
                //}
            }

            dt.AcceptChanges();
            Session["dt"] = dt;
            if (Session["dt"] == null)
            {
                dt = GetDatatable();
            }
            else
            {
                dt = (DataTable)Session["dt"];
            }

            gvUsers.DataSource = dt;
            gvUsers.DataBind();

            Session["dt"] = dt;

            if (opt == "dwn")
            {
                //gridTest.SelectedRow(index2);
                //gridTest.SelectedRow = index2;
                //gridTest.Selection.UnselectRow(index1);
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script> document.getElementById('" + (index2) + "').style.backgroundColor = '#ff0000';;</script>");

                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "MYScript", " alert(document.getElementById('" + (index2) + "'));", true);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "MYScript", " document.getElementById('" + (index2) + "').style.backgroundColor = '#ff0000';", true);
            }
            else
            {
                //gridTest.Selection.SelectRow(index1);
                //gridTest.Selection.UnselectRow(index2);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script> document.getElementById('" + (index1) + "').style.backgroundColor = '#ff0000';;</script>");
            }
        }
        else if (opt == "up" && index2 != -1)
        {
            if (index1 > index2)
            {
                int index = index1;
                index1 = index2;
                index2 = index;
            }

            //Create two rows with the same values.




            DataRow row1 = dt.NewRow();
            DataRow row2 = dt.NewRow();
            row1.ItemArray = dt.Rows[index1].ItemArray;
            row2.ItemArray = dt.Rows[index2].ItemArray;

            //Remove the old rows.
            dt.Rows.RemoveAt(index2);
            dt.Rows.RemoveAt(index1);

            //Add the new rows.
            dt.Rows.InsertAt(row2, index1);
            dt.Rows.InsertAt(row1, index2);
            gvUsers.DataSource = dt;
            gvUsers.DataBind();
            if (opt == "dwn")
            {
                //gridTest.SelectedRow(index2);
                //gridTest.SelectedRow = index2;
                //gridTest.Selection.UnselectRow(index1);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script> document.getElementById('" + (index2) + "').style.backgroundColor = '#ff0000';;</script>");

            }
            else
            {
                //gridTest.Selection.SelectRow(index1);
                //gridTest.Selection.UnselectRow(index2);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script> document.getElementById('" + (index1) + "').style.backgroundColor = '#ff0000';;</script>");
            }



        }



    }

    #region GenericListToDataTable
    /// <summary>
    /// Converts a generic List<> into a DataTable.
    /// </summary>
    /// <param name="list"></param>
    /// <returns>DataTable</returns>
    public static DataTable GenericListToDataTable(object list)
    {
        DataTable dt = null;
        Type listType = list.GetType();
        if (listType.IsGenericType)
        {
            //determine the underlying type the List<> contains
            Type elementType = listType.GetGenericArguments()[0];

            //create empty table -- give it a name in case
            //it needs to be serialized
            dt = new DataTable(elementType.Name + "List");

            //define the table -- add a column for each public
            //property or field
            MemberInfo[] miArray = elementType.GetMembers(
                BindingFlags.Public | BindingFlags.Instance);
            foreach (MemberInfo mi in miArray)
            {
                if (mi.MemberType == MemberTypes.Property)
                {
                    PropertyInfo pi = mi as PropertyInfo;
                    dt.Columns.Add(pi.Name, pi.PropertyType);
                }
                else if (mi.MemberType == MemberTypes.Field)
                {
                    FieldInfo fi = mi as FieldInfo;
                    dt.Columns.Add(fi.Name, fi.FieldType);
                }
            }

            //populate the table
            IList il = list as IList;
            foreach (object record in il)
            {
                int i = 0;
                object[] fieldValues = new object[dt.Columns.Count];
                foreach (DataColumn c in dt.Columns)
                {
                    MemberInfo mi = elementType.GetMember(c.ColumnName)[0];
                    if (mi.MemberType == MemberTypes.Property)
                    {
                        PropertyInfo pi = mi as PropertyInfo;
                        fieldValues[i] = pi.GetValue(record, null);
                    }
                    else if (mi.MemberType == MemberTypes.Field)
                    {
                        FieldInfo fi = mi as FieldInfo;
                        fieldValues[i] = fi.GetValue(record);
                    }
                    i++;
                }
                dt.Rows.Add(fieldValues);
            }
        }
        return dt;
    }
    #endregion



    //if (Session["selected"] == null)
    //{
    //    Session["selected"] = 0;

    //}
    //else
    //{
    //}
    //DataRow drTemp = new DataRow();
    // DataRow drTemp = dtitem.NewRow();
    //for (int i = 0; i < dtitem.Rows.Count; i++)
    //{
    //    if (i == Convert.ToInt32(Session["selected"]))
    //    {
    //        DataRow dr = dtitem.Rows[i];
    //        DataRow dr2 = dtitem.Rows[i + 1];
    //        //while (dr.GetChildRows())
    //        //{
    //        drTemp["id"] = dr2["id"];
    //        drTemp["Value"] = dr2["Value"];

    //        dr2["id"] = dr["id"];
    //        dr2["Value"] = dr["Value"];
    //        // dr2 = dr;

    //        dr["id"] = drTemp["id"];
    //        dr["Value"] = drTemp["Value"];
    //        //dr = drTemp;
    //        //}
    //        Session["selected"] = dr["id"];
    //        // Page.RegisterStartupScript("xx", "<script>alert('hi');</script>");
    //        // ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>alert(document.getElementId('"+i+"').css({ \"background-color\": \"White\", \"color\": \"Black\" }));</script>");
    //        //ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>alert(document.getElementId('"+i+"'));</script>");

    //       // ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>document.getElementById(1).bgColor = \"#800000\";</script>");



    //        // Page.ClientScript.RegisterStartupScript(GetType(Page), "PopupScript",  "<script>CallFunction();</script>")
    //        break;
    //    }


    //}

    //if (Session["selected"] == null)
    //{
    //    DataRow dr = dtitem.Rows[0];
    //    DataRow dr2 = dtitem.Rows[0 + 1];
    //    //while (dr.GetChildRows())
    //    //{
    //    drTemp["id"] = dr2["id"];
    //    drTemp["Value"] = dr2["Value"];

    //    dr2["id"] = dr["id"];
    //    dr2["Value"] = dr["Value"];
    //    // dr2 = dr;

    //    dr["id"] = drTemp["id"];
    //    dr["Value"] = drTemp["Value"];
    //    //dr = drTemp;
    //    //}
    //    Session["selected"] = Convert.ToInt32(dr["id"]) - 1;
    //    Session["start"] = Convert.ToInt32(dr2["id"]);
    //}
    //else
    //{

    //    DataRow dr = dtitem.Rows[Convert.ToInt32(Session["selected"])];
    //    DataRow dr2 = dtitem.Rows[Convert.ToInt32(Session["start"])];
    //    //while (dr.GetChildRows())
    //    //{
    //    drTemp["id"] = dr2["id"];
    //    drTemp["Value"] = dr2["Value"];

    //    dr2["id"] = dr["id"];
    //    dr2["Value"] = dr["Value"];
    //    // dr2 = dr;

    //    dr["id"] = drTemp["id"];
    //    dr["Value"] = drTemp["Value"];
    //    //dr = drTemp;
    //    //}
    //    Session["selected"] = Convert.ToInt32(dr["id"]) + 1;
    //    Session["selected"] = Convert.ToInt32(dr2["id"]);

    //}
    //  int idx = 0;

    //  DataRow selectedRow = dtitem.Rows[idx];
    //  DataRow newRow = dtitem.NewRow();
    //  newRow.ItemArray = selectedRow.ItemArray; // copy data
    //  dtitem.Rows.Remove(selectedRow);
    //  dtitem.Rows.InsertAt(newRow, idx + 1 / -1);

    ////  dtitem.AcceptChanges();
    //  if (dtitem.Rows.Count > 0)
    //  {
    //      gvUsers.DataSource = dtitem;
    //      gvUsers.DataBind();

    //  }


    //swapRows(mode.down);

}
//private void swapRows(mode range)
//{
//    int iSelectedRow = -1;
//    for (int iTmp = 0; iTmp <= gvUsers.Rows.Count - 1; iTmp++)
//    {
//        if (gvUsers.Rows[iTmp].Selected)
//        {
//            iSelectedRow = iTmp;
//            break; // TODO: might not be correct. Was : Exit For
//        }
//    }

//    if (iSelectedRow != -1)
//    {
//        string[] sTmp = new string[5];
//        for (int iTmp = 0; iTmp <= gvUsers.Columns.Count - 1; iTmp++)
//        {
//            sTmp[iTmp] = gvUsers.Rows[iSelectedRow].Cells[iTmp].Text.ToString();
//        }

//        int iNewRow = 0;
//        if (range == mode.down)
//        {
//            iNewRow = iSelectedRow + 1;
//        }
//        else if (range == mode.up)
//        {
//            iNewRow = iSelectedRow - 1;
//        }

//        if (range == mode.up | range == mode.down)
//        {
//            for (int iTmp = 0; iTmp <= gvUsers.Columns.Count - 1; iTmp++)
//            {
//                gvUsers.Rows[iSelectedRow].Cells[iTmp].Text = gvUsers.Rows[iNewRow].Cells[iTmp].Text;
//                gvUsers.Rows[iNewRow].Cells[iTmp].Text = sTmp[iTmp];
//            }
//            toSelect(iNewRow);
//        }
//        else if (range == mode.top | range == mode.bottom)
//        {
//            reshuffleRows(sTmp, iSelectedRow, range);
//        }
//    }
//}


//private void toSelect(int iNewRow)
//{
//    gvUsers.Rows[iNewRow].Selected = true;
//}



//private void reshuffleRows(string[] sTmp, int iSelectedRow, mode Range)
//{
//    if (Range == mode.top)
//    {
//        int iFirstRow = 0;
//        if (iSelectedRow > iFirstRow)
//        {
//            for (int iTmp = iSelectedRow; iTmp >= 1; iTmp += -1)
//            {
//                for (int iCol = 0; iCol <= gvUsers.Columns.Count - 1; iCol++)
//                {
//                    gvUsers.Rows[iTmp].Cells[iCol].Text = gvUsers.Rows[iTmp - 1].Cells[iCol].Text;
//                }
//            }
//            for (int iCol = 0; iCol <= gvUsers.Columns.Count - 1; iCol++)
//            {
//                gvUsers.Rows[iFirstRow].Cells[iCol].Text = sTmp[iCol].ToString();
//            }
//            toSelect(iFirstRow);
//        }
//    }
//    else
//    {
//        int iLastRow = gvUsers.Rows.Count - 1;
//        if (iSelectedRow < iLastRow)
//        {
//            for (int iTmp = iSelectedRow; iTmp <= iLastRow - 1; iTmp++)
//            {
//                for (int iCol = 0; iCol <= gvUsers.Columns.Count - 1; iCol++)
//                {
//                    gvUsers.Rows[iTmp].Cells[iCol].Text = gvUsers.Rows[iTmp + 1].Cells[iCol].Text;
//                }
//            }
//            for (int iCol = 0; iCol <= gvUsers.Columns.Count - 1; iCol++)
//            {
//                gvUsers.Rows[iLastRow].Cells[iCol].Text = sTmp[iCol].ToString();
//            }
//            toSelect(iLastRow);
//        }
//    }
//}


enum mode
{
    top = 0,
    up = 1,
    down = 2,
    bottom = 3
}


