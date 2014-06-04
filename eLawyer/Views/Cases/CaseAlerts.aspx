<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<eLawyer.Models.vw_CaseLists>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Case Alerts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        var chkCount = 0;
        var chkSelectedCount = 0;
        $(document).ready(function () {

            $("#select_all").click(function () {
                $(".chkSelectedCase").prop("checked", this.checked);
            });

            $(".chkSelectedCase").click(function () {

                if ($(".chkSelectedCase").length == $(".chkSelectedCase:checked").length) {
                    $("#select_all").attr("checked", "checked");
                    $("#select_all").prop("checked", true);
                } else {
                    $("#select_all").removeAttr("checked");
                    $("#select_all").prop("checked", false);
                }
            });
        });
    </script>
    <table style="width: 100%; border: none;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="text-align: left; border: none;">
                <h2>
                    Case Alerts</h2>
            </td>
            <td style="text-align: right; border: none;">
                <%: Html.ActionLink("Case List", "List") %>&nbsp;|&nbsp;<%: Html.ActionLink("Enroll New Case", "Create") %>
            </td>
        </tr>
    </table>
    <% using (Html.BeginForm())
       {%>
    <div style="width: 100%; height: auto; border: 1px solid #c3c3c3; padding: 3px;">
        <%string fromDate = string.Empty; string toDate = string.Empty;
          if (ViewData["FromDate"] != null) fromDate = ViewData["FromDate"] as string;
          if (ViewData["ToDate"] != null) toDate = ViewData["ToDate"] as string;
        %>
        From
        <%:Html.TextBox("DateFrom", fromDate, new { @class = "datepicker" })%>
        &nbsp; From
        <%:Html.TextBox("ToDate", toDate, new { @class = "datepicker" })%>
        &nbsp;
        <input type="submit" class="submit" id="btnSubmit" value="Search" />
    </div>
    <%} %>
    <div style="width: 100%; border: 1px solid #c3c3c3; margin-top: 5px; padding: 3px;">
        <table class="GridView">
            <tr>
                <th>
                    <input type="checkbox" id="select_all" />
                </th>
                <th>
                    Nature
                </th>
                <th>
                    Case Number
                </th>
                <th>
                    Enrollment Date
                </th>
                <th>
                    Court / Judge
                </th>
                <th>
                    First Party
                </th>
                <th>
                    Second Party
                </th>
                <th>
                    Status
                </th>
                <th>
                    Next Date
                </th>
                <th>
                    My Client
                </th>
            </tr>
            <% if (Model != null && Model.Count() > 0)
               {
                   foreach (var item in Model)
                   { %>
            <tr>
                <td>
                    <%--  <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.ID })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>--%>
                    <input type="checkbox" id="chk<%:item.ID %>" class="chkSelectedCase" />
                </td>
                <td>
                    <%:item.Nature %>
                </td>
                <td>
                    <%: item.CaseNumber%>
                </td>
                <td>
                    <%: String.Format("{0:dd/MM/yyyy}", item.EnrollmentDate)%>
                </td>
                <td>
                    <%: item.CourtName%><br />
                    <%: item.JudgeName%>
                </td>
                <td>
                    <%: item.FirstParty%>
                </td>
                <td>
                    <%: item.SecondParty%>
                </td>
                <td>
                    <%: item.Status%>
                </td>
                <td>
                    <%: String.Format("{0:dd/MM/yyyy}", item.NextDate)%>
                </td>
                <td>
                    <%if (item.IsFromFirstParty == true)
                      { %>
                    First Party
                    <%}
                      else
                      { %>
                    Second Party<%} %>
                </td>
            </tr>
            <% }
               }
               else
               { %>
            <tr>
                <td colspan="10" class="NoRecordFound">
                    No Case found for given criteria.
                </td>
            </tr>
            <%} %>
        </table>
    </div>
</asp:Content>
