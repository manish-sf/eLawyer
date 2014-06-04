<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<eLawyer.Models.CaseHearings>>" %>
<table class="GridView">
    <tr>
        <th>
        </th>
        <th>
            Hearing Date
        </th>
        <th>
            MyRemarks
        </th>
        <th>
            Next Date
        </th>
        <th>
            Descriptions
        </th>
    </tr>
    <%if (Model != null && Model.Count() > 0)
      {
          foreach (var item in Model)
          { %>
    <tr>
        <td>
            <%--  <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %>
            |
            <%: Html.ActionLink("Details", "Details", new { id=item.ID })%>
            |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>--%>
            <img src="../../images/del.png" id="imgDeleteCaseHearing_<%: item.ID%>" alt="" title="Delete"
                onclick="return DeleteCaseHearing(<%: item.ID%>)" />
            <a href="/Cases/EditHearing/<%:item.ID%>">
                <img src="../../Images/Pencil-icon.png" id="imgEdit_<%: item.ID%>" alt="" title="Edit"
                    style="border-style: none;" />
        </td>
        <td>
            <%: String.Format("{0:dd/MM/yyy}", item.HearingDate)%>
        </td>
        <td>
            <%: item.MyRemarks%>
        </td>
        <td>
            <%: String.Format("{0:dd/MM/yyyy}", item.NextDate)%>
        </td>
        <td>
            <%: item.Descriptions%>
        </td>
    </tr>
    <% }
      }
      else
      { %>
    <tr>
        <td colspan="5" class="NoRecordFound">
            No Record Found.
        </td>
    </tr>
    <%} %>
</table>
