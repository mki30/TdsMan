<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="TANApplicationForm.aspx.cs" Inherits="TANApplicationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table class="table BorderLess">
       <tr>
          <td colspan=2>don`t know ao details? <a href="/tan2/servlet/tanaosearch" target="new">click here</a></td>
       </tr>
        <tr>
                <td colspan=2>
                        <b>assessing officer code (tds / tcs)</b>
                </td>
        </tr>
        <tr>
                <td>
                        area code
                </td>
                <td>
                        <input type="text" name="tan_area_cd" value="" maxlength="3" size="5">
                </td>
        </tr>
        <tr>
                <td>
                        ao type
                </td>
                <td>
                        <input type="text" name="tan_ao_typ" value="" maxlength="2" size="5">
                </td>
        </tr>
        <tr>
                <td>
                        range code
                </td>
                <td>
                        <input type="text" name="tan_rng_cd" value="" maxlength="3" size="5">
                </td>
        </tr>
        <tr>
                <td>
                        ao number
                </td>
                <td>
                        <input type="text" name="tan_ao_num" value="" maxlength="2" size="5">
                </td>
        </tr>
  </table>

  <table class="table BorderLess">
        <tr><td>&nbsp;</td></tr>
        <tr>
                <td>
                        <b>sir,</b><br>
                        whereas i/we am/are liable to deduct/collect or deduct tax and collect tax in accordance with chapter xvii under the heading 'b - deduction at source' or 'bb - collection at source' of the income-tax act, 1961;<br>
                        and whereas no tax deduction account number/tax collection account number or tax deduction account number and tax collection account number has been allotted to me/us;<br>
                        i/we give below the necessary particulars:
                </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
  </table>


  <table class="table BorderLess">
    <input type="hidden" name="tan_cat_ddr_cd" value="a">
    <tr>
      <td colspan=2>
        <b><font color=red>*</font><b> 1. name </b> &nbsp;
      </td>
    </tr>
      <tr>
        <td colspan=2><b>(a) central / state government: </b></td>
      </tr>
      
      <tr>
        <td colspan=2>
          <table>
            <tr>
              <td><i><b>select appropriate category: </b></i> central government &nbsp;<input type=radio name="tan_sub_cat_ddr" value="1" >&nbsp;
                state government &nbsp;<input type="radio" name="tan_sub_cat_ddr" value="2" >&nbsp;
                local authority (central government) &nbsp;<input type="radio" name="tan_sub_cat_ddr" value="3" >&nbsp;
                local authority (state government)&nbsp;<input type="radio" name="tan_sub_cat_ddr" value="4" >&nbsp;
              </td>
            </tr>
          </table>
        </td>
      </tr>
      
      <tr>
        <td><b> name of office</b> </td>
        <td><input type="text" size="75" maxlength=75 name="tan_off_nm" value=""></td>
      </tr>
      
      <tr>
        <td><b> name of organisation</b></td>
        <td><input type="text" name="tan_orgn_nm" value="" size="50" maxlength=75></td>
      </tr>
      
      <tr>
        <td><b> name of department</b> </td>
        <td><input type="text" name="tan_dept_nm" value="" size="25" maxlength=75></td>
      </tr>
      
      <tr>
        <td><b>name of ministry</b> </td>
      <td><input type="text" name="tan_ministry_nm" value="" size="25" maxlength=75></td>
    </tr>
    
    <tr>
      <td><b>designation of the person responsible for making the payment/collecting tax</b> </td>
      <td><input type="text" name="tan_desg_res_per" value="" size="50" maxlength=50></td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0><b> (b) statutory /autonomous bodies </b></font>
      </td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
          <i>select appropriate category :</i>
          statutory body &nbsp;&nbsp; autonomous body
        </font>
      </td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> name of office</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> name of organisation</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b>designation of  the person responsible for making the payment/collecting tax</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
        <b> (c) company </b>
        <i>[this column is appliacable only if single tan is applied for the whole company.if seperate tan is applied for different division/branches, please fill details in (d)'branch /division of a company' only.]</i>
        </font>
      </td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
          <i>select appropriate category: </i>
          central government company / corporation established by central act &nbsp;
          state government company / corporation established by state act &nbsp;
          other company
        </font>
      </td>
    </tr>
    <tr>
      <td colspan=2><font color=#a0a0a0d0d0d0><b>title</b> (m/s) tick if applicable</font></td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b>name of company </b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b>designation of the  person responsible for making the payment/collecting tax</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan=2><font color=#a0a0a0d0d0d0><b> (d) branch/division of a company: </b></font></td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
        <b>select appropriate category: </b>
        central government company / corporation established by central act &nbsp;
        state government company / corporation established by state act &nbsp;
        other company
        </font>
      </td>
    </tr>
    <tr><td colspan=2><font color=#a0a0a0d0d0d0><b> title</b> (m/s) tick if applicable</font></td></tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> name of company </b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> name of division</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> name / location of branch</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b>designation of the person responsible for making the payment/collecting tax</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
          <i>select appropriate category: </i>
          <b> (e) individual / hindu undidvded family (karta) - </b>
          <i>[for branch of individual business / hindu undivided family (karta), please fill details in (f)]</i>
        </font>
      </td>
    </tr>
    <tr>
      <td colspan=2><font color=#a0a0a0d0d0d0>individual &nbsp; hindu undivided family</font></td>
    </tr>
    <tr>
      <td colspan=2><font color=#a0a0a0d0d0d0><b>title (in case of individuals only)</b>&nbsp;&nbsp; shri smt. kumari</font></td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> last name / surname</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> first name </b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> middle name </b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
          <b> (f) branch of individual bussiness (sole proprietorship concern) / hindu undivided family (karta) </b>
        </font>
      </td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
          branch of individual bussiness &nbsp;
          branch of hindu undivided family
        </font>
      </td>
    </tr>
    <tr>
      <td colspan=2><font color=#a0a0a0d0d0d0><b>title (in case of individuals only)</b>&nbsp;&nbsp; shri smt. kumari </font></td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> last name/ surname </b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> first name</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> middle name</b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b> name / location of branch </b></font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
          <b> (g) firm / association of persons / association of persons (trusts) / body of individuals / artificial juridical person: </b>
          <i>(for branch of firm / aop / aop (trust) / boi / artificial juridical person, please fill details in (h) only.)</i>
        </font>
      </td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0> name </font></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan=2>
        <font color=#a0a0a0d0d0d0>
          <b> (h) branch of firm / association of persons / association of persons(trusts) / body of individuals / artificial juridical person: </b>
        </font>
      </td>
    </tr>
    <tr>
      <td>
        <font color=#a0a0a0d0d0d0>
          name of firm / association of persons / association of persons (trusts) / body of individuals / artificial juridical person:
        </font>
      </td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font color=#a0a0a0d0d0d0><b>name / location of branch </b></font></td>
      <td>&nbsp;</td>
    </tr>

  <tr>
    <td colspan="2"><font color="red">*</font><b>2.</b> &nbsp; <b> address</b></td>
  </tr>
  <tr>
    <td><b>flat / door / block no.</b> </td>
    <td><input type="text" name="tan_addr1" value="" size="25" maxlength="25"></td>
  </tr>
  <tr>
    <td><b>name of premises / building / village</b> </td>
    <td><input type="text" name="tan_addr2" value="" size="25" maxlength="25"></td>
  </tr>
  <tr>
    <td><b>road / street / lane / post office</b> </td>
    <td><input type="text" name="tan_addr3" value="" size="25" maxlength="25"></td>
  </tr>
  <tr>
    <td><b> area / locality / taluka / sub-division</b> </td>
    <td><input type="text" name="tan_addr4" value="" size="25" maxlength="25"></td>
  </tr>
  <tr>
    <td><b>town / city / district </b></td>
    <td><input type="text" name="tan_addr5" value="" size="25" maxlength="25"></td>
  </tr>
  <tr>
    <td><b>state / union territory</b> </td>
    <td>
      <select name=tan_state>
      <option value="" >-- please select --
      <option value="1" > andaman & nicobar islands
      <option value="2" > andhra pradesh
      <option value="3" > arunachal pradesh
      <option value="4" > assam
      <option value="5" > bihar
      <option value="6" > chandigarh
      <option value="33" > chhattisgarh
      <option value="7" > dadara & nagar haveli
      <option value="8" > daman & diu
      <option value="9" > delhi
      <option value="10" > goa
      <option value="11" > gujarat
      <option value="12" > haryana
      <option value="13" > himachal pradesh
      <option value="14" > jammu & kashmir
      <option value="35" > jharkhand
      <option value="15" > karnataka
      <option value="16" > kerala
      <option value="17" > lakhswadeep
      <option value="18" > madhya pradesh
      <option value="19" > maharashtra
      <option value="20" > manipur
      <option value="21" > meghalaya
      <option value="22" > mizoram
      <option value="23" > nagaland
      <option value="24" > orissa
      <option value="25" > pondicherry
      <option value="26" > punjab
      <option value="27" > rajasthan
      <option value="28" > sikkim
      <option value="29" > tamil nadu
      <option value="36" > telangana
      <option value="30" > tripura
      <option value="31" > uttar pradesh
      <option value="34" > uttaranchal
      <option value="32" > west bengal
      </select>
    </td>
  </tr>
  <tr>
    <td><b>pin code </b> </td>
    <td><input type="text" name="tan_pin" value="" size="6" maxlength="6"></td>
  </tr>
  
  
  <tr>
    <td><b>telephone number</b> </td>
    <td>
      &nbsp;&nbsp; std code &nbsp;&nbsp;<input type="text" name="tan_std" value="" size="7" maxlength="7">
      &nbsp;&nbsp; telephone number &nbsp;&nbsp;<input type="text" name="tan_phone" value="" size="13" maxlength="13">
    </td>
  </tr>
  
  
  <tr>
    <td><font color="red">*</font><b> e-mail ids</b> </td>
    <td>
      &nbsp;a)&nbsp;&nbsp; <input type="text" name="tan_email1" value="" size="50" maxlength="50">
    </td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
    <td>
      &nbsp;b)&nbsp&nbsp; <input type="text" name="tan_email2" value="" size="50" maxlength="50">
    </td>
  </tr>
  
  <tr>
    <td><font color="red">*</font><b>3.</b> &nbsp; <b> nationality of deductor</b> </td>
    <td>
        indian <input type="radio" name="tan_nationality" value="0"  >
        &nbsp;&nbsp;
        foreign <input type="radio" name="tan_nationality" value="1"  >
    </td>
  </tr>
  
  
  <tr>
    <td><b>4. permanent account number (pan) </b> <i>(specify wherever applicable) </i> </td>
    <td><input type="text" name="tan_pan_num" value="" size="15" maxlength="10"></td>
  </tr>
  
  <tr>
    <td><b>5. existing tax deduction account number (tan)</b> <i>(if any)</i>
    </td>
    <td>
       <input type="text" name="tan_tax_ddr_num" value="" size="15" maxlength="16">
    </td>
  </tr>

  

  <tr>
    <td><b>6. existing tax collection account number (tcs)</b> <i>(if any)</i>
    </td>
    <td>
       <input type="text" name="tan_tax_col_num" value="" size="15" maxlength="16">
    </td>
  </tr>

  
  
  
  <tr>
    <td colspan=2>
      i/we, <input type=text name="tan_veri_nm" value="" length=75 maxlength=75> in my/our capacity as <input type=text name="tan_veri_cap" value="" length=75 maxlength=75> do hereby declare that what is stated above is true to the best of my/our knowledge and belief.
    </td>
  </tr>
  <tr>
    <td valign=top colspan=2>
      <table cellpadding=0 cellspacing=0 border=0>
        <tr>
          <td valign=bottom>verified today </td>
          <td width=5><br></td>
          <td valign=bottom><font size=-1>dd</font><br>18 - </td>
          <td valign=bottom><font size=-1>mm</font><br>04 - </td>
          <td valign=bottom><font size=-1>yyyy</font><br>2015 &nbsp;</td>
          <td valign=bottom>&nbsp;&nbsp; at <input type=text name="tan_veri_plc" value="" length=75 maxlength=75></td>
        </tr>
      </table>
      <input type=hidden name=tan_veri_dd value="18">
      <input type=hidden name=tan_veri_mm value="04">
      <input type=hidden name=tan_veri_yyyy value="2015">
    </td>
  </tr>
</table>
<table border="1">
  <tr>
    <td colspan=3><font color="red">*</font><b>payment details</b> <i>(select appropriate mode of payment and fill relevant details)</i></td>
  <tr>
  <tr>
    <td colspan=3>demand draft/cheque <i>(in favour of 'nsdl - tin' for <img height = 11 src = "/tan/images/rp.png" width = 10> 62)</i></td>
  </tr>
  <tr>
    <td valign=top>
      <input type="radio" name="tan_pay_mode" id="tan_pay_mode" value="d"  onclick="changestatus('tan_dd_', false); changestatus('tan_chq_', true)">
    </td>
    <td colspan=2>
      <b>demand draft </b>number &nbsp;&nbsp;<input type=text name=tan_dd_num id="d" value=""  size=14 maxlength=14>&nbsp;&nbsp;
      dated
      <font size=-1>dd</font>
         <select name=tan_dd_dt_dd id="select1" >
           <option value="" >
           <option value="01" > 1
           <option value="02" > 2
           <option value="03" > 3
           <option value="04" > 4
           <option value="05" > 5
           <option value="06" > 6
           <option value="07" > 7
           <option value="08" > 8
           <option value="09" > 9
           <option value="10" > 10
           <option value="11" > 11
           <option value="12" > 12
           <option value="13" > 13
           <option value="14" > 14
           <option value="15" > 15
           <option value="16" > 16
           <option value="17" > 17
           <option value="18" > 18
           <option value="19" > 19
           <option value="20" > 20
           <option value="21" > 21
           <option value="22" > 22
           <option value="23" > 23
           <option value="24" > 24
           <option value="25" > 25
           <option value="26" > 26
           <option value="27" > 27
           <option value="28" > 28
           <option value="29" > 29
           <option value="30" > 30
           <option value="31" > 31
         </select>

      <font size=-1>mm</font>
         <select name=tan_dd_dt_mm id="select2" >
           <option value="" >
           <option value="01" > jan
           <option value="02" > feb
           <option value="03" > mar
           <option value="04" > apr
           <option value="05" > may
           <option value="06" > jun
           <option value="07" > jul
           <option value="08" > aug
           <option value="09" > sep
           <option value="10" > oct
           <option value="11" > nov
           <option value="12" > dec
         </select>

      <font size=-1> yyyy</font>
      <input type=text name=tan_dd_dt_yyyy id="text1" value=""  size=4 maxlength=4 >
    for <b><img height = 11 src = "/tan/images/rp.png" width = 10>  62 &nbsp;&nbsp; </b>
      <br>drawn on &nbsp;&nbsp;<input type=text name=tan_dd_bank_nm id="text2" value=""  size=50 maxlength=50 >&nbsp;&nbsp;
      <b>payable at mumbai.</b>
    </td>
  </tr>
  <tr>
    <td valign=top>
     <input type="radio" name="tan_pay_mode" id="radio1" value="c"  onclick="changestatus('tan_dd_', true); changestatus('tan_chq_', false)">
    </td>
    <td>
      <b>cheque </b>number &nbsp;&nbsp;<input type=text name=tan_chq_num id="c" value=""  size=14 maxlength=14 >&nbsp;&nbsp;
      dated
      <font size=-1>dd</font>
         <select name=tan_chq_dt_dd id="select3" >
           <option value="" >
           <option value="01" > 1
           <option value="02" > 2
           <option value="03" > 3
           <option value="04" > 4
           <option value="05" > 5
           <option value="06" > 6
           <option value="07" > 7
           <option value="08" > 8
           <option value="09" > 9
           <option value="10" > 10
           <option value="11" > 11
           <option value="12" > 12
           <option value="13" > 13
           <option value="14" > 14
           <option value="15" > 15
           <option value="16" > 16
           <option value="17" > 17
           <option value="18" > 18
           <option value="19" > 19
           <option value="20" > 20
           <option value="21" > 21
           <option value="22" > 22
           <option value="23" > 23
           <option value="24" > 24
           <option value="25" > 25
           <option value="26" > 26
           <option value="27" > 27
           <option value="28" > 28
           <option value="29" > 29
           <option value="30" > 30
           <option value="31" > 31
         </select>

      <font size=-1>mm</font>
         <select name=tan_chq_dt_mm id="select4" >
           <option value="" >
           <option value="01" > jan
           <option value="02" > feb
           <option value="03" > mar
           <option value="04" > apr
           <option value="05" > may
           <option value="06" > jun
           <option value="07" > jul
           <option value="08" > aug
           <option value="09" > sep
           <option value="10" > oct
           <option value="11" > nov
           <option value="12" > dec
         </select>

      <font size=-1> yyyy</font>
      <input type=text name="tan_chq_dt_yyyy" id="text3" value=""  size=4 maxlength=4>
      for <b> <img height = 11 src = "/tan/images/rp.png" width = 10> 62&nbsp;&nbsp;</b>
      <br>drawn on &nbsp;&nbsp;
      <input type=text name=tan_chq_bank_nm id="text4" value=""  size=50 maxlength=50>&nbsp;&nbsp;bank, deposited at hdfc bank,
      <input type=text name=tan_chq_branch id="text5" value=""  size=50 maxlength=50> branch at,
      <input type=text name=tan_chq_location id="text6" value=""  size=50 maxlength=50> location (city/town).
    </td>
  </tr>
</table>
<input type="hidden" name="tan_start_time" value="2015041809:24:11" >
<table>
<tr>
   <td colspan=3>
     <input type=submit name=submit value="submit" >
   </td>
</tr>
</table>

</asp:Content>

