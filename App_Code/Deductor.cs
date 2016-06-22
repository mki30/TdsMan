// Decompiled with JetBrains decompiler
// Type: TDSMAN.Classes.Deductor
// Assembly: TDSMAN, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 952B4D48-0FC3-44A5-A16A-36F971D7C17C
// Assembly location: C:\Program Files (x86)\TDSMAN FY 2014-15(trial)\TDSMAN.exe


    public class Deductor
    {
        private string strTAN = "";
        private string strAssessmentYear = "";
        private string strFormType = "";
        private string strQuarter = "";
        private string strRegStatement = "";
        private string strCorrectionStatement = "";
        private string strPAN = "";
        private string strDeductee = "";
        private int intNoDetailsRec = 0;

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

        public string AssessmentYear
        {
            get
            {
                return this.strAssessmentYear;
            }
            set
            {
                this.strAssessmentYear = value;
            }
        }

        public string FormType
        {
            get
            {
                return this.strFormType;
            }
            set
            {
                this.strFormType = value;
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

        public string RegularStatement
        {
            get
            {
                return this.strRegStatement;
            }
            set
            {
                this.strRegStatement = value;
            }
        }

        public string CorrectionStatement
        {
            get
            {
                return this.strCorrectionStatement;
            }
            set
            {
                this.strCorrectionStatement = value;
            }
        }

        public string DeducteePAN
        {
            get
            {
                return this.strPAN;
            }
            set
            {
                this.strPAN = value;
            }
        }

        public string Deductee
        {
            get
            {
                return this.strDeductee;
            }
            set
            {
                this.strDeductee = value;
            }
        }

        public int NoOfDetailsRecord
        {
            get
            {
                return this.intNoDetailsRec;
            }
            set
            {
                this.intNoDetailsRec = value;
            }
        }
    }

