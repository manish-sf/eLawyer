using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eLawyer.Models;
using System.Web.Security;
namespace eLawyer.Controllers
{
    public class PaymentsController : Controller
    {
        //
        // GET: /Payments/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Payments/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Payments/Create

        public ActionResult New()
        {
            int paymentType = (int)PaymentTypes.Income;
            if (Session["ClientId"] != null)
            {
                ViewData["ExpenseHeads"] = Utilities.GetExpenseHeadNameList((int)Session["ClientId"], paymentType);
            }
            else
            {
                if (Roles.IsUserInRole("SuperAdmin"))
                    return RedirectToAction("List", "Client");
            }

            ViewData["PaymentModes"] = Utilities.GetPaymentModesNameList();
            //ViewData["Branchs"] = Utilities.GetBranchNameList();
            return View();

        }

        //
        // POST: /Payments/Create

        [HttpPost]
        public ActionResult New(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Payments/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Payments/Edit/5

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
        // GET: /Payments/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Payments/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [Authorize]
        public ActionResult List()
        {
            return View();
        }

        [HttpPost]
        public ActionResult List(FormCollection form)
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            if (form["DateFrom"] != null)
                fromDate = Convert.ToDateTime(form["DateFrom"].ToString());
            if (form["ToDate"] != null)
                toDate = Convert.ToDateTime(form["ToDate"].ToString());

            ViewData["FromDate"] = fromDate.ToString("MM/dd/yyyy");
            ViewData["ToDate"] = toDate.ToString("MM/dd/yyyy");

            int paymentType = (int)PaymentTypes.Income;
            List<vw_PaymentLists> payments = new List<vw_PaymentLists>();
            if (Session["ClientId"] != null)
            {
                payments = MasterModels.GetPaymentList((int)Session["ClientId"], paymentType, fromDate, toDate);
            }
            else
            {
                if (Roles.IsUserInRole("SuperAdmin"))
                    return RedirectToAction("List", "Client");
            }
            //if (Request.IsAjaxRequest())
            //{
            //    return PartialView("PaymentListUserControl", payments);
            //}
            ViewData.Model = payments;
            return View();
        }


        [Authorize]
        public ActionResult ExpenseList()
        {

            return View();
        }

        [HttpPost]
        public ActionResult ExpenseList(FormCollection form)
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            if (form["DateFrom"] != null)
                fromDate = Convert.ToDateTime(form["DateFrom"].ToString());
            if (form["ToDate"] != null)
                toDate = Convert.ToDateTime(form["ToDate"].ToString());

            ViewData["FromDate"] = fromDate.ToString("MM/dd/yyyy");
            ViewData["ToDate"] = toDate.ToString("MM/dd/yyyy");

            int paymentType = (int)PaymentTypes.Expense;
            List<vw_PaymentLists> payments = new List<vw_PaymentLists>();
            if (Session["ClientId"] != null)
            {
                payments = MasterModels.GetPaymentList((int)Session["ClientId"], paymentType, fromDate, toDate);
            }
            else
            {
                if (Roles.IsUserInRole("SuperAdmin"))
                    return RedirectToAction("List", "Client");

            }
            //if (Request.IsAjaxRequest())
            //{
            //    return PartialView("PaymentListUserControl", payments);
            //}
            ViewData.Model = payments;
            return View();
        }
    }
}
