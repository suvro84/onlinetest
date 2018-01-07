using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;

/// <summary>
/// Summary description for DataManipulationClass
/// </summary>
public class DataManipulationClass
{

    public DataManipulationClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public GCommon<Service> populateService()
    {
        GCommon<Service> colService = new GCommon<Service>();
        Service objService = null;

        string strSql = "select * from tblServiceMaster ";
        commonclass objcommon = new commonclass();
        DataTable dtService = new DataTable();
        dtService = objcommon.Fetchrecords(strSql);
        foreach (DataRow drService in dtService.Rows)
        {

            objService = new Service();
            objService.service_id = Convert.ToInt32(drService["service_id"]);
            objService.service_name = Convert.ToString(drService["service_name"]);
            colService.Add(objService);
        }
        return colService;
    }
    public List<Service> populateService_list()
    {
        List<Service> colService = new List<Service>();
        Service objService = null;

        string strSql = "select * from tblServiceMaster ";
        commonclass objcommon = new commonclass();
        DataTable dtService = new DataTable();
        dtService = objcommon.Fetchrecords(strSql);
        foreach (DataRow drService in dtService.Rows)
        {

            objService = new Service();
            objService.service_id = Convert.ToInt32(drService["service_id"]);
            objService.service_name = Convert.ToString(drService["service_name"]);
            colService.Add(objService);
        }
        return colService;
    }

