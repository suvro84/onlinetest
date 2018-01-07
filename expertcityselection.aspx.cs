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
using System.Data.SqlClient;
using System.Text;

public partial class expertcityselection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getCity();
            ////getService_SubService();
            getServiceHTML();
        }
    }


    public void getCity()
    {
        string strSql = "select * from tblCityMaster  ";
        commonclass objcommon = new commonclass();
        DataTable dtCity = new DataTable();
        dtCity = objcommon.Fetchrecords(strSql);
        rptCity.DataSource = dtCity;
        rptCity.DataBind();
        foreach (DataRow drCity in dtCity.Rows)
        {
            hidCityIds.Value += drCity["city_id"].ToString() + ",";

        }

        if (hidCityIds.Value.Length > 0)
        {
            hidCityIds.Value = hidCityIds.Value.Substring(0, hidCityIds.Value.Length - 1);
        }
        hidTotCity.Value = "1";


    }

    //public void getService_SubService()
    //{
    //    string strSql = " select " +
    //                    " s.service_id ," +
    //                    " s.service_name," +
    //                    " sub.subservice_name,  " +
    //                    " sub.subservice_id  " +
    //                    " from " +
    //                    " tblService_SubService_City_Relation r " +
    //                    " inner join tblSubServiceMaster sub on sub.subservice_id=r.subservice_id " +
    //                    " inner join tblServiceMaster s on s.service_id=r.service_id " +
    //                    " where " +
    //                    " s.service_status=1 and sub.subservice_status=1 ";
    //    commonclass objcommon = new commonclass();
    //    DataTable dtService = new DataTable();
    //    dtService = objcommon.Fetchrecords(strSql);
    //    dlService.DataSource = dtService;
    //    dlService.DataBind();


    //    foreach (DataListItem DataListItem in dlService.Items)
    //    {
    //        // SQL Select Command

    //        string strSqlNew = " select " +

    //                   " sub.subservice_name,  " +
    //                   " sub.subservice_id  " +
    //                   " from " +
    //                   " tblService_SubService_City_Relation r " +
    //                   " inner join tblSubServiceMaster sub on sub.subservice_id=r.subservice_id " +
    //            //  " inner join tblServiceMaster s on s.service_id=r.service_id "+
    //                   " where " +
    //                   " service_id = @service_id and sub.subservice_status=1 ";
    //        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["connectionString"]);


    //        SqlCommand mySqlSelect = new SqlCommand(strSqlNew, con);

    //        mySqlSelect.CommandType = CommandType.Text;

    //        // Parameter passed as categoryID
    //        // to get products that belong to the passed categoryId
    //        // FindControl HiddenField used to retrieve the value of categoryId
    //        mySqlSelect.Parameters.Add("@service_id", SqlDbType.Int).Value = ((HiddenField)DataListItem.FindControl("hiddenCategoryID")).Value;

    //        SqlDataAdapter mySqlAdapter = new SqlDataAdapter(mySqlSelect);

    //        DataSet myDataSet = new DataSet();

    //        mySqlAdapter.Fill(myDataSet);

    //        DataList dlSubService = (DataList)(DataListItem.FindControl("dlSubService"));

    //        // Databinding with Nested DataList Control
    //        dlSubService.DataSource = myDataSet;

    //        ((DataList)(DataListItem.FindControl("dlSubService"))).DataBind();


    //    }


    //}

    public void getServiceHTML()
    {

        ArrayList sameprod = new ArrayList();
        int intcounter = 0;
        string strSql = " select " +
                        " s.service_id ," +
                        " s.service_name" +
                        " from " +
                        " tblService_SubService_Relation r " +
                        " inner join tblServiceMaster s on s.service_id=r.service_id " +
                        " where " +
                        " s.service_status=1  ";
        commonclass objcommon = new commonclass();
        DataTable dtService = new DataTable();
        dtService = objcommon.Fetchrecords(strSql);
        //dlService.DataSource = dtService;
        //dlService.DataBind();
        StringBuilder sbSurvice = new StringBuilder();
        sbSurvice.Append("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"836\">");
        sbSurvice.Append("<tbody>");



        sbSurvice.Append("<tr>");
        int service_id = 0;
        foreach (DataRow drService in dtService.Rows)
        {


            if (!sameprod.Contains(Convert.ToInt32(drService["service_id"])))
            {

                sbSurvice.Append("<td style=\"height: 178px;\" valign=\"top\" width=\"20%\">");
                sbSurvice.Append(getSub_ServiceHTML(Convert.ToInt32(drService["service_id"]), Convert.ToString(drService["service_name"])));
                sbSurvice.Append("</td>");
                sameprod.Add(Convert.ToInt32(drService["service_id"]));
                intcounter++;
            }


            if (intcounter == 4)
                {
                    sbSurvice.Append("</tr>");
                    sbSurvice.Append("<tr>");
                    sbSurvice.Append("<td style=\"height: 19px;\" width=\"20%\">");
                    sbSurvice.Append("&nbsp;");
                    sbSurvice.Append("</td>");
                    sbSurvice.Append("<td style=\"height: 19px;\" width=\"20%\">");
                    sbSurvice.Append("&nbsp;");
                    sbSurvice.Append(" </td>");
                    sbSurvice.Append("<td style=\"height: 19px;\" width=\"20%\">");
                    sbSurvice.Append(" &nbsp;");
                    sbSurvice.Append("</td>");
                    sbSurvice.Append("<td style=\"height: 19px;\" width=\"20%\">");
                    sbSurvice.Append(" &nbsp;");
                    sbSurvice.Append(" </td>");
                    sbSurvice.Append(" </tr>");

                    intcounter=0;
                }



          








            //sbSurvice.Append("<td style=\"height: 178px;\" valign=\"top\" width=\"20%\">");
            //sbSurvice.Append("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"209\">");
            //sbSurvice.Append("<tbody>");
            //sbSurvice.Append("<tr>");
            //sbSurvice.Append("<td class=\"GoldSection\" style=\"height: 19px;\" bgcolor=\"#f6e08d\">");
            //sbSurvice.Append(Convert.ToString(drService["service_name"]));
            //sbSurvice.Append("</td>");
            //sbSurvice.Append("</tr>");
            //sbSurvice.Append("<tr>");
            //sbSurvice.Append("<td style=\"height: 140px;\" bgcolor=\"#fcf4d6\" valign=\"top\">");
            //sbSurvice.Append(getSub_ServiceHTML(service_id));
            //sameprod.Add(service_id);

            //sbSurvice.Append("</td>");
            //sbSurvice.Append("</tr>");
            //sbSurvice.Append("</tbody>");
            //sbSurvice.Append("</table>");
            //sbSurvice.Append("</td>");











        }




        sbSurvice.Append("</tbody>");
        sbSurvice.Append("</table>");
        divServiceList.InnerHtml = sbSurvice.ToString();
        if (hidSubServId.Value.Length > 0)
        {
            hidSubServId.Value = hidSubServId.Value.Substring(0, hidSubServId.Value.Length - 1);
        }
    }

    public string getSub_ServiceHTML(int service_id, string service_name)
    {



        string strSql = " select " +
                      " sub.subservice_name,  " +
                      " sub.subservice_id  " +
                      " from " +
                      " tblService_SubService_City_Relation r " +
                      " inner join tblSubServiceMaster sub on sub.subservice_id=r.subservice_id " +
            //  " inner join tblServiceMaster s on s.service_id=r.service_id "+
                      " where " +
                      " service_id = " + service_id + " and sub.subservice_status=1 ";
        StringBuilder sbSubSurvice = new StringBuilder();

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["connectionString"]);
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmdSubServide = new SqlCommand(strSql, con);
            SqlDataReader drSubService = cmdSubServide.ExecuteReader(CommandBehavior.CloseConnection);
            sbSubSurvice.Append("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"209\">");
            sbSubSurvice.Append("<tbody>");
            sbSubSurvice.Append("<tr>");
            sbSubSurvice.Append("<td class=\"GoldSection\" style=\"height: 19px;\" bgcolor=\"#f6e08d\">");
            sbSubSurvice.Append(service_name);
            sbSubSurvice.Append("</td>");
            sbSubSurvice.Append("</tr>");
            sbSubSurvice.Append("<tr>");
            sbSubSurvice.Append("<td style=\"height: 140px;\" bgcolor=\"#fcf4d6\" valign=\"top\">");


            if (drSubService.HasRows)
            {

                while (drSubService.Read())
                {



                    //sbSubSurvice.Append("<input id=\"chkSubServ3\" name=\"chkSubServ3\" onclick=\"javascript:return CheckSameCheckbox(this,'chkSubServ3');\" value=\"3\" type=\"checkbox\">");
                    sbSubSurvice.Append("<input id=\"chkSubServ" + drSubService["subservice_id"].ToString() + "\" name=\"chkSubServ" + drSubService["subservice_id"].ToString() + "\" onclick=\"javascript:return CheckSameCheckbox(this,'chkSubServ" + drSubService["subservice_id"].ToString() + "');\" value=\"" + drSubService["subservice_id"].ToString() + "\" type=\"checkbox\">");

                    //Fund Distributors
                    sbSubSurvice.Append(drSubService["subservice_name"].ToString());

                    sbSubSurvice.Append("<br>");



                    //sameprod.Add(service_id);









                    hidSubServId.Value += drSubService["subservice_id"].ToString() + ",";

                    hidTotSubServId.Value = "2";
                }
            }
            sbSubSurvice.Append("</td>");
            sbSubSurvice.Append("</tr>");
            sbSubSurvice.Append("</tbody>");
            sbSubSurvice.Append("</table>");
            //return sbSubSurvice.ToString();
        }
        catch (Exception ex)
        {
            sbSubSurvice.Remove(0, sbSubSurvice.Length - 1);
            sbSubSurvice.Append(ex.Message);
            //throw ex;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        //strSubSurvice = sbSubSurvice.ToString();
        return sbSubSurvice.ToString();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        // var hdnMeasurementIds=document.getElementById("hdnMeasurementIds").value;

        //var strMeasurementIds =new Array(); 
        //var SelectedMeasurements="";
        //strMeasurementIds=hdnMeasurementIds.split('|'); 

        //for(var i=0;i<strMeasurementIds.length-1;i++)
        //{
        //    if(document.getElementById("CheckBox"+strMeasurementIds[i]).checked == true)
        //    {
        //       SelectedMeasurements+=document.getElementById("CheckBox"+strMeasurementIds[i]).value  + "|";
        //    }
        //}



        string[] strCityIds = hidCityIds.Value.Split(new char[] { ',' });

        string seletedcities = "";
        for (int i = 0; i < strCityIds.Length - 1; i++)
        {
            if (Request.Form.Get("chkCity" + strCityIds[i]) != null)
            {
                seletedcities += Request.Form.Get("chkCity" + strCityIds[i]) + "|";
            }
        }
        string[] strcity = seletedcities.Split(new char[] { '|' });
        int cityid = 0;
        if (strcity.Length > 0)
        {
            cityid = Convert.ToInt32(strcity[0]);
        }

        string[] strSubService = hidSubServId.Value.Split(new char[] { ',' });

        string seletedSubService = "";
        for (int i = 0; i < strSubService.Length - 1; i++)
        {
            if (Request.Form.Get("chkSubServ" + strSubService[i]) != null)
            {
                seletedSubService += Request.Form.Get("chkSubServ" + strSubService[i]) + "|";
            }
        }


        //foreach (DataListItem dl in rptCity.Items)
        //{
        //    for (int i = 1; i < strCityIds.Length - 1; i++)
        //    {
        //        CheckBox cbcity = (CheckBox)dl.FindControl("chkCity" + strCityIds[i]);
        //        if (cbcity.Checked == true)
        //        {
        //            seletedcities += cbcity.Text;
        //        }
        //    }
        //}

        string strError = "";
        Session["login_id"] = 1;
        Session["package_id"] = 18;
        string order_id = "-";
        DataManipulationClass objDataM = new DataManipulationClass();

        if (!objDataM.Add_Package_CitySelection(seletedSubService, cityid, Convert.ToInt32(Session["login_id"]), Convert.ToInt32(Session["package_id"]), order_id, ref strError))
        {
            //lblMsg.Text = strError;

        }
        else
        {
            //lblMsg.Text = "Relation added Successfully";
            Response.Redirect("EditExpertProfile.aspx");
        }
    

    }
}
