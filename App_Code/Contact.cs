using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace TDSModel
{
    public partial class Contact
    {
        public string Message = "";

        public Contact()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Contact Save()
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
                            ID = context.Contacts.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToContacts(this);
                    else
                    {
                        context.CreateObjectSet<Contact>().Attach(this);
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

        public static Contact GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Contacts.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static Contact GetByTransactionID(string TransactionID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Contacts.FirstOrDefault(m => m.TransactionID== TransactionID);
            }
        }

        public static List<Contact> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Contacts.ToList();
            }
        }

        public static List<Contact> GetByLicenseID(int LicenseID)
        {
            var Agents = User.GetUsersByLicenseID(LicenseID).Select(m => m.ID).ToArray();

            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Contacts.Where(m => Agents.Contains((int)m.AgentId)).ToList();
            }
        }

        public static List<Contact> GetByAgentID(int AgentID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Contacts.Where(m => m.AgentId == AgentID || AgentID==-1).ToList();
            }
        }

        public static List<CounterIntKey> GetStageCount()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Contacts.GroupBy(m => m.Stage).Select(g => new CounterIntKey() { Key = g.Key, Count = g.Count() }).ToList();
            }
        }

        public static List<Contact> GetByEmail(string emailId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Contacts.Where(m => m.Email == emailId).OrderByDescending(m => m.LUDate).ToList();
            }
        }

        public static Contact GetbyOrderNumber(string OrderNumber)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.Contacts.FirstOrDefault(m => m.OrderNo == OrderNumber);
            }
        }
    }
}