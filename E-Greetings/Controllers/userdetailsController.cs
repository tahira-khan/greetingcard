using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using E_Greetings.Models;

namespace E_Greetings.Controllers
{
    public class userdetailsController : Controller
    {
        private db_egreetingcardEntities1 db = new db_egreetingcardEntities1();

        // GET: userdetails
        public ActionResult Index()
        {
            var tb_userdetails = db.tb_userdetails.Include(t => t.tb_roles);
            return View(tb_userdetails.ToList());
        }

        // GET: userdetails/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_userdetails tb_userdetails = db.tb_userdetails.Find(id);
            if (tb_userdetails == null)
            {
                return HttpNotFound();
            }
            return View(tb_userdetails);
        }

        // GET: userdetails/Create
        public ActionResult Create()
        {
            ViewBag.u_role_id = new SelectList(db.tb_roles, "r_id", "r_group");
            return View();
        }

        // POST: userdetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "U_id,U_fname,U_lname,U_email,U_pass,U_country,U_number,u_role_id")] tb_userdetails tb_userdetails)
        {
            if (ModelState.IsValid)
            {
                db.tb_userdetails.Add(tb_userdetails);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.u_role_id = new SelectList(db.tb_roles, "r_id", "r_group", tb_userdetails.u_role_id);
            return View(tb_userdetails);
        }

        // GET: userdetails/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_userdetails tb_userdetails = db.tb_userdetails.Find(id);
            if (tb_userdetails == null)
            {
                return HttpNotFound();
            }
            ViewBag.u_role_id = new SelectList(db.tb_roles, "r_id", "r_group", tb_userdetails.u_role_id);
            return View(tb_userdetails);
        }

        // POST: userdetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "U_id,U_fname,U_lname,U_email,U_pass,U_country,U_number,u_role_id")] tb_userdetails tb_userdetails)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tb_userdetails).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.u_role_id = new SelectList(db.tb_roles, "r_id", "r_group", tb_userdetails.u_role_id);
            return View(tb_userdetails);
        }

        // GET: userdetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_userdetails tb_userdetails = db.tb_userdetails.Find(id);
            if (tb_userdetails == null)
            {
                return HttpNotFound();
            }
            return View(tb_userdetails);
        }

        // POST: userdetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tb_userdetails tb_userdetails = db.tb_userdetails.Find(id);
            db.tb_userdetails.Remove(tb_userdetails);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Index(string search)
        {
            var res = db.tb_userdetails.Where(x =>  x.U_country.Contains(search) || x.U_email.Contains(search) || x.U_fname.Contains(search) || x.U_lname.Contains(search) || x.U_number.Contains(search)).ToList();
            return View(res);
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
