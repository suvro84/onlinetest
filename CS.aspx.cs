using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPrimaryGrid();
            BindSecondaryGrid();
        }
    }

    private void BindPrimaryGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        string query = "select CustomerID, ContactName, City from customers";
        SqlConnection con = new SqlConnection(constr);
        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvAll.DataSource = dt;
        gvAll.DataBind();  
    }

protected void OnPaging(object sender, GridViewPageEventArgs e)
{
    GetData();
    gvAll.PageIndex = e.NewPageIndex;
    BindPrimaryGrid();
    SetData(); 
}

private void GetData()
{
    DataTable dt;
    if (ViewState["SelectedRecords"] != null)
        dt = (DataTable)ViewState["SelectedRecords"];
    else
        dt = CreateDataTable();
    CheckBox chkAll = (CheckBox)gvAll.HeaderRow
                        .Cells[0].FindControl("chkAll");
    for (int i = 0; i < gvAll.Rows.Count; i++)
    {
        if (chkAll.Checked)
        {
            dt = AddRow(gvAll.Rows[i], dt);
        }
        else
        {
            CheckBox chk = (CheckBox)gvAll.Rows[i]
                            .Cells[0].FindControl("chk");
            if (chk.Checked)
            {
                dt = AddRow(gvAll.Rows[i], dt);
            }
            else
            {
                dt = RemoveRow(gvAll.Rows[i], dt);
            }
        }
    }
    ViewState["SelectedRecords"] = dt;
}

    private void SetData()
    {
        CheckBox chkAll = (CheckBox)gvAll.HeaderRow.Cells[0].FindControl("chkAll");
        chkAll.Checked = true;
        if (ViewState["SelectedRecords"] != null)
        {
            DataTable dt = (DataTable)ViewState["SelectedRecords"];
            for (int i = 0; i < gvAll.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)gvAll.Rows[i].Cells[0].FindControl("chk");
                if (chk != null)
                {
                    DataRow[] dr = dt.Select("CustomerID = '" + gvAll.Rows[i].Cells[1].Text + "'");
                    chk.Checked = dr.Length > 0; 
                    if (!chk.Checked)
                    {
                        chkAll.Checked = false;
                    }
                }
            }
        }
    }

private DataTable CreateDataTable()
{
    DataTable dt = new DataTable();
    dt.Columns.Add("CustomerID");
    dt.Columns.Add("ContactName");
    dt.Columns.Add("City");
    dt.AcceptChanges();
    return dt;
}

private DataTable AddRow(GridViewRow gvRow, DataTable dt)
{
    DataRow[] dr = dt.Select("CustomerID = '" + gvRow.Cells[1].Text + "'");
    if (dr.Length <= 0)
    {
        dt.Rows.Add();
        dt.Rows[dt.Rows.Count - 1]["CustomerID"] = gvRow.Cells[1].Text;
        dt.Rows[dt.Rows.Count - 1]["ContactName"] = gvRow.Cells[2].Text;
        dt.Rows[dt.Rows.Count - 1]["City"] = gvRow.Cells[3].Text;
        dt.AcceptChanges();
    }
    return dt;
}

private DataTable RemoveRow(GridViewRow gvRow, DataTable dt)
{
    DataRow[] dr = dt.Select("CustomerID = '" + gvRow.Cells[1].Text + "'");
    if (dr.Length > 0)
    {
        dt.Rows.Remove(dr[0]);
        dt.AcceptChanges();
    }
    return dt;
}

protected void CheckBox_CheckChanged(object sender, EventArgs e)
{
    GetData();
    SetData();
    BindSecondaryGrid();
}

private void BindSecondaryGrid()
{
    DataTable dt = (DataTable)ViewState["SelectedRecords"];
    gvSelected.DataSource = dt;
    gvSelected.DataBind(); 
}
}