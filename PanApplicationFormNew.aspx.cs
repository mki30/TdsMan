using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TDSModel;

public partial class PanApplicationFormNew : System.Web.UI.Page
{
    string Id = "";
    string Data1 = "";
    Boolean Corrrection = false;
    Boolean Pan = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        Data1 = RouteData.Values["Data1"] != null ? RouteData.Values["Data1"].ToString() : "";
        Id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
        if (Id == "0")
            lblId.InnerText = Id.ToString();
        Pan = Request.RawUrl.Contains("tan") ? false : true;
        Corrrection = Request.RawUrl.Contains("correction") ? true: false;
        if (Pan)
        {
            Title = "New PAN Card Application";
            head.InnerText = "New PAN Card Application";
            date.InnerText = DateTime.Today.ToString("dd-MM-yyy");
            if (Corrrection)
            {
                Title = "Change/Correction in PAN Card";
                head.InnerText = "Change/Correction in PAN Card";
                divCorrection.Visible = true;
            }
        }
        else if (!Pan)
        {
            Title = "New TAN Card Application";
            head.InnerText = "New TAN Card Application";
            pnlPersonal.Visible = false;
            divIncome.Visible = false;
            divDocument.Visible = false;
            divRA.Visible = false;
            divDEclarationPaN.Visible = false;
            divAddressPaN.Visible = false;
            tdComm.Visible = false;
            pnlTANInfo.Visible = true;
            tdTANCategory.Visible = true;
            divAddressTAN.Visible = true;
            divDeclarationTan.Visible = true;
            divTanDetails.Visible = true;
            if (Corrrection)
            {
                Title = "Change/Correction in TAN Card";
                head.InnerText = "Change/Correction in PAN Card";
                trTANNumber.Visible = true;
            }
        }
        date.InnerText = DateTime.Today.ToString("dd-MM-yyy");
        //if (!IsPostBack)
        //{
        //if (Global.LogInDone)
        //{
        if (Id != "")
        {
            ShowData();

        }

