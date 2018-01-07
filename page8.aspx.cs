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

public partial class page8 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strSql = "";
             strSql = " select id,count(COL) as wait, COL  from Duplicate  group by id,COL,status having status =1";
            commonclass objcommon = new commonclass();
            DataTable dtWait = new DataTable();
            //dtWait.Columns.Add("sid", typeof(int));
            //dtWait.Columns["sid"].AutoIncrement = true;
            //dtWait.Columns["sid"].AutoIncrementSeed = 1;
            dtWait = objcommon.Fetchrecords(strSql);
            dtWait.PrimaryKey = new System.Data.DataColumn[] { dtWait.Columns["id"] };






            strSql = " select id,count(COL) as approved, COL as siteapproved from Duplicate  group by id,COL,status having status =2";
            DataTable dtApproved = new DataTable();
            //dtApproved.Columns.Add("sid", typeof(int));
            //dtApproved.Columns["sid"].AutoIncrement = true;
            //dtApproved.Columns["sid"].AutoIncrementSeed = 1;
           // dtApproved.PrimaryKey = new System.Data.DataColumn[] { dtApproved.Columns["id"] };

            dtApproved = objcommon.Fetchrecords(strSql);

           // strSql = " select id,count(COL)as cancel , COL  from Duplicate  group by id,COL having status =3";
            strSql = " select id,count(COL) as cancel, COL as sitecancel from Duplicate  group by id,COL,status having status =3";

            DataTable dtCancel = new DataTable();
            //dtCancel.Columns.Add("sid", typeof(int));
            //dtCancel.Columns["sid"].AutoIncrement = true;
            //dtCancel.Columns["sid"].AutoIncrementSeed = 1;
           // dtCancel.PrimaryKey = new System.Data.DataColumn[] { dtCancel.Columns["id"] };
            dtCancel = objcommon.Fetchrecords(strSql);


            //DataTable dtfinal = new DataTable();
            //dtfinal.Columns.Add("COL");
            //dtfinal.Columns.Add("ApplicationName");



            dtWait.Merge(dtApproved);
            dtWait.Merge(dtCancel);
            dlLink.DataSource = dtWait;
            dlLink.DataBind();
        }
    }
}
