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
using System.ComponentModel;

public partial class DataTableMerge : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindRep();
            
            
            //Binding GridView with the datasource

            //DataTable dt1 = FillDataTable1();
            DataTable dt2 = FillDataTable2();
            DataTable dt3 = FillDataTable3();


            //DataSet dataSet = new DataSet("dataSet");
            //dataSet.Tables.Add(dt1);
            //dataSet.Merge(dt2);
            DataTable dtfinal = new DataTable();
            dtfinal.Columns.Add("ApplicationID");
            dtfinal.Columns.Add("ApplicationName");
            dtfinal.Columns.Add("ApplicationName2");
            dtfinal.Columns.Add("ApplicationName3");

            //dt1.Merge(dt2);
            //dt1.Merge(dt3);
            //this.GridView1.DataSource = dt1;
            //this.GridView1.DataBind();
            //AssignFreequency();



            DataTable dt = new DataTable("Test");
            dt.Columns.Add("col1");
            dt.Columns.Add("col2");
            dt.Columns.Add("col3");
            dt.Columns.Add("col4");

            DataRow dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "Application 1";
            dr[2] = "10";
            dt.Rows.Add(dr);

            DataRow dr1 = dt.NewRow();
            dr1[0] = "1";
            dr1[1] = "Application 1";
            dr1[2] = "10";
            dt.Rows.Add(dr1);
            DataRow dr2 = dt.NewRow();
            dr2[0] = "1";
            dr2[1] = "Application 1";
            dr2[2] = "10";
            dt.Rows.Add(dr2);

            DataRow dr3 = dt.NewRow();
            dr3[0] = "2";
            dr3[1] = "Application 1";
            dr3[2] = "20";
            dt.Rows.Add(dr3);
            DataRow dr4 = dt.NewRow();
            dr4[0] = "2";
            dr4[1] = "Application 1";
            dr4[2] = "30";
            dt.Rows.Add(dr4);

            DataRow dr5 = dt.NewRow();
            dr5[0] = "3";
            dr5[1] = "Application 1";
            dr5[2] = "60";
            dt.Rows.Add(dr5);

          //  dt = RemoveDuplicateRows(dt, "col1");
            dt = RemoveDuplicateRows1(dt, "col1");
            GridView1.DataSource = dt;
            GridView1.DataBind();







            //foreach( DataRow dr in dt1.Rows)
            //{
            //    DataRow drfinal = dtfinal.NewRow();
            //    drfinal[0] = dr["ApplicationID"].ToString();
            //    drfinal[1] = dr["ApplicationName"].ToString();

            //    dtfinal.Rows.Add(drfinal);
            //}
            ////foreach (DataRow dr in dt2.Rows)
            //    for(int i=0;i<dt2.Rows.Count-1;i++)

            //{
            //    DataRow drfinal = dtfinal.NewRow();
            //    drfinal[0] = dt2.Rows[i]["ApplicationID"].ToString();
            //    drfinal[1] = dt2.Rows[i]["ApplicationName2"].ToString();

            //    dtfinal.Rows.Add(drfinal);
            //}

        }


    }

    //protected DataTable FillDataTable1()
    //{
    //    DataTable dt = new DataTable();
    //    dt.Columns.Add("ApplicationID");
    //    dt.Columns.Add("ApplicationName");

    //    //  dt.Columns.Add("counter", typeof(int));
    //    DataRow dr = dt.NewRow();
    //    dr[0] = "1";
    //    dr[1] = "Application 1";

    //    dt.Rows.Add(dr);

    //    DataRow dr1 = dt.NewRow();
    //    dr1[0] = "1";
    //    dr1[1] = "Application 1";

    //    dt.Rows.Add(dr1);

    //    DataRow dr2 = dt.NewRow();
    //    dr2[0] = "1";
    //    dr2[1] = "Application 1";

    //    dt.Rows.Add(dr2);

    //    DataRow dr3 = dt.NewRow();
    //    dr3[0] = "1";
    //    dr3[1] = "Application 1";

    //    dt.Rows.Add(dr3);

    //    DataRow dr4 = dt.NewRow();
    //    dr4[0] = "1";
    //    dr4[1] = "Application 1";

    //    dt.Rows.Add(dr4);

    //    DataRow dr5 = dt.NewRow();
    //    dr5[0] = "2";
    //    dr5[1] = "Application 2";

    //    dt.Rows.Add(dr5);
    //    int counter = 0;
    //    dt = RemoveDuplicateRows(dt, "ApplicationName");


    //    GridView1.DataSource = dt;

    //    dt.PrimaryKey = new System.Data.DataColumn[] { dt.Columns["ApplicationID"] };

    //    return dt;

    //}

    protected DataTable FillDataTable2()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ApplicationID");
        dt.Columns.Add("ApplicationName2");
        dt.PrimaryKey = new System.Data.DataColumn[] { dt.Columns["ApplicationID"] };




        DataRow dr1 = dt.NewRow();
        dr1[0] = "1";
        dr1[1] = "Application 7";

        dt.Rows.Add(dr1);

        DataRow dr2 = dt.NewRow();
        dr2[0] = "2";
        dr2[1] = "Application 8";

        dt.Rows.Add(dr2);

        DataRow dr3 = dt.NewRow();
        dr3[0] = "3";
        dr3[1] = "Application 9";

        dt.Rows.Add(dr3);

        DataRow dr4 = dt.NewRow();
        dr4[0] = "4";
        dr4[1] = "Application 10";

        dt.Rows.Add(dr4);

        DataRow dr5 = dt.NewRow();
        dr5[0] = "5";
        dr5[1] = "Application 11";

        dt.Rows.Add(dr5);

        return dt;

    }

    protected DataTable FillDataTable3()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ApplicationID");
        dt.Columns.Add("ApplicationName3");
        dt.PrimaryKey = new System.Data.DataColumn[] { dt.Columns["ApplicationID"] };

        DataRow dr = dt.NewRow();
        dr[0] = "1";
        dr[1] = "Application 12";

        dt.Rows.Add(dr);

        DataRow dr1 = dt.NewRow();
        dr1[0] = "2";
        dr1[1] = "Application 13";

        dt.Rows.Add(dr1);

        DataRow dr2 = dt.NewRow();
        dr2[0] = "3";
        dr2[1] = "Application 14";

        dt.Rows.Add(dr2);

        DataRow dr3 = dt.NewRow();
        dr3[0] = "4";
        dr3[1] = "Application 15";

        dt.Rows.Add(dr3);

        DataRow dr4 = dt.NewRow();
        dr4[0] = "5";
        dr4[1] = "Application 16";

        dt.Rows.Add(dr4);

        DataRow dr5 = dt.NewRow();
        dr5[0] = "6";
        dr5[1] = "Application 17";

        dt.Rows.Add(dr5);

        return dt;

    }

    //public DataTable RemoveDuplicateRows(DataTable dTable, string colName)
    //{

    //    DataTable dtDuplicate = dTable.Copy();

    //    Hashtable hTable = new Hashtable();
    //    ArrayList duplicateList = new ArrayList();

    //   // Add list of all the unique item value to hashtable, which stores combination of key, value pair.
    // //   And add duplicate item value in arraylist.
    //    foreach (DataRow drow in dTable.Rows)
    //    {
    //        if (hTable.Contains(drow[colName]))
    //        {

    //            duplicateList.Add(drow);

    //        }
    //        else
    //        {
    //            hTable.Add(drow[colName], string.Empty);
    //        }
    //    }


    // //   Removing a list of duplicate items from datatable.
    //    foreach (DataRow dRow in duplicateList)
    //    {
    //        dTable.Rows.Remove(dRow);

    //        counter++;

    //    }
    //    dTable.Columns.Add("count");
    //    int count = 0;
    //    for (int i = 0; i < dtDuplicate.Rows.Count; i++)
    //    {
    //        count = 0;
    //        string num = dtDuplicate.Rows[i][1].ToString();

    //        for (int j = 0; j < i; j++)
    //        {
    //            if (dtDuplicate.Rows[j][0].ToString() == num)
    //            {
    //                count++;
    //            }
    //        }
    //        dTable.Rows[i][2] = count.ToString();
    //    }


    //    foreach (DataRow dr in dTable.Rows)
    //    {
    //        dr["counter"] = counter;
    //        dTable.AcceptChanges();
    //    }



    //   // Datatable which contains unique records will be return as output.
    //    return dTable;
    //}

    public void AssignFreequency()
    {
        // Crete a DataTable with 2 columns
        DataTable dt = new DataTable();
        dt.Columns.Add("Number");  // Numbers
        dt.Columns.Add("Frequency"); // Frequency of occurences

        dt.Rows.Add("0");
        dt.Rows.Add("0.1");
        dt.Rows.Add("0.1");
        dt.Rows.Add("0.1");
        dt.Rows.Add("0.1.1");
        dt.Rows.Add("0.1.1");
        dt.Rows.Add("0.1.1");
        dt.Rows.Add("0.1.1");
        dt.Rows.Add("0.1.2");
        dt.Rows.Add("0.1.2");
        dt.Rows.Add("0.1.3");

        int count = 0;

        // Loopthrough each row and check whether each number is repeated or not

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            count = 0;
            string num = dt.Rows[i][0].ToString();

            for (int j = 0; j < i; j++)
            {
                if (dt.Rows[j][0].ToString() == num)
                {
                    count++;
                }
            }
            dt.Rows[i][1] = count.ToString();
        }

        // Display the DataTable in a DataGridView
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    //public DataTable RemoveDuplicateRows(DataTable dTable, string colName)
    //{
    //    DataTable dTable2 = dTable.Copy();
    //    dTable2.Columns.Add("count");

    //    for (int i = 0; i < dTable2.Rows.Count; i++)
    //    {
    //        int count = 1;
    //        int price = 0;
    //        for (int j = i + 1; j < dTable2.Rows.Count ; j++)
    //        {

    //            if (dTable2.Rows[i][colName] == dTable2.Rows[j][colName])
    //            {
    //                count++;
    //                price += Convert.ToInt32(dTable2.Rows[j]["col3"]);
    //                //DataRow dr;
    //                // dTable2.Rows[j].BeginEdit();
    //                //dr["col3"] += dTable2.Rows[i];
    //                //dTable2.Rows[j].EndEdit();

    //                dTable2.Rows.RemoveAt(j);
    //                j--;
    //            }
    //        }
    //        dTable2.Rows[i]["col4"] = price;
    //        dTable2.Rows[i]["count"] = count;
    //    }

    //    dTable2.DefaultView.Sort = colName + " asc";
    //    return dTable2;
    //}

    public DataTable RemoveDuplicateRows1(DataTable dTable, string colName)
    {
        Hashtable hTable = new Hashtable();
        ArrayList duplicateList = new ArrayList();
        dTable.Columns.Add("tot");  // Numbers
        //Add list of all the unique item value to hashtable, which stores combination of key, value pair.
        //And add duplicate item value in arraylist.
        int price = 0;
        int i=0;
        foreach (DataRow drow in dTable.Rows)
        {
          
            if (hTable.Contains(drow[colName]))
            {
                duplicateList.Add(drow);
                price += Convert.ToInt32(drow["col3"]);
                //drow["col3"] = price;
               
            }
            else
            {
                hTable.Add(drow[colName], string.Empty);
                price += Convert.ToInt32(drow["col3"]);
              
            }
            //drow["tot"] = price;
            for (int j = 0; j < duplicateList.Count; j++)
            {
                dTable.Rows[i]["tot"] = price;
            }
            price = 0;
            
        }
        dTable.AcceptChanges();
        //Removing a list of duplicate items from datatable.
        foreach (DataRow dRow in duplicateList)
            dTable.Rows.Remove(dRow);

        //Datatable which contains unique records will be return as output.
        return dTable;
    }
    public void bindRep()
    {
        commonclass objcommon = new commonclass();

        //string strSql = " select ROW_NUMBER() OVER(ORDER BY COL ASC) AS SlNo,COL  from Duplicate ";
        string strSql = " select ROW_NUMBER() OVER(ORDER BY COL ASC) AS SlNo,col, row_number() over (partition by ID,col Order by ID) as Sl from DUPLICATE";
        
        //DataTable dtApproved = new DataTable();
       // DataTable dtDuplicate = objcommon.Fetchrecords(strSql);
        DataTable dtDuplicate = objcommon.getDataTable(strSql);
        rptDuplicate.DataSource = dtDuplicate;
        rptDuplicate.DataBind();
    }
  
   
}
