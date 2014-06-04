<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<eLawyer.Models.vw_ClientList>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        List</h2>
    <table class="GridView">
        <tr>
            <th>
            </th>
            <th>
                Name
            </th>
            <th>
                Address
            </th>
            <th>
                Phone
            </th>
            <th>
                Email
            </th>
            <th>
                Website
            </th>
            <th>
                Created
                <br />
                Last Updated
            </th>
            <th>
                Contract Period
            </th>
        </tr>
        <% if (Model != null && Model.Count() > 0)
           {
               foreach (var item in Model)
               { %>
        <tr>
            <td>
                <%--  <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %>
                |
                <%: Html.ActionLink("Details", "Details", new { id=item.Id })%>
                |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.Id })%>--%>
            </td>
            <td>
                <%: item.Name%>
            </td>
            <td>
                <%: item.Lane%>
                <%: item.Street%><br />
                <%: item.City%>
                <%: item.StateName%>
                <%: item.CountryName%><br />
                <%: item.Zip%>
            </td>
            <td>
                <%: item.Phone1%>
                <%: item.Phone2%>
                <br />
                <%: item.Cell%>
            </td>
            <td>
                <%: item.Email%>
            </td>
            <td>
                <%: item.Website%>
            </td>
            <td>
                <%: String.Format("{0:MM/dd/yyyy}", item.ContractStartDate)%>
                <br />
                to
                <br />
                <%: String.Format("{0:MM/dd/yyyy}", item.ContractEndDate)%>
            </td>
            <td>
                <%: String.Format("{0:MM/dd/yyyy}", item.CreateDate)%>
                <br />
                <%: String.Format("{0:MM/dd/yyyy}", item.LastUpdated)%>
            </td>
        </tr>
        <% }
           }
           else
           { %>
        <tr>
            <td colspan="8" class="NoRecordFound">
                No Client found.
            </td>
        </tr>
        <%} %>
    </table>
    <p>
        <%: Html.ActionLink("New Advocate", "Create") %>
    </p>
</asp:Content>
