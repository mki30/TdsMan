<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmailControl.ascx.cs" Inherits="Controls_EmailControl" %>
<div>
            <table style="max-width: 100%; margin: 0 auto;font-weight:bold;">
                <tr>
                    <td>
                        <p>To:  <%=EmailTo %> </p>
                    </td>
                </tr>
                <tr>
                    <td>Subject: <%=Subject %></td>
                </tr>
            </table>
            <div id="divContent" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <div style="font: inherit; font-size: 100%; margin: 0; padding: 0; background-color: #f5f5f5; font-family: Arial,sans-serif; font-size: 13px; color: #575757; line-height: 1.4">
                                <div>
                                    <table style="max-width: 615px; vertical-align: top; margin: 0 auto; padding: 0; font: inherit; border-spacing: 0; border-collapse: collapse">
                                        <tbody>
                                            <tr style="height: 50px; vertical-align: bottom; background-color: #f5f5f5; font-size: 11px; color: #575757">
                                                <td style="text-align: right; padding-bottom: 5px; padding-right: 5px; padding-left: 5px"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height: 100%; background-color: #ffffff">
                                                    <img src="http://fincomindia.com/Images/FinCom.png" style="vertical-align: bottom; width: 90px; min-height: 32px; padding-left: 5%; padding-top: 5%" />
                                                    <span style="font-size: 24px; line-height: 37px; color: #878787; white-space: nowrap; padding-left: 10px; padding-top: 5%">Fin Com India</span>

                                                    <div dir="ltr">
                                                        <div style="padding: 0 5%">
                                                            <table border="0" cellpadding="0" cellspacing="0" style="font: inherit; color: #878787; border-spacing: 0; border-collapse: collapse; width: 100%;">
                                                                <tbody>
                                                                    <tr style="margin-bottom: 20px; width: 100%;">
                                                                        <td style="padding-bottom: 15px; padding-right: 15px; padding-left: 0; vertical-align: middle;">
                                                                            <div style=" padding: 0">
                                                                                <div id="divDSCTransComplete" runat="server" visible="false">
                                                                                    <br /><br />
                                                                                    <p>Dear <b><%=DT.ApplicantName %></b></p>
                                                                                    <p>We thank you for choosing our services.</p>
                                                                                    <p>This is to confirm that we have successfully received your order for Digital Signature Certificate.</p>
                                                                                    <p>
                                                                                        <br />
                                                                                        The summary of your order is as below:
                                                                                    </p>
                                                                                    <p>Name:<b><%=DT.ApplicantName %></b></p>
                                                                                    <p>Signature Type:<b>  <%=((CertificateType)DT.CirtificateType).ToString() %></b></p>
                                                                                    <p>Validity:<b>  <%=((CertificateValidity)DT.CirtificateType).ToString() %> year</b></p>
                                                                                    <p>
                                                                                        Address:  <b><%=DT.Address %></b><br />
                                                                                    </p>
                                                                                    <br />
                                                                                    <p>
                                                                                        Your order will be completed in 2 Working days. In case you have any query, kindly call us on
                                                                                    <br />
                                                                                        <a href="tel:01204322456">(0120) 432-2456</a><br />
                                                                                        <a href="tel:919650606247">+91 9650606247</a><br />
                                                                                        <a href="tel:918826693260">+91 8826693260</a><br />
                                                                                        <br />
                                                                                        or write us at
                                                                                    <br />
                                                                                        <a href="mailto:contact@fincomindia.in?subject=<%=Subject%>">contact@fincomindia.in</a>.
                                                                                    </p>
                                                                                    <p>Your Order Number is:<b><%=DT.OrderNo %></b></p>
                                                                                    <div id="divAddress" runat="server" visible="false">
                                                                                        <p>
                                                                                            <br />
                                                                                            As chosen by you, kindly courier the documents to our address below:
                                                                                        </p>
                                                                                        <b>Garg Shekhar & Company</b><br/>
                                                                                        T - 5, Third Floor,<br/>
                                                                                        Above Croma Showroom,<br/>
                                                                                        Aditya City Centre,<br/>
                                                                                        Indirapuram,<br/>
                                                                                        Ghaziabad – 201014<br/>
                                                                                    </div>
                                                                                    <br />
                                                                                    <p>
                                                                                        Thanking You<br />
                                                                                        Team Fin Com India
                                                                                    </p>
                                                                                </div>
                                                                                 <div id="divPANTransaction" runat="server" visible="false">
                                                                                    <br /><br />
                                                                                    <p>Dear <b><%=pd.FirstName %></b></p>
                                                                                    <p>We thank you for choosing our services.</p>
                                                                                    <p>This is to confirm that we have successfully received your request for Permanent Account Number.</p>
                                                                                    <p>
                                                                                        <br />
                                                                                        The summary of your order is as below:
                                                                                    </p>
                                                                                    <p>Name:<b><%=pd.FirstName%></b></p>
                                                                                    
                                                                                    <p>
                                                                                        Address:  <b><%=pd.R_Address1 %></b><br />
                                                                                        <b><%=pd.R_Address2 %></b><br />
                                                                                        <b><%=pd.R_Address3 %></b><br />
                                                                                        <b><%=pd.R_Address4 %></b><br />
                                                                                        <b><%=pd.R_Address5 %></b><br />
                                                                                        <b><%=pd.R_State%></b><br />
                                                                                        <b><%=pd.R_Pin %></b><br />
                                                                                        <b><%=pd.R_Country%></b><br />
                                                                                    </p>
                                                                                    <br />
                                                                                    <p>
                                                                                        Your order will be completed in 2 Working days. In case you have any query, kindly call us on
                                                                                    <br />
                                                                                        <a href="tel:01204322456">(0120) 432-2456</a><br />
                                                                                        <a href="tel:919650606247">+91 9650606247</a><br />
                                                                                        <a href="tel:918826693260">+91 8826693260</a><br />
                                                                                        <br />
                                                                                        or write us at
                                                                                    <br />
                                                                                        <a href="mailto:contact@fincomindia.in?subject=<%=Subject%>">contact@fincomindia.in</a>.
                                                                                    </p>
                                                                                    <p>Your Order Number is:<b><%=pd.OrderNumber%></b></p>
                                                                                    <div id="div2" runat="server" visible="false">
                                                                                        <p>
                                                                                            <br />
                                                                                            As chosen by you, kindly courier the documents to our address below:
                                                                                        </p>
                                                                                        <b>Garg Shekhar & Company</b><br/>
                                                                                        T - 5, Third Floor,<br/>
                                                                                        Above Croma Showroom,<br/>
                                                                                        Aditya City Centre,<br/>
                                                                                        Indirapuram,<br/>
                                                                                        Ghaziabad – 201014<br/>
                                                                                    </div>
                                                                                    <br />
                                                                                    <p>
                                                                                        Thanking You<br />
                                                                                        Team Fin Com India
                                                                                    </p>
                                                                                </div>
                                                                                <div id="divTANTransaction" runat="server" visible="false">
                                                                                    <br /><br />
                                                                                    <p>Dear <b><%=td.Name1%></b></p>
                                                                                    <p>We thank you for choosing our services.</p>
                                                                                    <p>This is to confirm that we have successfully received your request for Tax Deduction Account Number.</p>
                                                                                    <p>
                                                                                        <br />
                                                                                        The summary of your order is as below:
                                                                                    </p>
                                                                                    <p>Name:<b><%=td.Name1%></b></p>
                                                                                    
                                                                                    <p>
                                                                                        Address:  <b><%=td.O_Address1 %></b><br />
                                                                                        <b><%=td.O_Address2 %></b><br />
                                                                                        <b><%=td.O_Address3 %></b><br />
                                                                                        <b><%=td.O_Address4 %></b><br />
                                                                                        <b><%=td.O_Address5 %></b><br />
                                                                                        <b><%=td.O_State%></b><br />
                                                                                        <b><%=td.O_Pin %></b><br />
                                                                                        <b><%=td.O_Country%></b><br />
                                                                                    </p>
                                                                                    <br />
                                                                                    <p>
                                                                                        Your order will be completed in 2 Working days. In case you have any query, kindly call us on
                                                                                    <br />
                                                                                        <a href="tel:01204322456">(0120) 432-2456</a><br />
                                                                                        <a href="tel:919650606247">+91 9650606247</a><br />
                                                                                        <a href="tel:918826693260">+91 8826693260</a><br />
                                                                                        <br />
                                                                                        or write us at
                                                                                    <br />
                                                                                        <a href="mailto:contact@fincomindia.in?subject=<%=Subject%>">contact@fincomindia.in</a>.
                                                                                    </p>
                                                                                    <p>Your Order Number is:<b><%=pd.OrderNumber%></b></p>
                                                                                    <div id="div3" runat="server" visible="false">
                                                                                        <p>
                                                                                            <br />
                                                                                            As chosen by you, kindly courier the documents to our address below:
                                                                                        </p>
                                                                                        <b>Garg Shekhar & Company</b><br/>
                                                                                        T - 5, Third Floor,<br/>
                                                                                        Above Croma Showroom,<br/>
                                                                                        Aditya City Centre,<br/>
                                                                                        Indirapuram,<br/>
                                                                                        Ghaziabad – 201014<br/>
                                                                                    </div>
                                                                                    <br />
                                                                                    <p>
                                                                                        Thanking You<br />
                                                                                        Team Fin Com India
                                                                                    </p>
                                                                                </div>

                                                                                <div id="divDSCInvoice" runat="server" visible="false">
                                                                                    <p>Dear <b><% =DT.ApplicantName %></b></p>
                                                                                    <br />
                                                                                    <p>We thank you for choosing our services.</p>
                                                                                    <p>
                                                                                        Kindly find attached herewith the Invoice for your payment towards the Digital Signature Certificate.
                                                                                    </p>
                                                                                    <br />
                                                                                    <p>
                                                                                        <a href="<% =invoiceLink%>" target="_blank">Get your invoice</a>
                                                                                    </p>
                                                                                    <br />
                                                                                    <p>
                                                                                        In case you have any query kindly call us on
                                                                                                    <br />
                                                                                        <a href="tel:01204322456">(0120) 432-2456</a><br />
                                                                                        <a href="tel:919650606247">+91 9650606247</a><br />
                                                                                        <a href="tel:918826693260">+91 8826693260</a><br />
                                                                                        or write us at
                                                                                                    <br />
                                                                                        <a href="mailto:contact@fincomindia.in">contact@fincomindia.in</a>
                                                                                    </p>
                                                                                    <br />
                                                                                    <br />
                                                                                    <p>
                                                                                        Thanking You
                                                                                        <br />
                                                                                        Team Fin Com India
                                                                                    </p>
                                                                                </div>
                                                                                <div id="divDSCDocuments" runat="server" visible="false">
                                                                                    <p>Dear <b><% =DT.ApplicantName%>"</b></p>
                                                                                    <br />
                                                                                    <p>We thank you for choosing our services.</p>
                                                                                    <p>
                                                                                        Our representative will call you shortly for collecting the documents .
                                                                                    </p>
                                                                                    <br />
                                                                                    <p>
                                                                                        You can reach us on this no <a href="tel:01204322456">(0120) 432-2456</a><br />
                                                                                        <br />
                                                                                        or write us at <a href="mailto:contact@fincomindia.in">contact@fincomindia.in</a>.
                                                                                    </p>
                                                                                    <br />
                                                                                    <br />
                                                                                    <p>
                                                                                        Thanking You<br />
                                                                                        Team Fin Com India
                                                                                    </p>
                                                                                </div>
                                                                                <div id="divDSCnoDocReceived" runat="server" visible="false">
                                                                                    <p>Dear <b><% =DT.ApplicantName %></b></p>
                                                                                    <br />
                                                                                    <br />
                                                                                    <p>We thank you for choosing our services</p>
                                                                                    <p style="text-align: justify;">As chosen by yourself, you are required to send the documents regarding the DSC for <b><%=Global.GetText((ClassType)DT.ClassType) %></b>. We havent received the required documents yet. This is to put to your kind knowledge that the DSC may get inactivated in case we don’t get the required documents in time.</p>
                                                                                    <p>kindly courier the documents to our address below:</p>
                                                                                    <p>Garg Shekhar & Company,</p>
                                                                                    <p>T - 5, Third Floor,</p>
                                                                                    <p>Above Croma Showroom,</p>
                                                                                    <p>Aditya City Centre,</p>
                                                                                    <p>Indirapuram,</p>
                                                                                    <p>Ghaziabad – 201014</p>
                                                                                    <p>
                                                                                        In case you have any query, you can reach us on this no.<br />
                                                                                        <a href="tel:01204322456">(0120) 432-2456</a><br />
                                                                                        <a href="tel:919650606247">+91 9650606247</a><br />
                                                                                        <a href="tel:918826693260">+91 8826693260</a><br />
                                                                                        or mail us at
                                                                                    <br />
                                                                                        <a href="mailto:contact@fincomindia.in">contact@fincomindia.in</a>.
                                                                                    </p>
                                                                                    <p>
                                                                                        Thanking You<br />
                                                                                        Team Fin Com India
                                                                                    </p>
                                                                                </div>
                                                                                <div id="divDSCCourier" runat="server" visible="false">
                                                                                    <p>Dear <b><% =DT.ApplicantName %> </b></p>
                                                                                    <br />
                                                                                    <p>Great News!</p>
                                                                                    <p>
                                                                                        Your package with tracking no. <b><% =DT.BillNo %></b> on <b><% =DT.Company%></b> Courier Service is dispatched.As per your requirement, we are sending you Digital Signature certificate
                                                                                    </p>
                                                                                    <br />
                                                                                    <br />
                                                                                    <p>Also you can <a href="#">Track your order here</a></p>
                                                                                    <br />
                                                                                    <br />
                                                                                    <p><b>What now?</b></p>
                                                                                    <p><b>1) Keep an eye on your package using the tracking details below:</b></p>
                                                                                    <p>Courier Partner: BlueDart </p>
                                                                                    <p>Tracking Website: <a href="http://www.bluedart.com" target="_blank">www.bluedart.com</a></p>
                                                                                    <p>Tracking Number*:<% =DT.BillNo%></p>
                                                                                    <p><i>* Tracking number may take up to 24 hours for activation. In case of any delays over expected dispatch or delivery date, we will inform you on your email & mobile phone.</i></p>
                                                                                    <br />
                                                                                    <p><b>2) Delivery attempt :</b> ON or BEFORE the delivery date. In case, you happen to miss our delivery, do not worry! Another attempt will be made in the next 24 hours</p>
                                                                                    <p><b>3) We will <b>deliver</b> your order in the <b>shortest possible time.</b> However, if you want the package at a later date, you can convey the same to our delivery executive once he gets in touch with you.</b></p>
                                                                                    <p>Also you can reach us on  <a href="tel:01204322456">(0120) 432-2456</a> or write us at <a href="mailto:contact@fincomindia.in">contact@fincomindia.in</a>.</p>
                                                                                    <br />
                                                                                    <br />
                                                                                    <p>Thanks for choosing fincomindia </p>
                                                                                    <br />
                                                                                    <br />
                                                                                    <p>
                                                                                        Thanking You<br />
                                                                                        Team Fin Com India
                                                                                    </p>
                                                                                </div>
                                                                                <div id="divDSCIncomplete" runat="server" visible="false">
                                                                                    <p>Dear <b><% =DT.ApplicantName %></b></p>
                                                                                    <p>Thank you for considering us!</p>
                                                                                    <br />
                                                                                    <p>We found that you have could not successfully complete your transaction at <a href="http://fincomindia.in">www.fincomindia.in</a></p>
                                                                                    <br />
                                                                                    <p>Kindly let us know the problem that you encountered. We would be happy to assist you in this matter. For any assistance you can call us on <a href="tel:01204322456">(0120) 432-2456</a>, <a href="tel:919650606247">+91 9650606247</a>, <a href="tel:918826693260">+91 8826693260</a> or write us at <a href="mailto:contact@fincomindia.in">contact@fincomindia.in</a>.</p>
                                                                                    <br />
                                                                                    <br />
                                                                                    <p>
                                                                                        Thanking You<br />
                                                                                        Team Fin Com India
                                                                                    </p>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr style="height: 100px; vertical-align: top; background-color: #f5f5f5">
                                                <td colspan="2" style="border-top: 2px solid #f1f1f1">
                                                    <table style="font: inherit; font-size: 11px; margin-top: 5px; border-spacing: 0; border-collapse: collapse; margin-left: 5px; width: 100%">
                                                        <tbody>
                                                            <tr style="vertical-align: top">
                                                                <td>Fin Com India, T - 5, Aditya City Centre, Vaibhav Khand, Indirapuram, Ghaziabad - 201014, UP, India | <a href="http://www.fincomindia.in" style="text-decoration: none; color: #4c90fe" target="_blank">FinComIndia.in</a>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <asp:Literal ID="ltMailContent" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
<div style="text-align: center;">
            <asp:Button ID="btnSendMail" runat="server" Text="Send Mail" OnClick="btnSendMail_Click" CssClass="btn btn-info" />
        </div>
<input id="hidEmail" type="hidden" runat="server" />
<input id="hidName" type="hidden" runat="server" />