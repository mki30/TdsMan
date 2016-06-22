using System;
//using PropertyListModel;

public partial class Admin_DBUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnUpdateDatabase_Click(object sender, EventArgs e)
    {
        DatabaseCE db = new DatabaseCE();   //Update Database Structute
        try
        {
            int ctr = 0;
            while (DBCheck.UpdateDBStructure(db, ++ctr)) ;
            Response.Write("Update done");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            db.Close();
        }
    }

    protected void btnEmptyTables_Click(object sender, EventArgs e)
    {
        string[] tables = { "MST_COMPANY", "MST_DEDUCTEE", "MST_EMPLOYEE", "TRN_BASIC_INFO", "TRN_COMPANY_INFO", "TRN_CHALLAN", "TRN_DEDUCTEE_DETAILS", "TRN_SALARY_DETAILS" };
        foreach (string table in tables)
        {
            string sqlComd = "delete from " + table;
            DatabaseCE db = new DatabaseCE();
            try
            {
                db.RunQuery(sqlComd);
                Response.Write(table+" Cleared!");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                db.Close();
            }
        }
        Response.Write("Cleared!");
    }
}