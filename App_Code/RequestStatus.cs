public class RequestStatus
{
    private string strAuthenCode = "";
    private string strFinalResponse = "";

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

    public string StatusMessage
    {
        get
        {
            return this.strFinalResponse;
        }
        set
        {
            this.strFinalResponse = value;
        }
    }
}