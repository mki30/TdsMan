// Decompiled with JetBrains decompiler
// Type: TDSMAN.Classes.TracesData
// Assembly: TDSMAN, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 952B4D48-0FC3-44A5-A16A-36F971D7C17C
// Assembly location: C:\Program Files (x86)\TDSMAN FY 2014-15(trial)\TDSMAN.exe


    public class TracesData
    {
        private string strFAYear = "";
        private string strQuarter = "";
        private string strForms = "";
        private string strAuthenCode = "";
        private string strPRN_No = "";
        private bool bnlNoChallan = false;
        private bool bnlNoChallanCheck = false;
        private bool bnlBookAdjust = false;
        private bool bnlBookAdjustCheck = false;
        private bool panAmtVal = false;
        private bool panAmtValCheck = false;
        private string strBSRCode = "";
        private string strDate = "";
        private string strChallanNo = "";
        private string strChallanAmount = "";
        private bool bnlNoPanDeductee = false;
        private string strTAN = "";
        private string strPAN1 = "";
        private string strPAN1Amount = "";
        private string strPAN2 = "";
        private string strPAN2Amount = "";
        private string strPAN3 = "";
        private string strPAN3Amount = "";
        private string strFromChallanDepositDate = "";
        private string strToChallanDepositDate = "";
        private string strChallanStatus = "";

        public string TAN
        {
            get
            {
                return this.strTAN;
            }
            set
            {
                this.strTAN = value;
            }
        }

        public string FAYear
        {
            get
            {
                return this.strFAYear;
            }
            set
            {
                this.strFAYear = value;
            }
        }

        public string Quarter
        {
            get
            {
                return this.strQuarter;
            }
            set
            {
                this.strQuarter = value;
            }
        }

        public string Forms
        {
            get
            {
                return this.strForms;
            }
            set
            {
                this.strForms = value;
            }
        }

        public string AuthenticationCode
        {
            get
            {
                return this.strAuthenCode;
            }
            set
            {
                this.strAuthenCode = value;
            }
        }

        public string PRN_NO
        {
            get
            {
                return this.strPRN_No;
            }
            set
            {
                this.strPRN_No = value;
            }
        }

        public bool IsNoChallan
        {
            get
            {
                return this.bnlNoChallan;
            }
            set
            {
                this.bnlNoChallan = value;
            }
        }

        public bool IsNoChallanCheck
        {
            get
            {
                return this.bnlNoChallanCheck;
            }
            set
            {
                this.bnlNoChallanCheck = value;
            }
        }

        public bool IsPaymentByBookAdjustmentCheck
        {
            get
            {
                return this.bnlBookAdjustCheck;
            }
            set
            {
                this.bnlBookAdjustCheck = value;
            }
        }

        public bool IsPaymentByBookAdjustment
        {
            get
            {
                return this.bnlBookAdjust;
            }
            set
            {
                this.bnlBookAdjust = value;
            }
        }

        public bool panAmtValueCheck
        {
            get
            {
                return this.panAmtValCheck;
            }
            set
            {
                this.panAmtValCheck = value;
            }
        }

        public bool panAmtValue
        {
            get
            {
                return this.panAmtVal;
            }
            set
            {
                this.panAmtVal = value;
            }
        }

        public string BSRCode
        {
            get
            {
                return this.strBSRCode;
            }
            set
            {
                this.strBSRCode = value;
            }
        }

        public string TaxDepositedDate
        {
            get
            {
                return this.strDate;
            }
            set
            {
                this.strDate = value;
            }
        }

        public string ChallanSerialNo
        {
            get
            {
                return this.strChallanNo;
            }
            set
            {
                this.strChallanNo = value;
            }
        }

        public string ChallanAmount
        {
            get
            {
                return this.strChallanAmount;
            }
            set
            {
                this.strChallanAmount = value;
            }
        }

        public bool IsValidPANDeductee
        {
            get
            {
                return this.bnlNoPanDeductee;
            }
            set
            {
                this.bnlNoPanDeductee = value;
            }
        }

        public string PAN1
        {
            get
            {
                return this.strPAN1;
            }
            set
            {
                this.strPAN1 = value;
            }
        }

        public string PAN2
        {
            get
            {
                return this.strPAN2;
            }
            set
            {
                this.strPAN2 = value;
            }
        }

        public string PAN3
        {
            get
            {
                return this.strPAN3;
            }
            set
            {
                this.strPAN3 = value;
            }
        }

        public string PAN1Amount
        {
            get
            {
                return this.strPAN1Amount;
            }
            set
            {
                this.strPAN1Amount = value;
            }
        }

        public string PAN2Amount
        {
            get
            {
                return this.strPAN2Amount;
            }
            set
            {
                this.strPAN2Amount = value;
            }
        }

        public string PAN3Amount
        {
            get
            {
                return this.strPAN3Amount;
            }
            set
            {
                this.strPAN3Amount = value;
            }
        }

        public string FromChallanDepositDate
        {
            get
            {
                return this.strFromChallanDepositDate;
            }
            set
            {
                this.strFromChallanDepositDate = value;
            }
        }

        public string ToChallanDepositDate
        {
            get
            {
                return this.strToChallanDepositDate;
            }
            set
            {
                this.strToChallanDepositDate = value;
            }
        }

        public string ChallanStatus
        {
            get
            {
                return this.strChallanStatus;
            }
            set
            {
                this.strChallanStatus = value;
            }
        }
    }

