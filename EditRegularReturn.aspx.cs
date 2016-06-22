using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class EditRegularReturn : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        string id = QueryString("id");
        lblID.Text=id;
        if (!IsPostBack)
        {
            ShowData();
        }
    }
    private void ShowData()
     {
        //RegularReturn rr= RegularReturn.GetByID(Cmn.ToInt(lblID.Text));
        //if(rr!=null)
        //{
        //    lblFinancialYexr.Text = (rr.FinancialYear).ToString() + "-" + (rr.FinancialYear + 1).ToString();
        //    lblQuarter.Text = ((Quarter)rr.Quarter).ToString();
        //    Company c=Company.GetByID((int)rr.CompanyID);
        //    lblCompany.Text = c.CompanyName;
        //    lblFormNo.Text = ((RegularReturnType)rr.FormType).ToString().Replace("_","");
        //    ddReturnFiledPrev.SelectedValue = rr.PrevRegularReturnToken == "" ? "0" : "1";
        //    txtTokenOfPrev26QReturn.Text = rr.PrevRegularReturnToken;
        //    chkCompany.Checked = rr.AddressChangedCompany == 1 ? true : false;
        //    chkResponsiblePerson.Checked = rr.AddressChangedRP == 1 ? true : false;
        //    txtReciptNo.Text = rr.ReciptNo;
        //    txtDateOfFiling.Text = Cmn.ToDate(rr.DateOfFiling).ToString("dd-MMM-yy") == "01-Jan-00" ? "" : (Cmn.ToDate(rr.DateOfFiling).ToString("dd-MMM-yy").ToString());
        //    txtTokenNo.Text = rr.TokenNo;
        //    ResetPrevTokenText();
        //}
      }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //Update();
    }
    private void Update()
    {
        //RegularReturn rr = RegularReturn.GetByID(Cmn.ToInt(lblID.Text));
        //if (rr != null)
        //{
        //    try
        //    {
        //        rr.PrevRegularReturnToken = txtTokenOfPrev26QReturn.Text;
        //        rr.AddressChangedCompany = chkCompany.Checked == true ? 1 : 0;
        //        rr.AddressChangedRP = chkResponsiblePerson.Checked == true ? 1 : 0;
        //        rr.ReciptNo = txtReciptNo.Text;
        //        rr.DateOfFiling = Cmn.ToDate(txtDateOfFiling.Text);
        //        rr.TokenNo = txtTokenNo.Text;

        //        Company C = Company.GetByID((int)rr.CompanyID);
        //        rr.CompanyName = C.CompanyName;
        //        rr.TanNo = C.TanNo;
        //        rr.PanNo = C.PanNo;
        //        rr.Branch = C.Branch;
        //        rr.DeductorType = C.DeductorType;
        //        rr.TanRegNo = C.TanRegNo;
        //        rr.FlatBlock = C.FlatBlock;
        //        rr.Building = C.Building;
        //        rr.Street = C.Street;
        //        rr.Area = C.Area;
        //        rr.Town = C.Town;
        //        rr.Pin = C.Pin;
        //        rr.State = C.State;
        //        rr.Std = C.Std;
        //        rr.Phone = C.Phone;
        //        rr.StdAlt = C.StdAlt;
        //        rr.PhoneAlt = C.PhoneAlt;
        //        rr.Email = C.Email;
        //        rr.EmailAlt = C.EmailAlt;
        //        rr.RPName = C.RPName;
        //        rr.RPDesg = C.RPDesg;
        //        rr.RPFathersName = C.RPFathersName;
        //        rr.RPMobile = C.RPMobile;
        //        rr.RPFlatBlock = C.RPFlatBlock;
        //        rr.RPBuilding = C.RPBuilding;
        //        rr.RPStreet = C.RPStreet;
        //        rr.RPArea = C.RPArea;
        //        rr.RPTown = C.RPTown;
        //        rr.RPPin = C.RPPin;
        //        rr.RPState = C.RPState;
        //        rr.RPStd = C.RPStd;
        //        rr.RPStdAlt = C.RPStdAlt;
        //        rr.RPPhone = C.RPPhone;
        //        rr.PhoneAlt = C.PhoneAlt;
        //        rr.RPEmail = C.RPEmail;
        //        rr.RPEmailAlt = C.RPEmailAlt;
        //        rr.PAOCode = C.PAOCode;
        //        rr.PAORegNo = C.PAORegNo;
        //        rr.DDOCode = C.DDOCode;
        //        rr.DDORegNo = C.DDORegNo;
        //        rr.GvtDeductorState = C.GvtDeductorState;
        //        rr.Ministry = C.Ministry;
        //        rr.OtherMinistry = C.OtherMinistry;
        //        rr.AccountOfficerIDNo = C.AccountOfficerIDNo;
        //        rr.CITAddress = C.CITAddress;
        //        rr.CITCity = C.CITCity;
        //        rr.CITPin = C.CITPin;



        //        rr.Save();
        //        lblMsg.Text = "Saved!";
        //        lblMsg.ForeColor = System.Drawing.Color.Green;
        //    }
        //    catch 
        //    {
        //    }
        //}
    }
    protected void dd26QReturnFiledPrev_SelectedIndexChanged(object sender, EventArgs e)
    {
        ResetPrevTokenText();
    }
    private void ResetPrevTokenText()
    {
        if (ddReturnFiledPrev.SelectedValue == "0")
        {
            txtTokenOfPrev26QReturn.ReadOnly = true;
            txtTokenOfPrev26QReturn.Text = "";
        }
        else
            txtTokenOfPrev26QReturn.ReadOnly = false;
    }
}