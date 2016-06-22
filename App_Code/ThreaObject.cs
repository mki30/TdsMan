using System;
using System.IO;
using System.Net;
using System.Text;
using System.Threading;


    public enum RequestType_
    {
        RT_DeleteFiles = 0,
        IR_TimeTable = 1,
        IR_TimeTableProcess = 11,
        IR_Fare = 2,
        IR_FareProcess = 21,
        IR_TrainList = 3,
        IR_TrainListProcess = 31,
        IR_TimeTable90DayRequest = 32,
        TE_TimeTable = 4,
        TE_TimeTablePrcoess = 41,
        TE_PassingTrain = 5,
        TE_RunningStatus = 6,
        TE_RunningStatusProcess = 61,
        TE_TrainRunDaysProcess = 71,
        IR_TrainAvailability = 8,
        IR_TrainAvailabilityProcess = 81,
        IR_TrainNewNumber = 82,
        eRail_Availability = 83,
        eRail_RunStatusPost = 85,
        IR_TrainRoute = 84,
        IR_ShortRoute = 91,
        IR_PNR_Status = 100,
        IR_PNR_StatusProcess = 101,
        ER_Test_Server = 111,
        FL_Actor = 500,
        FL_Film = 501,
        HTML_Request = 600
    }

    public class ThreadObject
    {
        public long Index;
        public Thread thread;
        public bool HasStarted;
        public HttpWebRequest myRequest;
        public int TimeOut;
        public int Tries;
        public Boolean Success;
        public string Error = "OK";
        public string FileRoot;
        public string FileWeb;
        //public string FileTxt;
        public string QMessage = "";
        public Boolean TdTextWithTitle = false;
        public string RequestURL = "";
        public string Referer = "";
        public string PostData = "";
        public string[] HtmlDataTables;
        public string[] ResponsesInvalid;
        public string[] ResponsesValid;
        public string Method = "POST";
        public string DataDownloaded = "";
        public string DataProcessed = "";
        public int Counter;
        public RequestType_ RequestType;

        public int Language=0; //0-English 1-Hindi

        public int TrainID;
        public string TrainNo;
        public string StnFrom;
        public string StnTo;
        public string Quota;
        public string Class;
        public string AgeGroup="AD"; //AD=30 adult , CH=8  child, SF=60 senior female, SM=65 senior male
        public int Age
        {
            get
            {
                return AgeGroup == "CH" ? 8 : AgeGroup == "SF" ? 60 : AgeGroup == "SM" ? 61 : 30; 
            }
        }
        public DateTime RunDate;
        public Boolean SendResultToQ = true;

        public ThreadObject()
        {
            myRequest = null;
            thread = null;
            HasStarted = false;
            Success = false;
            HtmlDataTables = null;
            TimeOut = 15000;
            RunDate = DateTime.Now;
        }

        public void Reset()
        {
            Success = false;
            HasStarted = true;
            Error = "OK";
            Counter = 0;
        }

        public void BuildRequest()
        {

            //if(myRequest==null)
                myRequest = (HttpWebRequest)WebRequest.Create(RequestURL);
            myRequest.ServicePoint.ConnectionLimit = 50;

            ASCIIEncoding encoding = new ASCIIEncoding();
            myRequest.Method = Method;
            myRequest.ContentType = "application/x-www-form-urlencoded";
            myRequest.Referer = Referer;
            myRequest.UserAgent = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2)";
            myRequest.Timeout = TimeOut;
            //myRequest.KeepAlive = false;

            if (PostData.Length > 0)
            {
                byte[] data = data = encoding.GetBytes(PostData);
                myRequest.ContentLength = data.Length;
                Stream newStream = myRequest.GetRequestStream();
                newStream.Write(data, 0, data.Length);
                newStream.Close();
            }
            else
                myRequest.ContentLength = 0;


        }

        public void ProcessDataDownloaded()
        {
            Success = true;
            Error = "OK";

            if (ResponsesInvalid != null)
            {
                foreach (string strError in ResponsesInvalid)
                {
                    if (DataDownloaded.Contains(strError))
                    {
                        Error = strError;
                        break;
                    }
                }
            }

            if (ResponsesValid != null && Error == "OK")
            {
                foreach (string strError in ResponsesValid)
                {
                    if (!DataDownloaded.Contains(strError))
                    {
                        Error = "Page not valid - Not found -" + strError;
                        break;
                    }
                }
            }
        }
    }

