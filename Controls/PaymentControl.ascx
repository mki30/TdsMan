<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PaymentControl.ascx.cs" Inherits="WebUserControl" %>
<script type="text/javascript">
    //function ShowProgress()
    //{
    //    $("#paymentForm").html("<div style='text-align:center;width:100%;'><img src='../Images/progress2.gif'/></div>");
    //}
</script>
<div class="panel panel-primary" id="divPayment">
    <div class="panel-heading">
        <asp:Label ID="lblPaymentHeadText" runat="server" Text="Online Payment"></asp:Label>
    </div>
    <table id="paymentForm" class="table BorderLess">
        <tr>
            <td>Amount :</td>
            <td>
                <asp:TextBox ID="txtPaymentAmount" runat="server" AutoCompleteType="None" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Card No</td>
            <td>
                <input type="text" id="Text1" autocomplete="off" maxlength="17" size="19" value="" oncontextmenu="return false" class="form-control" placeholder="Card number"></td>
            <td style="text-align: left;">
                <img src="../Images/visamaster.png" style="height: 30px;" /></td>
        </tr>
        <tr>
            <td>Expiry date</td>
            <td>
                <select name="card_expiration_month" id="Select1" class="form-control">
                    <option value="">Month</option>
                    <option value="01">01 </option>
                    <option value="02">02 </option>
                    <option value="03">03 </option>
                    <option value="04">04 </option>
                    <option value="05">05 </option>
                    <option value="06">06 </option>
                    <option value="07">07 </option>
                    <option value="08">08 </option>
                    <option value="09">09 </option>
                    <option value="10">10 </option>
                    <option value="11">11 </option>
                    <option value="12">12 </option>
                </select>
            </td>
            <td>
                <select name="card_expiration_year" id="Select2" class="form-control" style="width: 100px;">
                    <option value="">Year</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                    <option value="2031">2031</option>
                    <option value="2032">2032</option>
                    <option value="2033">2033</option>
                    <option value="2034">2034</option>
                    <option value="2035">2035</option>
                    <option value="2036">2036</option>
                    <option value="2037">2037</option>
                    <option value="2038">2038</option>
                    <option value="2039">2039</option>
                    <option value="2040">2040</option>
                    <option value="2041">2041</option>
                    <option value="2042">2042</option>
                    <option value="2043">2043</option>
                    <option value="2044">2044</option>
                    <option value="2045">2045</option>
                    <option value="2046">2046</option>
                    <option value="2047">2047</option>
                    <option value="2048">2048</option>
                    <option value="2049">2049</option>
                    <option value="2050">2050</option>
                    <option value="2051">2051</option>
                    <option value="2052">2052</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Card holder</td>
            <td>
                <input type="text" name="bill_name" id="Text2" value="" maxlength="28" placeholder="Name as on card" class="form-control" autocomplete="off"></td>
            <td></td>
        </tr>
        <tr>
            <td>CVV</td>
            <td>
                <input type="password" maxlength="4" name="cvv_code" id="Password1" value="" size="4" autocomplete="off" placeholder="CVV" class="form-control"></td>
            <td style="text-align: left;">The 3 digit number printed on the back of the card</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnPay" runat="server" Text="Pay" OnClientClick="ShowProgress();" OnClick="btnPay_Click" CssClass="btn btn-success" />
            </td>
        </tr>
    </table>
    <div style="width:100%;text-align:center"><asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></div>
</div>

