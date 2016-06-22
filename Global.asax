<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.IO" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Global.LoadGlobalData();
        InitializeRoutes(RouteTable.Routes);
    }

    private void InitializeRoutes(RouteCollection routes)
    {
        routes.MapPageRoute(routeName: "blank", routeUrl: "", physicalFile: "~/Default2.aspx", checkPhysicalUrlAccess: true);
        routes.MapPageRoute(routeName: "default", routeUrl: "default", physicalFile: "~/Default.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Contact", routeUrl: "contact", physicalFile: "~/ContactUs.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "contact" } });
        routes.MapPageRoute(routeName: "About", routeUrl: "about", physicalFile: "~/About.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "about" } });
        routes.MapPageRoute(routeName: "WhyUs", routeUrl: "whyus", physicalFile: "~/WhyUs.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "contactus" } });
        routes.MapPageRoute(routeName: "TermsOfService", routeUrl: "termsofservice", physicalFile: "~/TermsOfUse.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "contactus" } });
        routes.MapPageRoute(routeName: "Disclaimer", routeUrl: "disclaimer", physicalFile: "~/Disclaimer.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "contactus" } });
        routes.MapPageRoute(routeName: "PrivacyPolicy", routeUrl: "privacypolicy", physicalFile: "~/PrivacyPolicy.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "contactus" } });
        routes.MapPageRoute(routeName: "Admin Page", routeUrl: "adminpanel", physicalFile: "~/AdminPage.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Manage Licence", routeUrl: "managelicence", physicalFile: "~/ManageLicense.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "feedback", routeUrl: "feedback", physicalFile: "~/Feedback.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "knowledgeportal", routeUrl: "knowledgeportal", physicalFile: "~/KnowledgePortal.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "faq", routeUrl: "faq", physicalFile: "~/FAQ.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });

        routes.MapPageRoute(routeName: "returnfiling", routeUrl: "returnfiling", physicalFile: "~/Returnfiling.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "dsc", routeUrl: "dsc", physicalFile: "~/dsc.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "dscfaq", routeUrl: "dscfaq", physicalFile: "~/dscfaq.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "dscregistration", routeUrl: "dscregistration-{Data1}", physicalFile: "~/DscApplicationForm.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "company", routeUrl: "company", physicalFile: "~/CompanyPage.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "employee", routeUrl: "employee", physicalFile: "~/EmployeePage.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "deductee", routeUrl: "deductee", physicalFile: "~/DeducteePage.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "login", routeUrl: "login", physicalFile: "~/Account/Login.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        //routes.MapPageRoute(routeName: "account/login", routeUrl: "login", physicalFile: "~/Account/Login.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "challan", routeUrl: "challan", physicalFile: "~/AddChallan.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        
        routes.MapPageRoute(routeName: "salary calculator", routeUrl: "salary-calculator", physicalFile: "~/Employeesal.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "advance tax estimator", routeUrl: "advance-tax-estimator", physicalFile: "~/IncExp.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        
        routes.MapPageRoute(routeName: "pan verification", routeUrl: "pan-verification", physicalFile: "~/PanVerification.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "pan verification2", routeUrl: "pan-verification-{Data1}", physicalFile: "~/PanVerification.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }});
        routes.MapPageRoute(routeName: "pan application", routeUrl: "pan-application-{Data1}", physicalFile: "~/PanApplicationFormNew.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "tan application", routeUrl: "tan-application-{Data1}", physicalFile: "~/PanApplicationFormNew.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        //routes.MapPageRoute(routeName: "pan correction", routeUrl: "pan-correction", physicalFile: "~/PanApplicationFormNew.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "useful form download", routeUrl: "useful-form-download", physicalFile: "~/downloadusefulforms.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        
        routes.MapPageRoute(routeName: "pan", routeUrl: "pan-{Data1}", physicalFile: "~/Pan.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "tan-status", routeUrl: "tan-{Data1}", physicalFile: "~/pan.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "llp", routeUrl: "llp-{Data1}", physicalFile: "~/LLP.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "fdi", routeUrl: "fdi-{Data1}", physicalFile: "~/FDI.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "tan", routeUrl: "tan-{Data1}", physicalFile: "~/tan.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "tan" }, { "Data1", "" } });
        
        routes.MapPageRoute(routeName: "company registration", routeUrl: "reg-{Data1}", physicalFile: "~/CompanyRegistration.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "Incorporate", routeUrl: "incorporate-{Data1}", physicalFile: "~/Incorporate.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });
        routes.MapPageRoute(routeName: "trademark", routeUrl: "trademark-{Data1}", physicalFile: "~/Trademark.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "roc", routeUrl: "roc-{Data1}", physicalFile: "~/ROC.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Name Guidlines", routeUrl: "nameguidelines-{Data1}", physicalFile: "~/NameGuidlines.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Sell Business", routeUrl: "sell-business", physicalFile: "~/BusinessSell.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Sell Buy Business", routeUrl: "sell-buy", physicalFile: "~/SellBuyBusiness.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Buy Business", routeUrl: "buy-business/{Data1}", physicalFile: "~/BuyBusiness.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "buy-business" }, { "Data1", "" } });

        routes.MapPageRoute(routeName: "managelicense", routeUrl: "managelicense", physicalFile: "~/ManageLicense.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Confirmation", routeUrl: "confirmation", physicalFile: "~/Confirmation.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Customer", routeUrl: "Customer", physicalFile: "~/CustomerAccount.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "TanVerification", routeUrl: "tanverification", physicalFile: "~/TanVerification.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "GetInvoice", routeUrl: "getinvoice", physicalFile: "~/GetInvoice.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "Recharge", routeUrl: "recharge", physicalFile: "~/PaymentRecharge.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "SendEmail", routeUrl: "sendmail", physicalFile: "~/SendMail.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "GetImage", routeUrl: "getimage", physicalFile: "~/GetImage.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        //routes.MapPageRoute(routeName: "notfound", routeUrl: "{Data1}", physicalFile: "~/NotFound.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
    }
    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
    }
    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
    }
</script>
