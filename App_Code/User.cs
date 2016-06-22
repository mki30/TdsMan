using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class User
    {
        public string Message = "";
        public License MyCompany = null;

        public User()
        {
        }

        public User Save()
        {
            try
            {
                using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
                {
                    Boolean IsNew = false;

                    if (ID == 0)
                    {
                        ID = 1;
                        try
                        {
                            ID = context.Users.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToUsers(this);
                    else
                    {
                        context.CreateObjectSet<User>().Attach(this);
                        context.ObjectStateManager.ChangeObjectState(this, EntityState.Modified);
                    }
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Message += ex.Message;
            }
            return this;
        }

        public static User GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.FirstOrDefault(m => m.ID == ID);
            }
        }

        public static List<User> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.Where(m => m.UserType != 0).ToList();
            }
        }

        public static User Validate(string EmailID, string Pass)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.FirstOrDefault(m => m.EmailID == EmailID && m.Password == Pass);
            }
        }
        public static List<User> GetUsersByLicenseID(int LicenceID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.Where(m => m.LicenseID == LicenceID).ToList();
            }
        }
        public static List<User> GetByUserType(int userType)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.Where(m => m.UserType == userType).ToList();
            }
        }

        public static List<User> GetbySearch(string term)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.Where(m => (m.EmailID.Contains(term) || m.ContactNo.Contains(term)) && m.UserType == 0).Take(20).ToList();
            }
        }

        public static User GetByEmailID(string emailId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.FirstOrDefault(m => m.EmailID == emailId);
            }
        }
        public static User GetByEmailIDName(string emailId, string name)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.FirstOrDefault(m => m.EmailID == emailId && m.Name == name);
            }
        }
        public static User GetAgentAdmin(int licenseID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.FirstOrDefault(m => m.LicenseID == licenseID && m.UserType == 2);
            }
        }
        public static void LoginAlreadyExists(string name, string email, string contactno, string password = "")
        {
            User U = User.GetByEmailID(email);
            try
            {
                U.Name = name;
                U.EmailID = email;
                U.ContactNo = contactno;
                U.UserType = 0;
                if (U.AutoLogin == "")
                    U.AutoLogin = Guid.NewGuid().ToString();
                U.Save();
                string mailBody =
                "<p>Dear " + U.Name + ", You have already registered with us.</p>" +
                "<p>Your login details are-<p>" +
                "<p><b>User Id: " + U.EmailID + "</b></p>" +
                "<p><b>Password: " + U.Password + "</b></p>" +
                "<p><b><a href='http://fincomindia.in/account/login.aspx?autologin=" + U.AutoLogin + "'>Click</a> here to login<b></p>";
                Cmn.SendEmail("Login Information", U.EmailID, U.Name, Cmn.CreateMailStructure("Login Detail", U.EmailID, mailBody));
            }
            catch
            {
            }
        }
        public static void CreateLogin(string name, string email, string contactno, string password = "")
        {
            //if (Global.LogInDone == true || TDSModel.User.GetByEmailID(email) != null)
            //    return;
            User U = new User();
            try
            {
                U.Name = name;
                U.EmailID = email;
                password = password == "" ? Cmn.CreateRandomPassword(6) : password;
                U.Password = password;
                U.ContactNo = contactno;
                U.UserType = 0;
                U.AutoLogin = Guid.NewGuid().ToString();
                U.Save();
                string mailBody =
                "<p>Dear " + U.Name + ", thank you for registering with us.</p>" +
                "<p>Your login details are-<p>" +
                "<p><b>User Id: " + U.EmailID + "</b></p>" +
                "<p><b>Password: " + U.Password + "</b></p>" +
                "<p><b><a href='http://fincomindia.in/account/login?autologin=" + U.AutoLogin + "'>Click</a> here to login<b></p>";
                Cmn.SendEmail("Login Information", U.EmailID, U.Name, Cmn.CreateMailStructure("Login Detial", U.EmailID, mailBody));
            }
            catch
            {
            }
        }
        public static User CreateLogin1(string name, string email, string contactno)
        {
            //if (Global.LogInDone == true || TDSModel.User.GetByEmailID(email) != null)
            //    return;
            User U = new User();
            try
            {
                U.Name = name;
                U.EmailID = email;
                string password = Cmn.CreateRandomPassword(6);
                U.Password = password;
                U.ContactNo = contactno;
                U.UserType = 0;
                U.AutoLogin = Guid.NewGuid().ToString();
                U.Save();
                string mailBody =
                "<p>Dear " + U.Name + ", thank you for registering with us.</p>" +
                "<p>Your login details are-<p>" +
                "<p><b>User Id: " + U.EmailID + "</b></p>" +
                "<p><b>Password: " + U.Password + "</b></p>" +
                "<p><b><a href='http://fincomindia.in/login?autologin=" + U.AutoLogin + "'>Click</a> here to login<b></p>";
                Cmn.SendEmail("Login Information", U.EmailID, U.Name, Cmn.CreateMailStructure("Login Detial", U.EmailID, mailBody));
            }
            catch
            {
            }
            return U;
        }
        public static User ValidatebyAutoLogin(string autologin)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Users.FirstOrDefault(m => m.AutoLogin == autologin);
            }
        }
    }
}