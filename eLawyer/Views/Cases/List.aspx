<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<eLawyer.Models.vw_CaseLists>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Case List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; border: none;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="text-align: left; border: none;">
                <h2>
                    Case List</h2>
            </td>
            <td style="text-align: right; border: none;">
                <%: Html.ActionLink("Enroll New Case", "Create") %>
            </td>
        </tr>
    </table>
    <div id="Mainpg">
        <% using (Html.BeginForm())
           {%>
        <div style="height: auto; border: 1px solid #c3c3c3; padding: 3px;">
            <%string searchText = string.Empty;
              if (ViewData["SearchText"] != null)
                  searchText = ViewData["SearchText"] as string;
            %>
            Search Cases:
            <%:Html.TextBox("txtSearchText", searchText)%>&nbsp;<input type="submit" value="Search Case" />
        </div>
        <%} %>
        <div style="border: 1px solid #c3c3c3; margin-top: 5px; padding: 1px;" id="divCaseList">
            <table class="GridView">
                <tr>
                    <th>
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
                        Court/Judge
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
                <tr id="tr<%:item.ID %>">
                    <td>
                        <img src="../../images/del.png" id="imgDeleteCase_<%: item.ID%>" alt="" title="Delete"
                            onclick="return DeleteCase(<%: item.ID%>)" />
                        <a href="/Cases/Edit/<%:item.ID%>">
                            <img src="../../Images/Pencil-icon.png" id="imgEdit_<%: item.ID%>" alt="" title="Edit"
                                style="border-style: none;" />
                        </a>
                        <%--  <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.ID })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>--%>
                    </td>
                    <td>
                        <%:item.Nature %>
                    </td>
                    <td>
                        <%: item.CaseNumber%>
                    </td>
                    <td style="width: 80px">
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
                    <td style="width: 80px">
                        <%: String.Format("{0:dd/MM/yyyy}", item.NextDate)%>
                    </td>
                    <td style="width: 100px">
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
    </div>
    <script type="text/javascript">
        function DeleteCase(i) {
            if (!confirm("Are You Sure to delete this Case?")) {
                return false;
            }

            $.ajax({
                type: "POST",
                url: "/Cases/Delete/",
                data: { "id": i },
                success: function (data) {
                    //alert("Deleted" + i + " data" + data);
                    $("#tr" + i).hide();
                },
                failure: function (response) {
                    alert(response);
                }
            });
        }
    </script>
</asp:Content>
