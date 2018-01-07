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
using System.Collections.Generic;

public partial class AssignService_SubService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populateServiceddl();
        }
    }

    public void populateServiceddl()
    {

        GCommon<Service> obj = new DataManipulationClass().populateService();
        if (obj.Count > 0)
        {
            IEnumerator<Service> ie = obj.GetEnumerator();
            ListItem li = new ListItem();
            li.Value = "0";
            li.Text = "Please Select";
            ddlService.Items.Insert(0, li);
            
            while (ie.MoveNext())
            {
                 li = new ListItem();
                li.Text = ie.Current.service_name.ToString();
                li.Value = ie.Current.service_id.ToString();
                ddlService.Items.Add(li);

            }
        }


    }
    protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
    {
        commonclass objCommon = new commonclass();
        DataSet dsSubService = new DataSet();
        string strError="";
        string strSql = "select subservice_id,subservice_name from tblSubServiceMaster where subservice_status=1;select sub.subservice_name,r.subservice_id from tblService_SubService_Relation r inner join tblSubServiceMaster sub on r.subservice_id=sub.subservice_id where r.service_id=" + Convert.ToInt32(ddlService.SelectedValue) + " ;";
        //string strSql = "select subservice_id,subservice_name from tblSubServiceMaster where subservice_status=1;select subservice_id from tblService_SubService_Relation ";

        dsSubService = objCommon.ExecuteDS(strSql, ref strError);
        if(dsSubService.Tables[0].Rows.Count>0)
        {
            
            
            
            cbSubService.DataSource = dsSubService.Tables[0];
            cbSubService.DataValueField = dsSubService.Tables[0].Columns["subservice_id"].ToString();
             cbSubService.DataTextField = Convert.ToString(dsSubService.Tables[0].Columns["subservice_name"]);
         //   cbSubService.DataValueField = "subservice_id";
          //  cbSubService.DataTextField = "subservice_name";


            cbSubService.DataBind();

            foreach (ListItem li in cbSubService.Items)
            {
                foreach (DataRow dr in dsSubService.Tables[1].Rows)
                {
                    if (Convert.ToInt32(li.Value) == Convert.ToInt32(dr["subservice_id"]))
                    {
                        li.Selected = true;
                    }
                  
                }
            }

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ids = "";
        foreach (ListItem li in cbSubService.Items)
        {
            if (li.Selected == true)
            {


                ids += li.Value + "|";
            }
        
        }
        string strError="";
       
        DataManipulationClass objDataM = new DataManipulationClass();
        
        if (!objDataM.Add_Service_SubService_Relation(Convert.ToInt32(ddlService.SelectedValue), ids, ref strError))
        {
            lblMsg.Text = strError;
          
        }
        else
        {
            lblMsg.Text = "Relation added Successfully";
        }
    
    
    }
}
