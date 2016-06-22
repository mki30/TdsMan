<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateForm27A.aspx.cs" Inherits="GenerateForm27A" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            /*font-family:Arial;
            font-size:13px;*/
        }
        .borderedtable
        {
            border: 1px solid black;
            border-collapse: collapse;
        }
        .borderedtable td
        {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%; border:0px solid black;padding:0px;">
                <tr>
                    <td></td>
                    <td colspan="4" style="text-align:center;"><b>Form No. 27A</b></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">Form for furnishing information with the statement of deduction / collection of tax at source ( tick whichever is applicable ) filed on computer media for the period</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4" style="text-align:center;">(From _ _ / _ _ / _ _ to _ _ / _ _ / _ _ (dd/mm/yy)#</td>
                </tr>
                <tr>
                    <td><b>1</b></td>
                    <td>( a )   Tax Deduction Account No.</td>
                    <td>
                        <asp:TextBox ID="txtDeductorTAN" runat="server"></asp:TextBox>
                    </td>
                    <td>( d )  Financial Year </td>
                    <td>
                        <asp:TextBox ID="txtFinancialYear" runat="server"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td></td>
                    <td>( b )   Permanent Account No.</td>
                    <td>
                        <asp:TextBox ID="txtDeductorPAN" runat="server"></asp:TextBox>
                        
                    </td>
                    <td>( e )  Assessment year </td>
                    <td>
                        <asp:TextBox ID="txtAssessmentYear" runat="server"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>( c )   Form No.   </td>
                    <td></td>
                    <td>( f )   Previous receipt number </td>
                    <td>
                        <asp:TextBox ID="txtPrvReturnTokenNo" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><b>2</b></td>
                    <td colspan="2">Particulars of the deductor / collector</td>
                    <%--<td></td>--%>
                    <td colspan="2"><b>3</b>   Name of the person responsible for deduction / collection of tax</td>
                    <%--<td></td>--%>
                </tr>
                <tr>
                    <td><b></b></td>
                    <td colspan="2" style="width:48%;">
                        <table style="border: 1px solid black; width: 100%;"  class='borderedtable'>
                            <tr>
                                <td>(a) Name</td>
                                <td><asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>(b) Type of deductor* </td>
                                <td><asp:Label ID="lblDeductorType" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>(c)  Branch / division (if any)</td>
                                <td><asp:Label ID="lblBranch" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>(d) Address</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Flat No.</td>
                                <td><asp:Label ID="lblFlatNo" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Name of the premises / building</td>
                                <td><asp:Label ID="lblBuilding" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Road / street / lane</td>
                                <td><asp:Label ID="lblStreet" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Area / location</td>
                                <td><asp:Label ID="lblArea" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Town / City / District</td>
                                <td><asp:Label ID="lblCity" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td><asp:Label ID="lblState" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Pin code</td>
                                <td><asp:Label ID="lblPin" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Telephone No.</td>
                                <td><asp:Label ID="lblTel" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>E-mail</td>
                                <td><asp:Label ID="lblEmial" runat="server" Text=""></asp:Label></td>
                            </tr>

                        </table>
                    </td>
                    
                    <td colspan="2" style="vertical-align: top; width:48%;">
                        <table style="width: 100%;" class="borderedtable">
                            <tr>
                                <td>(a)Name</td>
                                <td>
                                    <asp:Label ID="lblRPName" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>(b)  Address</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Flat No.</td>
                                <td><asp:Label ID="lblRPFlatNo" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Name of the premises / building</td>
                                <td><asp:Label ID="lblRPBuilding" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Road / street / lane</td>
                                <td><asp:Label ID="lblRPStreet" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Area / location</td>
                                <td><asp:Label ID="lblRPArea" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Town / City / District</td>
                                <td><asp:Label ID="lblRPTown" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td><asp:Label ID="lblRPState" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Pin code</td>
                                <td><asp:Label ID="lblRPPin" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Telephone No.</td>
                                <td><asp:Label ID="lblRPTel" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>E-mail</td>
                                <td><asp:Label ID="lblRPEmail" runat="server" Text=""></asp:Label></td>
                            </tr>
                        </table>

                    </td>
                    
                </tr>
                <tr>
                    <td><b>4</b></td>
                    <td colspan="4">Controls Total</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">
                        <table class="borderedtable">
                            <tr>
                                <td>Sr No</td>
                                <td>Return Type(Regular / Correction type)</td>
                                <td>No Of Deductee/Party Records</td>
                                <td>Amount Payed</td>
                                <td>Tax Deducted/Collection</td>
                                <td>Tax Deposited/Total Challan Amount</td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblSrNO" runat="server" Text="1"></asp:Label></td>
                                <td></td>
                                <td><asp:Label ID="lblNoOfDeductee" runat="server" Text=""></asp:Label></td>
                                <td><asp:Label ID="lblAmountPayed" runat="server" Text=""></asp:Label></td>
                                <td><asp:Label ID="lblTaxDed" runat="server" Text=""></asp:Label></td>
                                <td><asp:Label ID="lblTaxDeposited" runat="server" Text=""></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr>
                    <td><b>5</b></td>
                    <td colspan="2">Total Number of Annexures enclosed</td><td colspan="2"><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><b>6</b></td>
                    <td colspan="2">Other Information</td><td colspan="2"><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4" style="text-align:center;"><b>VERIFICATION</b></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">
                        <table>
                            <tr>
                                <td>I,<asp:Label ID="lblDeclarePerson" runat="server" Text=""></asp:Label>, hereby certify that all the particulars furnished above are correct and complete.I,  , hereby certify that all the particulars furnished above are correct and complete.</td>
                            </tr>
                            <tr>
                                <td><span style="margin-right: 200px;">Place :<asp:Label ID="lblPlace" runat="server" Text=""></asp:Label></span>Signature of person responsible for deducting / collecting tax at source__________</td>
                            </tr>
                            <tr>
                                <td><span style="margin-right: 200px;">Date :<asp:Label ID="lblDate" runat="server" Text=""></asp:Label></span>Name and designation of person responsible for deducting / collecting tax at source_________</td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">* Mention type of deductor - Government or Other</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
