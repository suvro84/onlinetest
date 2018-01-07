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

public partial class AjaxPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["mode"] != null)
        {
            int value = Convert.ToInt32(Request.Params["value"]);
            int expert_id = Convert.ToInt32(Request.Params["expert_id"]);
            int login_id = 1;
            if (Request.Params["mode"] == "rating_ServiceConsultant")
            {
                switch (value)
                {
                    case 1:
                        Response.Write("MyMoneyJugglers.aspx|");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(1);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(2);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(3);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(4);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(5);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("|");
                        rating(expert_id, login_id, value);



                        break;
                    case 2:
                        Response.Write("MyMoneyJugglers.aspx|");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(1);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(2);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(3);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(4);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(5);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("|");
                        rating(expert_id, login_id, value);
                        break;
                    case 3:
                        Response.Write("MyMoneyJugglers.aspx|");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(1);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(2);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(3);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(4);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(5);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("|");
                        rating(expert_id, login_id, value);
                        break;
                    case 4:
                        Response.Write("MyMoneyJugglers.aspx|");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(1);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(2);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(3);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(4);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img  onclick=\"InsertUserRating_ServiceConsultant(5);\" border=\"0\" src=\"Pictures/star_i.gif\" />");
                        Response.Write("|");
                        break;
                    case 5:
                        Response.Write("MyMoneyJugglers.aspx|");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(1);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(2);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(3);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(4);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(5);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                        Response.Write("|");
                        rating(expert_id, login_id, value);
                        break;
                    //default:
                    //    Response.Write("<img onclick=\"InsertUserRating_ServiceConsultant(5);\" border=\"0\" src=\"Pictures/star_iv.gif\" />");
                    //    break; 
                }

            }

        }
    }

    public void rating(int expert_id, int login_id, int value)
    {
        string sql = "";
        commonclass objcommon = new commonclass();
        sql = "select rating from tblRating where expert_id=" + Convert.ToInt32(Request.QueryString["expert_id"]) + " and login_id=" + login_id + "";
        int rating = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString()))

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }



                SqlCommand CMD = new SqlCommand(sql, con);
                SqlDataReader dr = CMD.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        rating = Convert.ToInt32(dr["rating"]);
                    }

                }



            }


            catch (Exception ex)
            {
                //strError = ex.Message;
                //bflag = false;
            }

            finally
            {
                // close the Sql Connection
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

        if (rating == 0)
        {
            sql = "insert into tblRating(expert_id,login_id,status,rating)values(" + expert_id + "," + login_id + ",4," + value + ")";
            if (objcommon.ReturnExecute(sql) > 0)
            {
            }
        }
        else
        {
            sql = "update  tblRating set rating=" + value + " where expert_id=" + expert_id + " and login_id=" + login_id + " ";
            if (objcommon.ReturnExecute(sql) > 0)
            {
            }
        }
    }
}
