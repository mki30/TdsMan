<%@ Page Title="Return Filing" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ReturnFiling.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="row-fluid" style="padding: 15px;">
        <div class="col-md-3 list-group">
           
            <a class="divider" href="#">Returns</a>
            <a class="list-group-item" href="/RegularReturns.aspx?formtype=24Q"><i class="glyphicon glyphicon-check"></i>&nbsp;Form 24Q</a>
            <a class="list-group-item" href="/RegularReturns.aspx?formtype=26Q"><i class="glyphicon glyphicon-check"></i>&nbsp;Form 26Q</a>

            <a class="divider" href="#">Masters</a>
            <a class="list-group-item" href="/CompanyPage.aspx"><i class="glyphicon glyphicon-plus"></i>&nbsp;Company</a>
            <a class="list-group-item" href="/DeducteeList.aspx"><i class="glyphicon glyphicon-plus"></i>&nbsp;Deductee</a>
            <a class="list-group-item" href="/EmployeeList.aspx"><i class="glyphicon glyphicon-plus"></i>&nbsp;Employee</a>
            <a class="divider" href="#">Corrections</a> 
            <a class="list-group-item" href="/ImportDataForCorrection.aspx"><i class="glyphicon glyphicon-plus"></i>&nbsp;Import Data For Correction</a>
            <a class="list-group-item" href="/MakeCorrections.aspx"><i class="glyphicon glyphicon-plus"></i>&nbsp;Make Corrections</a>
             <a class="divider" href="#">Tools</a>
            <a class="list-group-item" href="/incexp.aspx"><i class="glyphicon glyphicon-check"></i>&nbsp;Advance Tax Estimate</a>
            <a class="list-group-item" href="/employeesal.aspx"><i class="glyphicon glyphicon-check"></i>&nbsp;Salary Calculator</a>
        </div>

        <div class="col-md-3 list-group">
            <a class="divider" href="#">Reports</a>
            <a class="list-group-item" href="/ReportQuarterWise.aspx?type=1"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Company</a>
            <a class="list-group-item" href="/ReportQuarterWise.aspx?type=2"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Challan</a>
            <a class="list-group-item" href="/ReportQuarterWise.aspx?type=3"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Employee</a>
            <a class="list-group-item" href="/ReportQuarterWise.aspx?type=4"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Salary Detail</a>
            <a class="list-group-item" href="/ReportQuarterWise.aspx?type=5"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Salary Yearly</a>
            <a class="list-group-item" href="/ReportQuarterWise.aspx?type=6"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Return</a>
        </div>
        <div class="col-md-3 list-group">
            <a class="divider" href="#">Traces file request</a>
            <a class="list-group-item" href="/tracespanextractor.aspx"><i class="glyphicon glyphicon-saved"></i>&nbsp;Pan Name Extractor</a>
            <a class="list-group-item" href="/tracesrequest.aspx?type=tdsfile"><i class="glyphicon glyphicon-saved"></i>&nbsp;TDS File Online</a>
            <a class="list-group-item" href="/tracesrequest.aspx?type=form16-a"><i class="glyphicon glyphicon-saved"></i>&nbsp;Form16 A</a>
            <a class="list-group-item" href="/tracesrequest.aspx?type=form16-part-a"><i class="glyphicon glyphicon-saved"></i>&nbsp;Form16 Part-A</a>
            <a class="list-group-item" href="/tracesrequest.aspx?type=form27d"><i class="glyphicon glyphicon-saved"></i>&nbsp;Form 27D</a>
            <a class="list-group-item" href="/tracesrequest.aspx?type=default-justification"><i class="glyphicon glyphicon-saved"></i>&nbsp;Defaults/Justification Report</a>
            <a class="list-group-item" href="/tracesrequest.aspx?type=tanpanfiles"><i class="glyphicon glyphicon-saved"></i>&nbsp;TAN/PAN File</a>
            <a class="list-group-item" href="/tracesview.aspx?type=downloadrequestedfile"><i class="glyphicon glyphicon-saved"></i>&nbsp;Download Requested Files</a>

            <a class="list-group-item" href="/tracesview.aspx?type=validate197cirtificate"><i class="glyphicon glyphicon-saved"></i>&nbsp;Validate 197 Certificate</a>
        </div>
        <div class="col-md-3">
            <div class="col-md-12 list-group">
                <a class="divider" href="#">NSDL view</a>
                <a class="list-group-item" href="/viewbininformationonline.aspx"><i class="glyphicon glyphicon-saved"></i>&nbsp;Bin Information Online</a>
                <a class="list-group-item" href="/viewchallaninformationonline.aspx"><i class="glyphicon glyphicon-saved"></i>&nbsp;Challan Information Online</a>
                <a class="list-group-item" href="/viewreturnstatusonline.aspx"><i class="glyphicon glyphicon-saved"></i>&nbsp;Return Status Online</a>
            </div>
            <div class="col-md-12 list-group">
                <a class="divider" href="#">Traces view</a>
                <a class="list-group-item" href="/tracesview.aspx?type=statementstatus"><i class="glyphicon glyphicon-saved"></i>&nbsp;Statement Status</a>
                <a class="list-group-item" href="/tracesview.aspx?type=challanstatus"><i class="glyphicon glyphicon-saved"></i>&nbsp;Challan Status</a>
                <a class="list-group-item" href="/tracesview.aspx?type=tdstcscredit"><i class="glyphicon glyphicon-saved"></i>&nbsp;TDS/TCS Credit</a>
            </div>
            <div class="col-md-12 list-group">
                <a class="divider" href="#">Downloads</a>
                <a class="list-group-item" href="/download.aspx?type=justification-report-generation-utility"><i class="glyphicon glyphicon-saved"></i>&nbsp;Download PDF Converter Utility to Generate TDS Certificate</a>
                <a class="list-group-item" href="/download.aspx?type=traces-pdf-convertor-27d"><i class="glyphicon glyphicon-saved"></i>&nbsp;Download Justification report Generation Utility</a>
                <a class="list-group-item" href="/download.aspx?type=traces-pdf-converterv1.3l.zip"><i class="glyphicon glyphicon-saved"></i>&nbsp;Download PDF Converter Utility to Generate 27D</a>
            </div>
        </div>
    </div>
</asp:Content>

