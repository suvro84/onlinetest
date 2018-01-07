using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class NestedColapsableGvList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gvParent.DataSource = GetParentTableData();
        gvParent.DataBind();
    }

    public class Employee
    {

        public string EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public string Designation { get; set; }

        public string Location { get; set; }

    }

    public class Skills
    {

        public string SkillID { get; set; }
        public string EmployeeId { get; set; }
        public string SkillSet { get; set; }
        public string Remarks { get; set; }


    }
    private DataTable GetParentTableData()
    {
        DataTable table = new DataTable();
        table.Columns.Add("EmployeeId", typeof(string));
        table.Columns.Add("EmployeeName", typeof(string));
        table.Columns.Add("Designation", typeof(string));
        table.Columns.Add("Location", typeof(string));

        table.Rows.Add(100, "Andy", "S/W Engg", "NY");
        table.Rows.Add(200, "James", "S/W Engg", "NJ");
        table.Rows.Add(300, "Ramesh", "Sr. S/W Engg", "Bangalore");
        table.Rows.Add(400, "George", "Architect", "London");
        table.Rows.Add(500, "Lisa", "Manager", "Washington");
        return table;

    }

    private List<Employee> GetParentTableDataList()
    {
        List<Employee> emp = new List<Employee>()
{
  new Employee {EmployeeId="100", EmployeeName="Andy", Designation="S/W Engg", Location="NY"},
  new Employee {EmployeeId="200", EmployeeName="James", Designation="S/W Engg", Location="SNJ"},
  new Employee {EmployeeId="300", EmployeeName="Ramesh", Designation="S/W Engg", Location="Bangalore"},
  new Employee {EmployeeId="400", EmployeeName="George", Designation="S/W Engg", Location="London"}
};
        return emp;


    }

    private DataTable GetChildTableData()
    {
        DataTable table = new DataTable();
        table.Columns.Add("SkillID", typeof(string));
        table.Columns.Add("EmployeeId", typeof(string));
        table.Columns.Add("SkillSet", typeof(string));
        table.Columns.Add("Remarks", typeof(string));


        table.Rows.Add("1", "100", "ASP.NET", "Remarks1");
        table.Rows.Add("2", "100", "SQL", "Remarks2");

        table.Rows.Add("1", "200", "ASP.NET", "Remarks1");
        table.Rows.Add("2", "200", "SQL", "Remarks2");
        table.Rows.Add("3", "200", "WCF", "Remarks3");



        table.Rows.Add("4", "300", "PHP", "Remarks1");
        table.Rows.Add("5", "300", "Oracle", "Remarks2");
        table.Rows.Add("6", "300", "Javascipt", "Remarks3");

        table.Rows.Add("7", "400", "J2EE", "Remarks1");
        table.Rows.Add("5", "400", "Oracle", "Remarks2");
        table.Rows.Add("8", "400", "Struts", "Remarks3");


        table.Rows.Add("9", "500", "Estimation", "Remarks1");
        table.Rows.Add("10", "500", "Project Plan", "Remarks2");
        table.Rows.Add("11", "500", "Resource Loading", "Remarks3");
        table.Rows.Add("12", "500", "Resource allocation", "Remarks4");

        return table;

    }

    private List<Skills> GetChildTableDataList()
    {
      
        List<Skills> objskills = new List<Skills>()
{
  new Skills {SkillID="1",EmployeeId="100", SkillSet="ASP.NET",  Remarks="NY"},

  new Skills {SkillID="2",EmployeeId="200", SkillSet="SQL",  Remarks="SNJ"},

  new Skills {SkillID="3",EmployeeId="200", SkillSet="Ramesh", Remarks="Bangalore"},
   new Skills {SkillID="4",EmployeeId="200", SkillSet="Ramesh", Remarks="Bangalore"},


    new Skills {SkillID="5",EmployeeId="300", SkillSet="Ramesh", Remarks="Bangalore"},
    new Skills {SkillID="6",EmployeeId="300", SkillSet="tt", Remarks="mum"},

  new Skills {SkillID="7",EmployeeId="400", SkillSet="jj",  Remarks="kol"},
   new Skills {SkillID="8",EmployeeId="400", SkillSet="oo",  Remarks="pune"}

};
        return objskills;
    }

    protected void gvParent_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            DataTable dtChildTable = GetChildTableData();
           // List<Skills> objChildTable = GetChildTableData();
            DataTable dtCloneChildTable = dtChildTable.Clone();
            Image img = (Image)e.Row.Cells[0].FindControl("img1");

            Literal ltrl = (Literal)e.Row.FindControl("lit1");
            ltrl.Text = ltrl.Text.Replace("trCollapseGrid", "trCollapseGrid" + e.Row.RowIndex.ToString());
            string str = "trCollapseGrid" + e.Row.RowIndex.ToString();
            e.Row.Cells[0].Attributes.Add("OnClick", "OpenTable('" + str + "','" + img.ClientID + "')");
            e.Row.Cells[0].RowSpan = 1;
            System.Web.UI.WebControls.GridView gvChild = (System.Web.UI.WebControls.GridView)e.Row.FindControl("gvChild");

            DataRow[] gvChildRows = dtChildTable.Select("EmployeeId = " + e.Row.Cells[1].Text);
            foreach (DataRow gvChildRow in gvChildRows)
            {
                dtCloneChildTable.ImportRow(gvChildRow);
            }
            gvChild.DataSource = dtCloneChildTable;
            gvChild.DataBind();
        }
    }

    //protected void gvParent_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {

    //        //DataTable dtChildTable = GetChildTableData();
    //        List<Skills> objChildTable = GetChildTableData();
    //        DataTable dtCloneChildTable = dtChildTable.Clone();
    //        Image img = (Image)e.Row.Cells[0].FindControl("img1");

    //        Literal ltrl = (Literal)e.Row.FindControl("lit1");
    //        ltrl.Text = ltrl.Text.Replace("trCollapseGrid", "trCollapseGrid" + e.Row.RowIndex.ToString());
    //        string str = "trCollapseGrid" + e.Row.RowIndex.ToString();
    //        e.Row.Cells[0].Attributes.Add("OnClick", "OpenTable('" + str + "','" + img.ClientID + "')");
    //        e.Row.Cells[0].RowSpan = 1;
    //        System.Web.UI.WebControls.GridView gvChild = (System.Web.UI.WebControls.GridView)e.Row.FindControl("gvChild");

    //        DataRow[] gvChildRows = dtChildTable.Select("EmployeeId = " + e.Row.Cells[1].Text);
    //        foreach (DataRow gvChildRow in gvChildRows)
    //        {
    //            dtCloneChildTable.ImportRow(gvChildRow);
    //        }
    //        gvChild.DataSource = dtCloneChildTable;
    //        gvChild.DataBind();
    //    }
    //}
}
