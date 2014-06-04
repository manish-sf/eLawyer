using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using eLawyer.Models;
using System.Web.Security;
namespace eLawyer.Controllers
{
    public class AdvocateController : Controller
    {
        [Authorize(Roles = "SuperAdmin")]
        public ActionResult Index(int? id)
        {
            if (id != null)
            {
                Session["ClientId"] = id;
                ViewData["ClientName"] = AdvocateModels.GetClientDetailsById((int)id).Name ?? null;
            }
            return View();
        }


        public ActionResult ClientLogoLoader(int id)
        {
            Clients oldclient = AdvocateModels.GetClientById(id);
            if (oldclient != null && oldclient.Logo != null)
            {
                var q = oldclient.Logo;

                byte[] cover = q;
                // byte[] studentPhoto = StudentModels.GetStudentPhoto(id);

                if (cover != null)
                    return File(cover, "image/jpg");
            }
            return null;
        }
        [Authorize(Roles = "SuperAdmin,Admin")]
        public ActionResult Details(int? id)
        {
            if (Session["ClientId"] == null)
            {
                if (Roles.IsUserInRole("SuperAdmin"))
                {
                    Session["ClientId"] = (int)id;
                    ViewData.Model = AdvocateModels.GetClientDetailsById((int)id);
                    return View();
                }
            }
            else
            {
                if (id != null && (int)Session["ClientId"] == (int)id)
                {
                    ViewData.Model = AdvocateModels.GetClientDetailsById((int)id);
                    return View();
                }
            }
            return null;

        }

        //
        // GET: /Client/Create
        [Authorize(Roles = "SuperAdmin")]
        public ActionResult New()
        {
            ViewData["CountryList"] = Utilities.GetCountryList();
            ViewData["StateList"] = Utilities.GetStateList(null);

            return View();
        }

        //
        // POST: /Client/Create

        [HttpPost]
        public ActionResult New(FormCollection collection, Clients client, HttpPostedFileBase agentPhoto)
        {
            ViewData["CountryList"] = Utilities.GetCountryList();
            ViewData["StateList"] = Utilities.GetStateList(null);

            try
            {
                if (!ModelState.IsValid)
                {
                    ApplicationMessages msg = new ApplicationMessages("Invalid entry.", MessageType.Error);

                    ViewData["Message"] = msg;
                    return View();
                }
                // TODO: Add insert logic here
                if (client != null)
                {
                    client.LastUpdated = DateTime.Now;
                    client.AdminstratorId = 1;
                }
                if (agentPhoto != null)
                {
                    if (agentPhoto.ContentLength > 0)
                    {
                        Int32 length = agentPhoto.ContentLength;
                        byte[] tempImage = new byte[length];
                        agentPhoto.InputStream.Read(tempImage, 0, length);
                        client.Logo = tempImage;// file.InputStream;
                        client.ContentType = agentPhoto.ContentType;
                    }
                }
                if (AdvocateModels.CreateClient(client) > 0)
                {
                    ApplicationMessages msg = new ApplicationMessages("New Advocate saved successfully.", MessageType.Success);
                    ViewData["Message"] = msg;
                    return RedirectToAction("List");
                }
                else
                    return View();
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Client/Edit/5
        [Authorize(Roles = "SuperAdmin,Admin")]
        public ActionResult Edit()
        {
            if (Session["ClientId"] != null)
            {
                ViewData.Model = AdvocateModels.GetClientById((int)Session["ClientId"]);
                ViewData["CountryList"] = Utilities.GetCountryList();
                ViewData["StateList"] = Utilities.GetStateList(null);

            }
            return View();
        }

        //
        // POST: /Client/Edit/5

        [HttpPost]
        public ActionResult Edit(FormCollection collection, Clients client, HttpPostedFileBase agentPhoto)
        {

            int id = 0;
            if (Session["ClientId"] != null)
            {
                ViewData["CountryList"] = Utilities.GetCountryList();
                ViewData["StateList"] = Utilities.GetStateList(null);
                id = (int)Session["ClientId"];
            }
            if (!ModelState.IsValid)
                return View(client);
            if (agentPhoto != null)
            {
                if (agentPhoto.ContentLength > 0)
                {
                    Int32 length = agentPhoto.ContentLength;
                    byte[] tempImage = new byte[length];
                    agentPhoto.InputStream.Read(tempImage, 0, length);
                    client.Logo = tempImage;// file.InputStream;
                    client.ContentType = agentPhoto.ContentType;
                }
            }
            if (AdvocateModels.UpdateClient(id, client) > 0)
            {
                return RedirectToAction("Details", new { @id = id });
            }
            return View(client);
        }

        //
        // GET: /Client/
        [Authorize(Roles = "SuperAdmin")]
        public ActionResult List()
        {
            Session["ClientId"] = null;
            Session["ZoneId"] = null;
            Session["RegionId"] = null;
            Session["BranchId"] = null;
            ViewData.Model = AdvocateModels.GetClients();
            return View();
        }

    }
}
