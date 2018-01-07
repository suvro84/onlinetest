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

public partial class EditRepeater : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            commonclass objdt = new commonclass();
            DataTable dtrep = new DataTable();
            dtrep = objdt.Fetchrecords("select * from products");
            //rep1.DataSource = Microsoft.ApplicationBlocks.Data.SqlHelper.ExecuteDataset(
            //    sConn, CommandType.Text, "select * from products").Tables[0].Rows;
            rep1.DataSource = dtrep;
            rep1.DataBind();

        }
    }
    //protected void rep1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        DataRow row = e.Item.DataItem as DataRow;
    //        Literal litname = e.Item.FindControl("litname") as Literal;
    //        litname.Text = row["productname"].ToString();
    //        TextBox txtUnitsInStock = e.Item.FindControl("txtUnitsInStock") as TextBox;
    //        txtUnitsInStock.Text = row["unitsinstock"].ToString();

    //    }
    //}
    protected void rep1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRow row = e.Item.DataItem as DataRow;
            Literal litname = e.Item.FindControl("litname") as Literal;
            litname.Text = row["productname"].ToString();
            TextBox txtUnitsInStock = e.Item.FindControl("txtUnitsInStock") as TextBox;
            txtUnitsInStock.Text = row["unitsinstock"].ToString();

            Button btnChangeUnitsInStock = e.Item.FindControl("btnChangeUnitsInStock") as Button;
            btnChangeUnitsInStock.CommandName = "ChangeUnits";
            btnChangeUnitsInStock.CommandArgument = row["productid"].ToString();

            Button btnDiscontinued = e.Item.FindControl("btnDiscontinued") as Button;
            btnDiscontinued.CommandName = "Discontinued";
            btnDiscontinued.CommandArgument = row["productid"].ToString();


        }
    }
    protected void rep1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ChangeUnits")
        {
            long lProductId = Convert.ToInt32(e.CommandArgument);
            TextBox txtUnitsInStock = e.Item.FindControl("txtUnitsInStock") as TextBox;
            long lNewCount = Convert.ToInt32(txtUnitsInStock.Text);
            //Call sp or whatever to set unitsinstock to lNewCount for product id lProductId 
        }
        if (e.CommandName == "Discontinued")
        {
            long lProductId = Convert.ToInt32(e.CommandArgument);
            //Call sp or whatever to set discontinued for productid lProductId 
        }
    } 
}