    public GCommon<State> populateState()
    {
        GCommon<State> colState = new GCommon<State>();
        State objstate = null;

        string strSql = "select * from tblstate order by sname ";
        commonclass objcommon = new commonclass();
        DataTable dtState = new DataTable();
        dtState = objcommon.Fetchrecords(strSql);
        foreach (DataRow drState in dtState.Rows)
        {

            objstate = new State();
            objstate.sid = Convert.ToInt32(drState["sid"]);
            objstate.sname = Convert.ToString(drState["sname"]);
            colState.Add(objstate);
        }
        return colState;
    }
    public bool Add_Service_SubService_Relation(int service_id, string ids, ref string strError)
    {
        bool bflag = false;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString()))

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //using (SqlCommand cmd = new SqlCommand();con.CreateCommand())
                //{
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "stp_Survice_SubService_Relation_Insert";
                cmd.Parameters.Add("@service_id", SqlDbType.Int).Value = service_id;
                cmd.Parameters.Add("@ids", SqlDbType.VarChar, 250).Value = ids;
                cmd.ExecuteNonQuery();
                bflag = true;
                //}


            }
            catch (Exception ex)
            {
                strError = ex.Message;
                bflag = false;
            }

            finally
            {
                // close the Sql Connection
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        return bflag;
    }


    public bool Add_Package_CitySelection(string seletedSubServiceIds, int seletedcities, int login_id, int package_id, string order_id, ref string strError)
    {
        bool bflag = false;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString()))

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //using (SqlCommand cmd = new SqlCommand();con.CreateCommand())
                //{
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "stp_Add_Package_CitySelection";
                cmd.Parameters.Add("@seletedSubServiceIds", SqlDbType.VarChar).Value = seletedSubServiceIds;
                cmd.Parameters.Add("@seletedcities", SqlDbType.Int).Value = seletedcities;
                cmd.Parameters.Add("@login_id", SqlDbType.Int).Value = login_id;
                cmd.Parameters.Add("@order_id", SqlDbType.VarChar, 250).Value = order_id;
                cmd.Parameters.Add("@package_id", SqlDbType.Int, 250).Value = package_id;

                cmd.ExecuteNonQuery();
                bflag = true;
                //}


            }
            catch (Exception ex)
            {
                strError = ex.Message;
                bflag = false;
            }

            finally
            {
                // close the Sql Connection
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        return bflag;
    }

    public void AddExpert(Login objlogin, ref string strError)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString()))

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "stp_Registration";
                    cmd.Parameters.Add("@username", SqlDbType.VarChar, 250).Value = objlogin.username;
                }


            }
            catch (Exception ex)
            {
                strError = ex.Message;
            }
    }


    public GCommon<City> populateCity()
    {
        GCommon<City> colCity = new GCommon<City>();
        City objCity = null;
        //string strSql = "select c.city_name " +
        //                " from tblCityMaster c" +
        //                " inner join tblService_SubService_City_Relation r on c.city_id=r.city_id" +
        //                " where c.city_status=1" +
        //                " order by c.city_name";
        string strSql = "select * from tblCityMaster order by city_name ";
        commonclass objcommon = new commonclass();
        DataTable dtCity = new DataTable();
        dtCity = objcommon.Fetchrecords(strSql);
        foreach (DataRow drCity in dtCity.Rows)
        {

            objCity = new City();
            objCity.city_id = Convert.ToInt32(drCity["city_id"]);
            objCity.city_name = Convert.ToString(drCity["city_name"]);
            colCity.Add(objCity);
        }
        return colCity;
    }

    public DataTable getDataTable(string strSql)
    {
        DataTable dt = new DataTable();

        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString()))
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            using (SqlDataAdapter da = new SqlDataAdapter(strSql, con))
            {
                da.Fill(dt);
            }

        }
        return dt;
    }
    public bool Execute(string sql, ref string strError)
    {
        bool bflag = false;
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString()))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                    bflag = true;

                }

            }
        }
        catch (Exception ex)
        {
            bflag = true;
        }
        return bflag;

    }

    public bool ExecuteProdedure(ref string strError)
    {
        bool bflag = false;
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString()))
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                using (SqlCommand cmd = new SqlCommand("spAdd", con))
                {

                    //cmd.CommandText = spAdd;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar, 250).Value = "ram";
                    cmd.Parameters.Add("@outpurparam", SqlDbType.VarChar, 250);
                    cmd.Parameters.Add("@outpurparam", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    bflag = true;

                }

            }
        }
        catch (Exception ex)
        {
            bflag = true;
            strError = ex.Message;
        }
        return bflag;

    }
    public void ExecuteDataReader()
    {
        string sql = "";
        using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString()))
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand("sql", con))
            {

                using (SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    if (dr.HasRows)
                    {
                        if (dr.Read())
                        {
                            string str = Convert.ToString(dr[""]);
                        }
                    }
                }
            }




        }

    }

    public bool ExecuteTrans(string sql, ref string strError)
    {
        bool bflag = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"].ToString());
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlTransaction trans = con.BeginTransaction();
        try
        {


            SqlCommand cmd = new SqlCommand(sql, con, trans);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();

            string sql1 = "";
            SqlCommand cmd1 = new SqlCommand(sql1, con, trans);
            cmd.CommandType = CommandType.Text;
            cmd1.ExecuteNonQuery();


            bflag = true;
            trans.Commit();
        }
        catch (Exception ex)
        {
            bflag = true;
            trans.Rollback();
        }
        return bflag;

    }

    public void funOL(int x)
    {
    }
    public int  funOL(int x,int y)
    {
        return 0;
    }

    //protected bool updateSbillStatus(string strOrderNumber, string strBankTransactionId, string strBankTransactionResponse, string strBankTransResponseMsg, ref string strSbillError)
    //{
    //    bool blFlag = false;
    //    try
    //    {
    //        if (conn.State != ConnectionState.Open)
    //        {
    //            conn.Open();
    //        }
    //        SqlTransaction tranUpdate = conn.BeginTransaction();
    //        try
    //        {
    //            strSql = "UPDATE " +
    //                        "[" + strSchema + "].[SalesMaster_BothWay]" +
    //                    "SET " +
    //                        "[" + strSchema + "].[SalesMaster_BothWay].[Bank_TranId]='" + strBankTransactionId + "', " +
    //                        "[" + strSchema + "].[SalesMaster_BothWay].[Sbill_Status]='1' " +
    //                    "WHERE " +
    //                        "([" + strSchema + "].[SalesMaster_BothWay].[SbillNo]='" + strOrderNumber + "')";
    //            SqlCommand cmdSbillStatus = new SqlCommand(strSql, conn, tranUpdate);
    //            cmdSbillStatus.ExecuteNonQuery();

    //            strSql = "UPDATE " +
    //                        "[" + strSchema + "].[Order_Pg_Details]" +
    //                    "SET " +
    //                        "[" + strSchema + "].[Order_Pg_Details].[BankTranId]='" + strBankTransactionId + "', " +
    //                        "[" + strSchema + "].[Order_Pg_Details].[BankTranResponse]='" + strBankTransactionResponse + "', " +
    //                        "[" + strSchema + "].[Order_Pg_Details].[BankTranMsg]='" + strBankTransResponseMsg + "' " +
    //                    "WHERE " +
    //                        "([" + strSchema + "].[Order_Pg_Details].[SbillNo]='" + strOrderNumber + "')";
    //            SqlCommand cmdOrderDetail = new SqlCommand(strSql, conn, tranUpdate);
    //            cmdOrderDetail.ExecuteNonQuery();
    //            tranUpdate.Commit();
    //            blFlag = true;

    //        }
    //        catch (Exception tranEx)
    //        {
    //            tranUpdate.Rollback();
    //            blFlag = false;
    //            strSbillError = tranEx.Message;
    //        }
    //    }
    //    catch (SqlException ex)
    //    {
    //        blFlag = false;
    //        strSbillError = ex.Message;
    //    }
    //    finally
    //    {
    //        if (conn.State != ConnectionState.Closed)
    //        {
    //            conn.Close();
    //        }
    //    }
    //    return blFlag;
    //}

}



