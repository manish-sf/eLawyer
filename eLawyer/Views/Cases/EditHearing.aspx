﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eLawyer.Models.CaseHearings>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Hearing
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; border: none;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="text-align: left; border: none;">
                <h2>
                    Edit Hearing</h2>
            </td>
            <td style="text-align: right; border: none;">
                <%: Html.ActionLink("Case List", "List") %>&nbsp;|&nbsp;<%: Html.ActionLink("Enroll New Case", "Create") %>
            </td>
        </tr>
    </table>
    <% using (Html.BeginForm())
       {%>
    <% eLawyer.Models.vw_CaseLists currentCase = new eLawyer.Models.vw_CaseLists();
       if (ViewData["CaseDetails"] != null)
       {%>
    <fieldset>
        <legend>Case Details</legend>
        <% currentCase = ViewData["CaseDetails"] as eLawyer.Models.vw_CaseLists;
           if (currentCase != null)
           {
        %>
        <table class="DetailView">
            <tr>
                <td style="width: 200px;">
                    Case Nature
                </td>
                <td>
                    <strong>
                        <%:currentCase.Nature%></strong>
                </td>
            </tr>
            <tr>
                <td style="width: 200px;">
                    Court Name
                </td>
                <td>
                    <strong>
                        <%:currentCase.CourtName%></strong>
                </td>
            </tr>
            <tr>
                <td>
                    Judge Name
                </td>
                <td>
                    <strong>
                        <%:currentCase.JudgeName%></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <% if (!string.IsNullOrEmpty(currentCase.FirstPartyAliase))
                       { %>
                    <%: currentCase.FirstPartyAliase%>
                    <%}
                       else
                       { %>
                    First Party<%} %>
                </td>
                <td>
                    <strong>
                        <%:currentCase.FirstParty%></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <% if (!string.IsNullOrEmpty(currentCase.SecondPartyAliase))
                       { %>
                    <%:currentCase.SecondPartyAliase%>
                    <%}
                       else
                       { %>
                    Second Party<%} %>
                </td>
                <td>
                    <strong>
                        <%:currentCase.SecondParty%></strong>
                </td>
            </tr>
            <tr>
                <td>
                    My Client
                </td>
                <td>
                    <%if (currentCase.IsFromFirstParty == true)
                      { %>
                    <% if (!string.IsNullOrEmpty(currentCase.FirstPartyAliase))
                       { %>
                    <%: currentCase.FirstPartyAliase%>
                    <%}
                       else
                       { %>
                    First Party<%}
                      }
                      else
                      { %>
                    <% if (!string.IsNullOrEmpty(currentCase.SecondPartyAliase))
                       { %>
                    <%:currentCase.SecondPartyAliase%>
                    <%}
                       else
                       { %>
                    Second Party<%}
                      }%>
                </td>
            </tr>
        </table>
        <%}
        %>
    </fieldset>
    <div style="width: 100%; height: auto; border: 1px solid #c3c3c3; padding: 3px;">
        <table width="100%">
            <tr>
                <td>
                    <%: Html.LabelFor(model => model.HearingDate)%><br />
                    <%: Html.TextBoxFor(model => model.HearingDate, new { @class = "datepicker" })%>
                    <%: Html.ValidationMessageFor(model => model.HearingDate)%>
                </td>
                <td>
                    <%: Html.LabelFor(model => model.NextDate)%><br />
                    <%: Html.TextBoxFor(model => model.NextDate, new { @class = "datepicker" })%>
                    <%: Html.ValidationMessageFor(model => model.NextDate)%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%: Html.LabelFor(model => model.MyRemarks)%><br />
                    <%: Html.TextBoxFor(model => model.MyRemarks)%>
                    <%: Html.ValidationMessageFor(model => model.MyRemarks)%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%: Html.LabelFor(model => model.Descriptions)%><br />
                    <%: Html.TextAreaFor(model => model.Descriptions, new {@class="Description" })%>
                    <%: Html.ValidationMessageFor(model => model.Descriptions)%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="Submit" value="Save New Hearing" />
                </td>
            </tr>
        </table>
    </div>
    <% }
       else
       { %>
    <div class="NoRecordFound">
        No Case Found</div>
    <%
       } %>
    <%} %>
</asp:Content>