        //}
        //}
    }
    public void ShowData()
    {
        if (Request.RawUrl.Contains("pan"))
            ShowDataPAN();
        if (Request.RawUrl.Contains("tan"))
            ShowDataTAN();
    }
    public void ShowDataTAN()
    {
        TanDetail td = TanDetail.GetByID(Cmn.ToInt(Id));
        if (td != null)
        {
            ddTanCategory.Value = td.Category;
            if (Corrrection)
                txtTANNumber.Text = td.TANNumber;
            if (td.Initial == 1)
                title1.Checked = true;
            if (td.Initial == 2)
                title2.Checked = true;
            if (td.Initial == 3)
                title3.Checked = true;
            Text1.Value = td.Name1;
            Text2.Value = td.Name2;
            Text3.Value = td.Name3;
            Text4.Value = td.Name4;
            Text5.Value = td.Name5;
            mobilenumber.Value = td.MobileNumber;
            codenumb.Value = td.STDCode.ToString();
            codephn.Value = td.PhoneNo;
            emailids.Value = td.EmailId;
            txtPAN.Value = td.PANNumber;
            txtTAN.Value = td.TANNumber1;
            txtTCS.Value = td.TCSNumber;
            if (td.Nationality == "Indian")
                chkIndian.Checked = true;
            if (td.Nationality == "Foreign")
                chkForeign.Checked = true;
            txtFlat.Value = td.O_Address1;
            txtBuilding.Value = td.O_Address2;
            txtRoad.Value = td.O_Address3;
            txtArea.Value = td.O_Address4;
            txtDistrict.Value = td.O_Address5;
            ddState.Value = td.O_State.ToString();
            txtPin.Value = td.O_Pin.ToString();
            txtCountry.Value = td.O_Country;
        }
    }
    public void ShowDataPAN()
    {
        PanDetail pd = PanDetail.GetByID(Cmn.ToInt(Id));
        if (pd != null)
        {
            if (Corrrection)
            {
                string[] correct = pd.Correction.Split(',');
                if (correct[0] == "00_1") changeinholdersname00.Checked = true; if (correct[1] == "01_1") changeinfathersname01.Checked = true;
                if (correct[2] == "10_1") changeindob10.Checked = true; if (correct[3] == "11_1") changeinaddress11.Checked = true;
                if (correct[4] == "20_1") changeinsign20.Checked = true; if (correct[5] == "21_1") changeingender21.Checked = true;
                if (correct[6] == "30_1") changeinphoto30.Checked = true; if (correct[7] == "31_1") changeinaadhar31.Checked = true;
                pannumber.Value = pd.PANNumber;
            }
            date.InnerText = Cmn.ToDate(pd.LUDate).ToString("dd-MM-yyy");
            firstnameupp.Value = pd.FirstName;
            middlenameupp.Value = pd.MiddleName;
            lastnameupp.Value = pd.LastName;
            print_firstname.Value = pd.PrintName.Split(' ')[0];
            print_lastname.Value = pd.PrintName.Split(' ')[1];
            father_fname.Value = pd.FatherFirstName;
            father_mname.Value = pd.FatherMiddleName;
            father_lname.Value = pd.FatherLastName;
            string[] str = Cmn.ToDate(pd.DOB).ToString().Split('/');
            dd.Value = str[0];
            mm.Value = str[1];
            dob_year.Value = Cmn.ToDate(pd.DOB).Year.ToString();
            mobilenumber.Value = pd.PhoneNo;
            emailids.Value = pd.EmailId;
            aadharnumber.Value = pd.AdharNo;
            proofofidentity.Value = pd.ProofId.ToString();
            proofofoffice.Value = pd.OfficeAddressProof.ToString();
            proofofresidence.Value = pd.ProofAddress.ToString();
            dobproof.Value = pd.ProofDOB.ToString();
            if (pd.Gender == "M")
                gender1.Checked = true;
            else
                gender2.Checked = true;
            if (pd.AddressForComm == 0)
                resid1.Checked = true;
            else
                resid2.Checked = true;
            if (pd.MaritalStatus == "Single")
                RadioGroup10.Checked = true;
            else
                RadioGroup11.Checked = true;

            flatroomnoresidence.Value = pd.R_Address1;
            premiseresidence.Value = pd.R_Address2;
            roadstreetresidence.Value = pd.R_Address3;
            arealocalityresidence.Value = pd.R_Address4;
            district.Value = pd.R_Address5;
            city.InnerText = pd.R_Address5;
            searchstate.Value = pd.R_State.Value.ToString();
            pincoderesidence.Value = pd.R_Pin.ToString();
            residence_country.Value = pd.R_Country;
            nameofofc.Value = pd.O_Address1;
            floorrommno.Value = pd.O_Address2.Split(',')[0];
            nameofpremis.Value = pd.O_Address2.Split(',')[0];
            roadstreet.Value = pd.O_Address3;
            arealocaldiv.Value = pd.O_Address3;
            towncity.Value = pd.O_Address5;
            stateunion.Value = pd.O_State.ToString();
            pincodezipcode.Value = pd.O_State.ToString();
            if (pd.Salaried == 1)
                chkincome.Checked = true;
            otherincome.Value = pd.SourceOfIncome.ToString();
            businesscode.Value = pd.Profession.ToString();
            if (pd.RA == 1)
            {
                chkincomess1.Checked = true;
                radiv.Attributes.Remove("style");
            }
            if (pd.RA_Initial == 1)
                shri1.Checked = true;
            if (pd.RA_Initial == 1)
                shri1.Checked = true;
            if (pd.RA_Initial == 2)
                shri2.Checked = true;
            if (pd.RA_Initial == 3)
                shri3.Checked = true;
            rafirstname.Value = pd.RA_FName;
            ramiddlename.Value = pd.RA_MName;
            ralastname.Value = pd.RA_LName;
            ra_flatroom.Value = pd.RA_LName;
            ra_premise.Value = pd.RA_Address2;
            ra_roadstreet.Value = pd.RA_Address3;
            ra_area.Value = pd.RA_Address4;
            towncity2.Value = pd.RA_City;
            stateunion1.Value = pd.RA_State.ToString();
            ra_pinzip.Value = pd.RA_Pin.ToString();
            residence_country.Value = pd.RA_Country;
            category10.Checked = pd.Category == "Individual" ? true : false;
            Submit.InnerText = "Save";
            //Reset.Visible = false;
            //declaration.Visible = false;
            if (pd.OtherName == null)
                return;
            else
            {
                firstnameothr.Value = pd.OtherName.Split(' ')[0];
                middlenameothr.Value = pd.OtherName.Split(' ')[1];
                lastnameothr.Value = pd.OtherName.Split(' ')[2];
            }
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Pan)
            UpdatePAN();
        else if (!Pan)
            UpdateTAN();
    }
    public void UpdateTAN()
    {
        TanDetail td = TanDetail.GetByID(Cmn.ToInt(lblId.InnerText));
        if (td == null || lblId.InnerText == "0")
        {
            td = new TanDetail();
            td.ID = 0;
        }
        td.Category = ddTanCategory.Value;
        //td.SubCategory = Radio1.Checked == true ? Radio1.Value : "";
        td.Initial = title1.Checked == true ? 1 : title2.Checked == true ? 2 : title3.Checked == true ? 3 : 0;
        td.Name1 = Text1.Value;
        td.Name2 = Text2.Value;
        td.Name3 = Text3.Value;
        td.Name4 = Text4.Value;
        td.Name5 = Text5.Value;

        td.MobileNumber = mobilenumber.Value;
        td.STDCode = Cmn.ToInt(codenumb.Value);
        td.PhoneNo = codephn.Value;
        td.EmailId = emailids.Value;
        td.PANNumber = txtPAN.Value;
        td.TANNumber1 = txtTAN.Value;
        td.TCSNumber = txtTCS.Value;
        td.Nationality = chkIndian.Checked == true ? "Indian" : chkForeign.Checked == true ? "Foreign" : "";
        td.O_Address1 = txtFlat.Value;
        td.O_Address2 = txtBuilding.Value;
        td.O_Address3 = txtRoad.Value;
        td.O_Address4 = txtArea.Value;
        td.O_Address5 = txtDistrict.Value;
        td.O_State = Cmn.ToInt(ddState.Value);
        td.O_Pin = Cmn.ToInt(txtPin.Value);
        td.O_Country = txtCountry.Value;
        if (Corrrection)
            td.TANNumber = txtTANNumber.Text;
        td.Save();

        if (lblId.InnerText == "0" || lblId.InnerText == "")
        {
            TDSModel.User user = new TDSModel.User();
            if (user != null)
                TDSModel.User.LoginAlreadyExists(firstnameupp.Value, emailids.Value, mobilenumber.Value);
            else
                TDSModel.User.CreateLogin(firstnameupp.Value, emailids.Value, mobilenumber.Value);
            if (td.OrderNumber == null) //Create Order No
            {
                td.OrderNumber = DateTime.Now.ToString("ddMMyy") + ((int)TransType.Pan).ToString("00") + (td.ID).ToString("0000");
                td.Save();
            }
            if (td.EmailId != "" && Corrrection == false)
            {
                string mailBody = "<p>Dear " + td.EmailId + ", </P>" +
               "<p>We thank you for choosing our services.</p>" +
               "<p>This is to confirm that you have successfully requested for TAN.<p>" +
               "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
               "<p>Your Order Number is:<b>" + td.OrderNumber + "</h4></b>" +
               "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                Cmn.SendEmail("TAN Application Submitted", td.EmailId, td.EmailId, Cmn.CreateMailStructure("TAN Application Submitted", td.EmailId, mailBody));
            }
            else if (td.EmailId != "" && Corrrection == true)
            {
                string mailBody = "<p>Dear " + td.EmailId+ ", </P>" +
               "<p>We thank you for choosing our services.</p>" +
               "<p>This is to confirm that you have successfully requested for TAN Correction.<p>" +
               "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
               "<p>Your Order Number is:<b>" + td.OrderNumber + "</h4></b>" +
               "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                Cmn.SendEmail("TAN Correction Application Submitted", td.EmailId, td.EmailId, Cmn.CreateMailStructure("TAN Correction Application Submitted", td.EmailId, mailBody));
            }
            content.Visible = false;
            divSummary.Visible = true;
            Name.Text = Text1.Value;
            Mobile.Text = td.PhoneNo;
            Email.Text = td.EmailId;
            Amount.Text = "100";
            lblId.InnerText = td.ID.ToString();
        }
        else
        {
            lblErrorMsg.Text = "Saved Sucessfully";
        }

    }
    public void UpdatePAN()
    {
        if (ValidateForm() == false)
            return;
        PanDetail pd = PanDetail.GetByName(firstnameupp.Value, middlenameupp.Value, lastnameupp.Value);
        if (pd != null)
            pd = PanDetail.GetByFatherName(father_fname.Value);
        lblId.InnerText = pd == null ? "0" : pd.ID.ToString();
        if (pd == null)
        {
            pd = new PanDetail();
            pd.ID = 0;
        }
        pd.FirstName = firstnameupp.Value;
        pd.MiddleName = middlenameupp.Value;
        pd.LastName = lastnameupp.Value;
        pd.PrintName = firstnameupp.Value + " " + lastnameupp.Value;
        pd.FatherFirstName = father_fname.Value;
        pd.FatherMiddleName = father_mname.Value;
        pd.FatherLastName = father_lname.Value;
        pd.DOB = Cmn.ToDate(dd.Value + "/" + mm.Value + "/" + dob_year.Value);
        pd.MobileNumber = mobilenumber.Value;
        pd.STDCode = Cmn.ToInt(codenumb.Value);
        pd.PhoneNo = codephn.Value;
        pd.EmailId = emailids.Value;
        pd.AdharNo = aadharnumber.Value;
        pd.ProofId = Cmn.ToInt(proofofidentity.Value);
        pd.OfficeAddressProof = Cmn.ToInt(proofofoffice.Value);
        pd.ProofAddress = Cmn.ToInt(proofofresidence.Value);
        pd.ProofDOB = Cmn.ToInt(dobproof.Value);
        pd.Gender = gender2.Checked == true ? "F" : "M";
        pd.AddressForComm = resid2.Checked == true ? 1 : 0;//0 for resisdence and 1 for office
        pd.MaritalStatus = RadioGroup11.Checked == true ? "Married" : "Single";
        pd.R_Address1 = flatroomnoresidence.Value;
        pd.R_Address2 = premiseresidence.Value;
        pd.R_Address3 = roadstreetresidence.Value;
        pd.R_Address4 = arealocalityresidence.Value;
        pd.R_Address5 = district.Value;
        pd.R_State = Cmn.ToInt(searchstate.Value);
        pd.R_Pin = Cmn.ToInt(pincoderesidence.Value);
        pd.R_Country = residence_country.Value;
        pd.O_Address1 = nameofofc.Value;
        pd.O_Address2 = floorrommno.Value + "," + nameofpremis.Value;
        pd.O_Address3 = roadstreet.Value;
        pd.O_Address4 = arealocaldiv.Value;
        pd.O_Address5 = towncity.Value;
        pd.O_State = Cmn.ToInt(stateunion.Value);
        pd.O_Pin = Cmn.ToInt(pincodezipcode.Value);
        pd.Salaried = chkincome.Checked == true ? 1 : 0;
        pd.SourceOfIncome = Cmn.ToInt(otherincome.Value);
        pd.Profession = Cmn.ToInt(businesscode.Value);
        pd.RA = chkincomess1.Checked == true ? 1 : 0;
        if (shri1.Checked == true)
            pd.RA_Initial = 1;
        if (shri2.Checked == true)
            pd.RA_Initial = 2;
        if (shri3.Checked == true)
            pd.RA_Initial = 3;
        pd.RA_FName = rafirstname.Value;
        pd.RA_MName = ramiddlename.Value;
        pd.RA_LName = ralastname.Value;
        pd.RA_Address1 = ra_flatroom.Value;
        pd.RA_Address2 = ra_premise.Value;
        pd.RA_Address3 = ra_roadstreet.Value;
        pd.RA_Address4 = ra_area.Value;
        pd.RA_City = towncity2.Value;
        pd.RA_State = Cmn.ToInt(stateunion1.Value);
        pd.RA_Pin = ra_pinzip.Value;
        pd.RA_Country = residence_country.Value;
        pd.OtherName = firstnameothr.Value + " " + middlenameothr.Value + " " + lastnameothr.Value;
        pd.Category = "Individual"; //category10.Checked == true ? "Individual" : "";
        pd.LUDate = DateTime.Today;
        if (Corrrection)
        {
            string crctn = "";
            //if (changeinholdersname00.Checked == true) crctn += "00" + ","; if (changeinfathersname01.Checked == true) crctn += "01" + ",";
            //if (changeindob10.Checked == true) crctn += "10" + ","; if (changeinaddress11.Checked == true) crctn += "11" + ",";
            //if (changeinsign20.Checked == true) crctn += "20" + ","; if (changeingender21.Checked == true) crctn += "21" + ",";
            //if (changeinphoto30.Checked == true) crctn += "30" + ","; if (changeinaadhar31.Checked == true) crctn += "31" + ",";
            if (changeinholdersname00.Checked == true) crctn += "00_1" + ","; else crctn += "00_0" + ",";
            if (changeinfathersname01.Checked == true) crctn += "01_1" + ","; else crctn += "01_0" + ",";
            if (changeindob10.Checked == true) crctn += "10_1" + ","; else crctn += "10_0" + ",";
            if (changeinaddress11.Checked == true) crctn += "11_1" + ","; else crctn += "11_0" + ",";
            if (changeinsign20.Checked == true) crctn += "20_1" + ","; else crctn += "20_0" + ",";
            if (changeingender21.Checked == true) crctn += "21_1" + ","; else crctn += "21_0" + ",";
            if (changeinphoto30.Checked == true) crctn += "30_1" + ","; else crctn += "30_0" + ",";
            if (changeinaadhar31.Checked == true) crctn += "31_1" + ","; else crctn += "31_0" + ",";
            pd.Correction = crctn;
            pd.PANNumber = pannumber.Value;
        }
        pd.Save();
        if (lblId.InnerText == "0")
        {
            TDSModel.User user = new TDSModel.User();
            if (user != null)
                TDSModel.User.LoginAlreadyExists(firstnameupp.Value, emailids.Value, mobilenumber.Value);
            else
                TDSModel.User.CreateLogin(firstnameupp.Value, emailids.Value, mobilenumber.Value);
            if (pd.OrderNumber == null) //Create Order No
            {
                pd.OrderNumber = DateTime.Now.ToString("ddMMyy") + ((int)TransType.Pan).ToString("00") + (pd.ID).ToString("0000");
                pd.Save();
            }
            if (pd.EmailId != "" && Corrrection == false)
            {
                string mailBody = "<p>Dear " + pd.FirstName + ", </P>" +
               "<p>We thank you for choosing our services.</p>" +
               "<p>This is to confirm that you have successfully requested for PAN.<p>" +
               "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
               "<p>Your Order Number is:<b>" + pd.OrderNumber + "</h4></b>" +
               "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                Cmn.SendEmail("PAN Application Submitted", pd.EmailId, pd.EmailId, Cmn.CreateMailStructure("PAN Application Submitted", pd.EmailId, mailBody));
            }
            else if (pd.EmailId != "" && Corrrection == true)
            {
                string mailBody = "<p>Dear " + pd.FirstName + ", </P>" +
               "<p>We thank you for choosing our services.</p>" +
               "<p>This is to confirm that you have successfully requested for PAN Correction.<p>" +
               "<br/><p>In case you have any query, kindly call us on <br/><a href='tel:01204322456'>(0120) 432-2456</a><br/><a href='tel:919650606247'>+91 9650606247</a><br/><a href='tel:918826693260'>+91 8826693260</a><br/><br/> or write us at <br/><a href='mailto:contact@fincomindia.in'>contact@fincomindia.in</a>.</p>" +
               "<p>Your Order Number is:<b>" + pd.OrderNumber + "</h4></b>" +
               "<br/><p>Thanking You<br/>Team Fin Com India</p>";
                Cmn.SendEmail("PAN Correction Application Submitted", pd.EmailId, pd.EmailId, Cmn.CreateMailStructure("PAN Correction Application Submitted", pd.EmailId, mailBody));
            }
            content.Visible = false;
            divSummary.Visible = true;
            Name.Text = pd.FirstName + " " + pd.MiddleName + " " + pd.LastName;
            Mobile.Text = pd.PhoneNo;
            Email.Text = pd.EmailId;
            Amount.Text = "100";
            lblId.InnerText = pd.ID.ToString();
        }
        else
        {
            lblErrorMsg.Text = "Saved Sucessfully";
        }


    }
    private bool ValidateForm()
    {
        lblErrorMsg.Text = "";
        if (Corrrection)
        {
            if (pannumber.Value == "")
            {
                lblErrorMsg.Text = "PAN Number Required!";
                pannumber.Focus();
                return false;
            }
            if (changeinaadhar31.Checked == false && changeinaddress11.Checked == false && changeindob10.Checked == false && changeinfathersname01.Checked == false && changeingender21.Checked == false && changeinholdersname00.Checked == false && changeinphoto30.Checked == false && changeinsign20.Checked == false)
            {
                lblErrorMsg.Text = "Please select an option for correction!";
                changeinholdersname00.Focus();
                return false;
            }
        }
        if (firstnameupp.Value == "")
        {
            lblErrorMsg.Text = "Name Required!";
            firstnameupp.Focus();
            return false;
        }

        else if (father_fname.Value == "")
        {
            lblErrorMsg.Text = "Father's Name Required!";
            father_fname.Focus();
            return false;
        }
        else if (dd.Value == "" || mm.Value == "" || dob_year.Value == "")
        {
            lblErrorMsg.Text = "Date of birth Required!";
            dd.Focus();
            return false;
        }
        else if (gender1.Checked == false && gender2.Checked == false)
        {
            lblErrorMsg.Text = "Gender Required!";
            gender1.Focus();
            return false;
        }
        else if (RadioGroup10.Checked == false && RadioGroup11.Checked == false)
        {
            lblErrorMsg.Text = "Marital Status Required!";
            gender1.Focus();
            return false;
        }
        else if (aadharnumber.Value == "")
        {
            lblErrorMsg.Text = "Aadhar Number Required!";
            aadharnumber.Focus();
            return false;
        }
        else if (chkbusiness.Checked == true)
        {
            if (businesscode.Value == "")
            {
                lblErrorMsg.Text = "Business Type Required!";
                businesscode.Focus();
                return false;
            }
        }
        else if (chksource.Checked == true)
        {
            if (otherincome.Value == "")
            {
                lblErrorMsg.Text = "Other Source of Income Required!";
                otherincome.Focus();
                return false;
            }
        }
        else if (chkincomess1.Checked == true)
        {
            if (shri1.Checked == false && shri2.Checked == false && shri3.Checked == false)
            {
                lblErrorMsg.Text = "Title Required!";
                shri1.Focus();
                return false;
            }
            if (rafirstname.Value == "")
            {
                lblErrorMsg.Text = "Name Required!";
                rafirstname.Focus();
                return false;
            }

        }

        else if (mobilenumber.Value == "")
        {
            lblErrorMsg.Text = "Mobile No required !";
            mobilenumber.Focus();
            return false;
        }
        else if (emailids.Value == "")
        {
            lblErrorMsg.Text = "email id required !";
            emailids.Focus();
            return false;
        }
        else if (proofofidentity.Value == "")
        {
            lblErrorMsg.Text = "Please select proof of identity";
            return false;
        }
        else if (resid2.Checked == true)
        {
            if (proofofoffice.Value == "")
            {
                lblErrorMsg.Text = "Please select proof of office";
                resid2.Focus();
                return false;
            }
        }
        else if (proofofresidence.Value == "")
        {
            lblErrorMsg.Text = "Please select proof of residence";
            return false;
        }
        return true;
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        PanDetail pan = PanDetail.GetByID(Cmn.ToInt(lblId.InnerText));
        TanDetail tan = TanDetail.GetByID(Cmn.ToInt(lblId.InnerText));
        PayUMoneycontrol.CreatePostForPayment(null, Amount.Text, null, pan == null ? null : pan, tan == null ? null : tan);

    }
}