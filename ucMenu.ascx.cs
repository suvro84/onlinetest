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
using System.Text;

public partial class ucMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //dvMenu.InnerHtml = generatemenu();
            //dvMenu.InnerHtml = generaRootLevel();
            //generatemenu();
            commonclass objmenu = new commonclass();
            DataTable dtmenu = new DataTable();
            string strSql = "select  * from tblMenuMaster";
            dtmenu = objmenu.Fetchrecords(strSql);

            dvMenu.InnerHtml = generateRootMenu(dtmenu);

        }
    }


    //public string generaRootLevel(DataTable dtmenu)
    //{



    //    StringBuilder sbMenu = new StringBuilder();


    //    if (dtmenu.Rows.Count > 0)
    //    {

    //        sbMenu.Append("<ul class=\"MM\" id=\"Menu1\">");

    //        foreach (DataRow drmenu in dtmenu.Rows)
    //        {


    //            if (Convert.ToInt32(drmenu["pid"]) == 0)
    //            {
    //                sbMenu.Append("<li>");
    //                sbMenu.Append("<a href=\"" + drmenu["url"] + "\">" + drmenu["title"] + "</a>");
    //                //sbMenu.Append("<a href=\"" + dtmenu.Rows[i]["url"] + "\">" + dtmenu.Rows[i]["title"] + "</a>");


    //                sbMenu.Append("<ul>");
    //                sbMenu.Append(generatechild(Convert.ToString(drmenu["menuid"]), dtmenu));
    //                // generatechild(Convert.ToString(dtmenu.Rows[i]["menuid"]), dtmenu);
    //                sbMenu.Append("</ul>");
    //                sbMenu.Append("</li>");


    //            }



    //        }
    //        sbMenu.Append("</ul>");

    //    }
    //    return sbMenu.ToString();
    //    //dvMenu.InnerHtml = sbMenu.ToString();

    //}

    //public string generatechild(string pid, DataTable dtmenu)
    //{

    //    StringBuilder sbMenu = new StringBuilder();
    //    DataRow[] drmenu = dtmenu.Select("pid='" + pid + "'");
    //    if (drmenu.Length > 0)
    //    {

    //        for (int i = 0; i < drmenu.Length; i++)
    //        {
    //            sbMenu.Append("<li>");
    //            sbMenu.Append("<a href=\"" + drmenu[i]["url"].ToString() + "\">" + drmenu[i]["title"].ToString() + "</a>");


    //            DataRow[] drmenu1 = dtmenu.Select("pid='" + drmenu[i]["menuid"].ToString() + "'");
    //            if (drmenu1.Length > 0)
    //            {
    //                sbMenu.Append("<ul>");
    //                sbMenu.Append(generatechild(Convert.ToString(drmenu[i]["menuid"]), dtmenu));
    //                sbMenu.Append("</ul>");
    //            }
    //            sbMenu.Append("</li>");


    //        }


    //    }
    //    return sbMenu.ToString();
    //}






    // private void generateMenu(string id)
    //{
    //    string strSql = "SELECT " +
    //                    "dbo.Menu_Master.Id AS [ID],  " +
    //                    "dbo.Menu_Master.Title AS [Title], " +
    //                    "dbo.Menu_Master.ParentId AS [pid],  " +
    //                    "dbo.Menu_Master.Level AS [lvl],  " +
    //        //"dbo.Menu_Master.SQL AS [SQL], " +
    //                    "CASE WHEN dbo.Menu_Master.PageLink IS NULL THEN '#' ELSE dbo.Menu_Master.PageLink END AS [URL]  " +
    //                    "FROM  " +
    //                    "dbo.Menu_Login_Relation  " +
    //                    "INNER JOIN dbo.Menu_Master ON (dbo.Menu_Login_Relation.MenuId = dbo.Menu_Master.Id)  " +
    //                    "WHERE  " +
    //                    "(dbo.Menu_Master.RecordStatus = '1')   " +
    //                    "AND  " +
    //                    "(dbo.Menu_Login_Relation.LoginId='" + id + "') ORDER BY dbo.Menu_Master.Title";

    //    DataTable dt = new DataManipulationClass().FillDataTable(strSql);  
    //    dvMenu.InnerHtml = generateRootMenu(dt);
    //}
    private string generateRootMenu(DataTable dtt)
    {
        System.Text.StringBuilder str = new System.Text.StringBuilder();
        str.Append("<ul id=\"Menu1\" class=\"MM\">");
        for (int i = 0; i < dtt.Rows.Count; i++)
        {
            if (Convert.ToString(dtt.Rows[i]["pid"]) == "0")
            {
                str.Append("<li><a href=\"" + Convert.ToString(dtt.Rows[i]["URL"]) + "\">" + Convert.ToString(dtt.Rows[i]["Title"]) + "</a>");
                str.Append("<ul>");
                str.Append(generateChild(dtt, Convert.ToString(dtt.Rows[i]["ID"])));
                str.Append("</ul>");
                str.Append("</li>");
            }
        }
        str.Append("</ul>");
        return str.ToString();
    }
    private string generateChild(DataTable dtt, string menuId)
    {
        System.Text.StringBuilder menuChild = new System.Text.StringBuilder();
        DataRow[] dRow = dtt.Select("pid='" + menuId + "'");
        for (int i = 0; i < dRow.Length; i++)
        {
            menuChild.Append("<li>");
            //menuChild.Append("<a href=\"" + Convert.ToString(dRow[i].ItemArray[4]) + "\">" + Convert.ToString(dRow[i].ItemArray[1]) + "</a>");
            menuChild.Append("<a href=\"" + Convert.ToString(dRow[i]["URL"]) + "\">" + Convert.ToString(dRow[i]["Title"]) + "</a>");
            DataRow[] dRow1 = dtt.Select("pid='" + Convert.ToString(dRow[i]["ID"]) + "'");
            if (dRow1.Length != 0)
            {
                menuChild.Append("<ul>");
                menuChild.Append(generateChild(dtt, Convert.ToString(dRow[i]["ID"])));
                menuChild.Append("</ul>");
            }

            menuChild.Append("</li>");
        }
        return menuChild.ToString();
    }

}
