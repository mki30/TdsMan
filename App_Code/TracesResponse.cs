// Decompiled with JetBrains decompiler
// Type: TDSMAN.Classes.TracesResponse
// Assembly: TDSMAN, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 952B4D48-0FC3-44A5-A16A-36F971D7C17C
// Assembly location: C:\Program Files (x86)\TDSMAN FY 2014-15(trial)\TDSMAN.exe


    public class TracesResponse
    {
        private enmResponse Response;
        private string strMessage;
        private TracesData objTraceData;
        private object CustomTypes;

        public enmResponse Respons
        {
            get
            {
                return this.Response;
            }
            set
            {
                this.Response = value;
            }
        }

        public string Message
        {
            get
            {
                return this.strMessage;
            }
            set
            {
                this.strMessage = value;
            }
        }

        public TracesData UserData
        {
            get
            {
                return this.objTraceData;
            }
            set
            {
                this.objTraceData = value;
            }
        }

        public object CustomeTypes
        {
            get
            {
                return this.CustomTypes;
            }
            set
            {
                this.CustomTypes = value;
            }
        }
    }

