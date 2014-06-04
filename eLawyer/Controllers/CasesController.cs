using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eLawyer.Models;

namespace eLawyer.Controllers
{
    public class CasesController : Controller
    {
        //
        // GET: /Cases/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Cases/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Cases/Create
        [Authorize]
        public ActionResult Create()
        {
            ViewData["CaseNatures"] = Utilities.GetCaseNatureNameList();
            return View();
        }

        //
        // POST: /Cases/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection, Cases newCase, string rdoMyClient)
        {
            ViewData["CaseNatures"] = Utilities.GetCaseNatureNameList();
            try
            {
                // TODO: Add insert logic here
                if (!string.IsNullOrEmpty(rdoMyClient))
                {
                    if ("first".Equals(rdoMyClient.ToLower()))
                        newCase.IsFromFirstParty = true;
                    else
                        newCase.IsFromSecondParty = false;
                }
                if (ModelState.IsValid)
                    if (CourtCaseModels.EnrollNewCase(newCase) > 0)
                        return RedirectToAction("List");

                return View();

                //return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Cases/Edit/5

        public ActionResult Edit(int id)
        {
            ViewData["CaseNatures"] = Utilities.GetCaseNatureNameList();
            return View();
        }

        //
        // POST: /Cases/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Cases/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        //
        // POST: /Cases/Delete/5

        [HttpPost]
        public int Delete(int id)
        {
            int result = CourtCaseModels.DeleteCaseById(id);
            return result;
        }

        [HttpPost]
        public int DeleteHearing(int id)
        {
            int result = CourtCaseModels.DeleteCaseHearingById(id);
            return result;
        }

        [Authorize]
        public ActionResult List()
        {
            ViewData.Model = CourtCaseModels.GetCaseList(null);
            return View();
        }

        [HttpPost]
        public ActionResult List(FormCollection form)
        {
            string searchText = string.Empty;
            if (!string.IsNullOrEmpty(form["txtSearchText"]))
            {
                searchText = form["txtSearchText"] as string;
                ViewData["SearchText"] = searchText;
                ViewData.Model = CourtCaseModels.GetSearchedCaseList(searchText);
            }
            else
                ViewData.Model = CourtCaseModels.GetCaseList(null);
            return View();
        }

        [Authorize]
        public ActionResult CaseAlerts()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            ViewData["FromDate"] = fromDate.ToString("MM/dd/yyyy");
            ViewData["ToDate"] = toDate.ToString("MM/dd/yyyy");

            if (Session["ClientId"] != null)
                ViewData.Model = CourtCaseModels.GetCaseAlerts(fromDate, toDate, (int)Session["ClientId"]);
            else
                ViewData.Model = CourtCaseModels.GetCaseAlerts(fromDate, toDate, null);
            return View();
        }

        [HttpPost]
        public ActionResult CaseAlerts(FormCollection form)
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            if (form["DateFrom"] != null)
                fromDate = Convert.ToDateTime(form["DateFrom"].ToString());
            if (form["ToDate"] != null)
                toDate = Convert.ToDateTime(form["ToDate"].ToString());

            ViewData["FromDate"] = fromDate.ToString("MM/dd/yyyy");
            ViewData["ToDate"] = toDate.ToString("MM/dd/yyyy");

            if (Session["ClientId"] != null)
                ViewData.Model = CourtCaseModels.GetCaseAlerts(fromDate, toDate, (int)Session["ClientId"]);
            else
                ViewData.Model = CourtCaseModels.GetCaseAlerts(fromDate, toDate, null);

            return View();
        }

        [Authorize]
        public ActionResult NewHearing(int? id)
        {
            if (id != null)
            {
                vw_CaseLists caseDetails = CourtCaseModels.GetCaseDetailsByCaseId((int)id);
                ViewData["CaseDetails"] = caseDetails;
                ViewData["Hearings"] = CourtCaseModels.GetCaseHearingListByCaseId(((int)id));
            }
            return View();
        }

        [HttpPost]
        public ActionResult NewHearing(string Submit, FormCollection form, CaseHearings newHearing)
        {
            string searchText = string.Empty;
            vw_CaseLists oldCase = new vw_CaseLists();
            if (!string.IsNullOrEmpty(form["txtSearchText"]))
            {
                searchText = form["txtSearchText"] as string;
                ViewData["SearchText"] = searchText;
                // ViewData.Model = CourtCaseModels.GetSearchedCaseList(searchText);
                oldCase = CourtCaseModels.GetCaseDetailsByCaseNumber(searchText);
                if (oldCase != null)
                {
                    if (!string.IsNullOrEmpty(Submit))
                    {
                        ViewData["CaseDetails"] = oldCase;
                        switch (Submit.ToLower())
                        {
                            case "search":
                                ViewData["Hearings"] = CourtCaseModels.GetCaseHearingListByCaseId(oldCase.ID);
                                break;
                            case "save new hearing":
                                newHearing.CaseId = oldCase.ID;
                                //ViewData["Hearings"] = CourtCaseModels.GetCaseHearingListByCaseId(oldCase.ID);
                                int result = CourtCaseModels.CreateNewCaseHearing(newHearing);
                                ViewData["Hearings"] = CourtCaseModels.GetCaseHearingListByCaseId(oldCase.ID);
                                break;
                        }
                    }
                }
            }
            return View();
        }

        public ActionResult EditHearing(int? id)
        {
            CaseHearings caseHearing = CourtCaseModels.GetCaseHearingById((int)id);
            if (caseHearing != null)
            {
                vw_CaseLists caseDetails = CourtCaseModels.GetCaseDetailsByCaseId((int)caseHearing.CaseId);
                ViewData["CaseDetails"] = caseDetails;
            }
            ViewData.Model = caseHearing;
            return View();
        }

        [HttpPost]
        public ActionResult EditHearing(FormCollection form, CaseHearings newHearing)
        {
            if (ModelState.IsValid)
            {
                int result = CourtCaseModels.UpdateCaseHearing(newHearing);
            }
            if (newHearing != null)
            {
                vw_CaseLists caseDetails = CourtCaseModels.GetCaseDetailsByCaseId((int)newHearing.CaseId);
                ViewData["CaseDetails"] = caseDetails;
                int result = CourtCaseModels.UpdateCaseHearing(newHearing);
                if (result > 0)
                    return RedirectToAction("NewHearing", new { @id = caseDetails.ID });
            }
            return View();
        }
    }
}
