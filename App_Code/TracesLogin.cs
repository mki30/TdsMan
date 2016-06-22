public class TracesLogin
{
    private string strUserID = "";
    private string strPassword = "";
    private string strTAN = "";
    private string strCaptchaCode = "";

    public string UserID
    {
        get
        {
            return this.strUserID;
        }
        set
        {
            this.strUserID = value;
        }
    }

    public string Password
    {
        get
        {
            return this.strPassword;
        }
        set
        {
            this.strPassword = value;
        }
    }

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

    public string CaptchaCode
    {
        get
        {
            return this.strCaptchaCode;
        }
        set
        {
            this.strCaptchaCode = value;
        }
    }
}