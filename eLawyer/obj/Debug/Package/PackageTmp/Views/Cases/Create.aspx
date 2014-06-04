<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eLawyer.Models.Cases>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Enroll New Case
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; border: none;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="text-align: left; border: none;">
                <h2>
                    Enroll New Case</h2>
            </td>
            <td style="text-align: right; border: none;">
                <%: Html.ActionLink("Case List", "List") %>&nbsp;|&nbsp;<%: Html.ActionLink("Case Hearings", "NewHearing") %>
            </td>
        </tr>
    </table>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <table width="100%" border="0">
        <tr>
            <td colspan="2">
                Case Nature<br />
                <%:Html.DropDownListFor(model => model.CaseNatureId, (IEnumerable<SelectListItem>)ViewData["CaseNatures"], "Select", new { @class = "selectNone", @id = "caseNatureId" })%>
                <%: Html.ValidationMessageFor(model => model.CaseNatureId)%>
            </td>
        </tr>
        <tr>
            <td>
                <%: Html.LabelFor(model => model.CaseNumber) %><br />
                <%: Html.TextBoxFor(model => model.CaseNumber) %>
                <%: Html.ValidationMessageFor(model => model.CaseNumber) %>
            </td>
            <td>
                <%: Html.LabelFor(model => model.EnrollmentDate) %><br />
                <%: Html.TextBoxFor(model => model.EnrollmentDate, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.EnrollmentDate) %>
            </td>
        </tr>
        <tr>
            <td>
                <%: Html.LabelFor(model => model.CourtName) %><br />
                <%: Html.TextBoxFor(model => model.CourtName) %>
                <%: Html.ValidationMessageFor(model => model.CourtName) %>
            </td>
            <td>
                <%: Html.LabelFor(model => model.JudgeName) %><br />
                <%: Html.TextBoxFor(model => model.JudgeName) %>
                <%: Html.ValidationMessageFor(model => model.JudgeName) %>
            </td>
        </tr>
        <tr>
            <td>
                <strong>First Party</strong>
                <div style="text-align: left; padding: 5px; width: 98%;">
                    Name<br />
                    <%: Html.TextBoxFor(model => model.FirstParty) %>
                    <%: Html.ValidationMessageFor(model => model.FirstParty) %>
                    <br />
                    Address<br />
                    <%: Html.TextAreaFor(model => model.FirstPartyAddress, new { @class = "address" })%>
                    <%: Html.ValidationMessageFor(model => model.FirstPartyAddress) %><br />
                    Phone<br />
                    <%: Html.TextBoxFor(model => model.FirstPartyPhone) %>
                    <%: Html.ValidationMessageFor(model => model.FirstPartyPhone) %>
                </div>
            </td>
            <td>
                <strong>Second Party</strong>
                <div style="text-align: left; padding: 5px; width: 98%;">
                    Name<br />
                    <%: Html.TextBoxFor(model => model.SecondParty) %>
                    <%: Html.ValidationMessageFor(model => model.SecondParty) %>
                    <br />
                    Address<br />
                    <%: Html.TextAreaFor(model => model.SecondPartyAddress, new { @class = "address" })%>
                    <%: Html.ValidationMessageFor(model => model.SecondPartyAddress) %><br />
                    Phone<br />
                    <%: Html.TextBoxFor(model => model.SecondPartyPhone) %>
                    <%: Html.ValidationMessageFor(model => model.SecondPartyPhone) %>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                My Client
            </td>
            <td>
                <input type="radio" name="rdoMyClient" value="First" checked="checked" />First Party
                <input type="radio" name="rdoMyClient" value="Second" />
                Second Party
            </td>
        </tr>
        <tr>
            <td>
                First Party Label Alias<br />
                <%: Html.TextBoxFor(model => model.FirstPartyAliase)%>
                <%: Html.ValidationMessageFor(model => model.FirstPartyAliase)%>
            </td>
            <td>
                Second Party Label Alias<br />
                <%: Html.TextBoxFor(model => model.SecondPartyAliase)%>
                <%: Html.ValidationMessageFor(model => model.SecondPartyAliase)%>
            </td>
        </tr>
        <tr>
            <td>
                <%: Html.LabelFor(model => model.FirstHearingDate) %><br />
                <%: Html.TextBoxFor(model => model.FirstHearingDate, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.FirstHearingDate) %>
            </td>
            <td>
                <%: Html.LabelFor(model => model.NextDate) %><br />
                <%: Html.TextBoxFor(model => model.NextDate, new {@class="datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.NextDate) %>
            </td>
        </tr>
        <tr>
            <td>
                <%: Html.LabelFor(model => model.Status) %>
            </td>
            <td>
                <%: Html.TextBoxFor(model => model.Status) %>
                <%: Html.ValidationMessageFor(model => model.Status) %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <%: Html.LabelFor(model => model.Description) %><br />
                <%: Html.TextAreaFor(model => model.Description, new { @class = "Description" })%>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right;">
                <input type="submit" value="Enrroll Case" />
            </td>
        </tr>
    </table>
    <% } %>
</asp:Content>
