using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace TDSModel
{
    public partial class DscDetail
    {
        public string Message = "";

        public DscDetail()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public DscDetail Save()
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
                            ID = context.DscDetails.Max(m => m.ID) + 1;
                        }
                        catch { }
                        IsNew = true;
                    }

                    LUDate = DateTime.Now;

                    if (IsNew)
                        context.AddToDscDetails(this);
                    else
                    {
                        context.CreateObjectSet<DscDetail>().Attach(this);
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

        public static DscDetail GetByID(int ID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.FirstOrDefault(m => m.ID == ID);
            }
        }
        public static DscDetail GetByTransactionID(string TransactionId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.FirstOrDefault(m => m.TransactionID == TransactionId);
            }
        }
        public static List<DscDetail> GetAll()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.ToList();
            }
        }
        
        public static List<DscDetail> GetAllInComplete()
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.Where(m=>m.DscStage!=(int)TransactionStage.Complete).ToList();
            }
        }

        public static List<DscDetail> GetAllComplete(int DaysOld=60)
        {
            DateTime date = DateTime.Today.AddDays(-DaysOld);
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.Where(m => m.Complete == 1 && m.CompletionDate > date).ToList();
            }
        }

        public static List<DscDetail> GetIncompleteAndCompletedWithMonthAndPaid(int LicenseID = -1, int AgentId = -1)
        {
            if (LicenseID == 0)
                LicenseID = -1;
            //using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            //{
            //    DateTime dateAfterOneMonth = DateTime.Today.AddDays(-60);
            //    List<DscDetail> list = context.DscDetails.Where(m => (AgentId == -1 || m.AgentId == AgentId) && m.Paid == 1 && (m.Complete == null || m.Complete != 1) && m.Date > dateAfterOneMonth).ToList();

            //    if (LicenseID == -1)
            //        return list;
            //    else
            //    {
            //        var Agents = User.GetUsersByLicenseID(LicenseID).Select(m => m.ID).ToArray();
            //        if (list != null)
            //            return list.Where(m => Agents.Contains(Cmn.ToInt(m.AgentId))).ToList();
            //    }
            //    return new List<DscDetail>();
            //}
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                DateTime dateAfterOneMonth = DateTime.Today.AddDays(-60);
                List<DscDetail> list = context.DscDetails.Where(m => (AgentId == -1 || m.AgentId == AgentId) && m.Paid == 1 && (m.Complete == null || m.Complete != 1) && m.Date > dateAfterOneMonth).ToList();

                if (LicenseID == -1)
                    return list;
                else
                {
                    var Agents = User.GetUsersByLicenseID(LicenseID).Select(m => m.ID).ToArray();
                    if (list != null)
                        return list.Where(m => m.AgentId != null && Agents.Contains((int)m.AgentId)).ToList();
                }
                return new List<DscDetail>();
            }


        }
        
        public static List<DscDetail> GetByAgentID(int AgentID)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.Where(m => m.AgentId == AgentID).ToList();
            }
        }

        public static List<DscDetail> GetByLicenseID(int LicenseID)
        {
            var Agents = User.GetUsersByLicenseID(LicenseID).Select(m => m.ID).ToArray();
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.Where(m => Agents.Contains((int)m.AgentId)).ToList();
            }
        }

        public static List<CounterIntKey> GetStageCount(int License=-1,int AgentID=-1)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.Where(m=>(m.AgentId==AgentID || AgentID==-1)).GroupBy(m => m.DscStage).Select(g => new CounterIntKey() { Key = g.Key, Count = g.Count() }).ToList();
            }
        }

        public static List<DscDetail> GetByMailID(string emailId)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.Where(m => m.Email == emailId).OrderByDescending(m => m.Date).ToList();
            }
        }

        public static DscDetail GetbyOrderNumber(string OrderNumber)
        {
            using (TDSEntities context = new TDSEntities(Global.ConnectionStringEntity))
            {
                return context.DscDetails.FirstOrDefault(m => m.OrderNo == OrderNumber);
            }
        }

        public string GetDSCRow(int ctr, bool ShowAssign = false, int StageFilter = 100)
        {
            StringBuilder sb = new StringBuilder();
            double timeTaken = (DateTime.Now - Cmn.ToDate(EntryTime)).TotalMinutes;
            sb.Append("<tr " + (timeTaken > Global.GetTime((TransactionStage)DscStage) ? "class='danger'" : "") + " "
                 + (Delete == 1 ? "style='text-decoration:line-through;'" : "") + "><td>" + ctr + "<td><a href='/DscApplicationForm.aspx?id=" + ID + "' target='_blank'>" + ApplicantName
                 + ", " + MobileNo + "</a><td>" + Email + "<td>" + Cmn.ToDate(Date).ToString("dd-MMM-yy") + ""
                 + "<td>" + (ClassType != null ? ((ClassType)ClassType).ToString() : "") + " / " + (DscUserType)UserType
                 + " / " + (CertificateType)CirtificateType
                 + " / " + (CertificateValidity == 0 ? "1Yr" : "2Yr")
                 + (NeedUsbToken == 1 ? " / token" : ""));

            if (ShowAssign)
            {
                TDSModel.User u = null;
                if (AgentId != null)
                    Global.UserList.TryGetValue((int)AgentId, out u);
                sb.Append("<td><a class='fancybox350 fancybox.iframe' href='/AssignTask.aspx?taskid=" + ID + "&transtype=" + (int)(TransType.Dsc)
                    + "&agentid=" + (AgentId != null ? AgentId : 0) + "' target='blank'>" + (u != null ? (Global.CurrentUserType == UserTypes.UT_Admin ? u.MyCompany.Name + "-" : "") + u.Name : "Assign") + "</a>");
            }

            string idProofDwnloadText = "Download";
            string AddressProofDwnloadText = "Download";

            DscDetail DD = DscDetail.GetByID((int)ID);
            if (DD != null)
            {
                idProofDwnloadText = DD.IdentificationDocument != null ? Global.GetText((IdentificDocType)DD.IdentificationDocument) : "-";
                AddressProofDwnloadText = DD.AddressProofDocument != null ? Global.GetText((AdressProofDocType)DD.AddressProofDocument) : "-";
            }

            string[] dirIdProof = Directory.GetFiles((System.Web.HttpContext.Current.Server.MapPath("/Documents/IdProof/")), "" + ID + "*");
            sb.Append("<td>" + (dirIdProof.Length > 0 ? "Yes" : "No"));

            string[] dirAddressProof = Directory.GetFiles((System.Web.HttpContext.Current.Server.MapPath("/Documents/AddressProof/")), "" + ID + "*");
            sb.Append("<td>" + (dirAddressProof.Length > 0 ? "Yes" : "No"));

            string[] dirAdminDoc = Directory.GetFiles((System.Web.HttpContext.Current.Server.MapPath("/Documents/AdminDoc/")), "" + ID + "*");
            sb.Append("<td>" + (dirAdminDoc.Length > 0 ? "Yes" : "No"));

            sb.Append("<td title='" + Cmn.ToDate(DD.EntryTime).ToString("dd-MM-yy hh:mm") + "'>" + (DateTime.Now - Cmn.ToDate(DD.EntryTime)).TotalMinutes.ToString("0"));

            if (StageFilter == -1)
                sb.Append("<td>" + Global.GetText((TransactionStage)DscStage));
            return sb.ToString();
        }
    }
}