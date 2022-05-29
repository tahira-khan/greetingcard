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
    public class categoryController : Controller
    {
        private db_egreetingcardEntities1 db = new db_egreetingcardEntities1();

        // GET: category
        public ActionResult Index()
        {
            return View(db.tb_category.ToList());
        }

        // GET: category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_category tb_category = db.tb_category.Find(id);
            if (tb_category == null)
            {
                return HttpNotFound();
            }
            return View(tb_category);
        }

        // GET: category/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "c_id,c_categoryname")] tb_category tb_category)
        {
            if (ModelState.IsValid)
            {
                db.tb_category.Add(tb_category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tb_category);
        }

        // GET: category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_category tb_category = db.tb_category.Find(id);
            if (tb_category == null)
            {
                return HttpNotFound();
            }
            return View(tb_category);
        }

        // POST: category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "c_id,c_categoryname")] tb_category tb_category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tb_category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tb_category);
        }

        // GET: category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_category tb_category = db.tb_category.Find(id);
            if (tb_category == null)
            {
                return HttpNotFound();
            }
            return View(tb_category);
        }

        // POST: category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tb_category tb_category = db.tb_category.Find(id);
            db.tb_category.Remove(tb_category);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Index(string search)
        {
            var res = db.tb_category.Where(x => x.c_categoryname.Contains(search)).ToList();
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
