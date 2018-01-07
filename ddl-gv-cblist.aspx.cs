using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ddl_gv_cblist : System.Web.UI.Page
{
    protected void btn_Click(object sender, EventArgs e)
    {
        string strSelectedItem = string.Empty;
        CheckBoxList chk = (CheckBoxList)phDDLCHK.FindControl("chkLstItem");
        DropDownList ddl = (DropDownList)Page.FindControl("idTesting");

        for (int i = 0; i < chk.Items.Count; i++)
        {
            if (chk.Items[i].Selected)
            {
                if (strSelectedItem.Length == 0)
                {
                    strSelectedItem = chk.Items[i].Selected.ToString();
                }
                else
                {
                    strSelectedItem = strSelectedItem + "," + chk.Items[i].Selected.ToString();
                }
            }
        }
        ddl.Items.Clear();
        ddl.Items.Add(new ListItem(hidList.Value));
        lblSelectedItem.Text = strSelectedItem;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList ddl = new DropDownList();
        ddl.ID = "idTesting";
        ListItem lstItem = new ListItem();
        ddl.Items.Insert(0, lstItem);
        ddl.Width = new Unit(155);
        ddl.Attributes.Add("onmousedown", "showdivonClick()");


        CheckBoxList chkBxLst = new CheckBoxList();
        chkBxLst.ID = "chkLstItem";

        chkBxLst.Attributes.Add("onmouseover", "showdiv()");
        DataTable dtListItem = GetListItem();

        int rowNo = dtListItem.Rows.Count;
        string lstValue = string.Empty;
        string lstID = string.Empty;
        for (int i = 0; i < rowNo - 1; i++)
        {
            lstValue = dtListItem.Rows[i]["Value"].ToString();
            lstID = dtListItem.Rows[i]["ID"].ToString();
            lstItem = new ListItem("<a href=\"javascript:void(0)\" id=\"alst\" style=\"text-decoration:none;color:Black; \" onclick=\"getSelectedItem(' " + lstValue + "','" + i + "','" + lstID + "','anchor');\">" + lstValue + "</a>", dtListItem.Rows[i]["ID"].ToString());            //lstItem.Attributes.Add("onclick", "getSelectedItemList('" + lstValue + "','" + i + "','" + lstID + "','listItem');");
            chkBxLst.Items.Add(lstItem);
        }


        System.Web.UI.HtmlControls.HtmlGenericControl div = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
        div.ID = "divChkList";
        div.Controls.Add(chkBxLst);
        div.Style.Add("BORDER", "black 1px solid");
        div.Style.Add("WIDTH", "160px");
        div.Style.Add("HEIGHT", "180px");
        div.Style.Add("OVERFLOW", "AUTO");
        div.Style.Add("display", "none");
        phDDLCHK.Controls.Add(ddl);
        phDDLCHK.Controls.Add(div);
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
