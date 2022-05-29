using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using E_Greetings.Models;
using System.IO;

namespace E_Greetings.Controllers
{
    public class cardsController : Controller
    {
        private db_egreetingcardEntities1 db = new db_egreetingcardEntities1();

        // GET: cards
        public ActionResult Index()
        {
            var tb_cards = db.tb_cards.Include(t => t.tb_category);
            return View(tb_cards.ToList());
        }

        // GET: cards/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_cards tb_cards = db.tb_cards.Find(id);
            if (tb_cards == null)
            {
                return HttpNotFound();
            }
            return View(tb_cards);
        }

        // GET: cards/Create
        public ActionResult Create()
        {
            ViewBag.ca_fk_c = new SelectList(db.tb_category, "c_id", "c_categoryname");
            return View();
        }

        
        

        // POST: cards/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ca_id,ca_pic,ca_fk_c,ca_name")] tb_cards tb_cards,string file1)
        {

            //if (file1.ContentType == "image/jpg" || file1.ContentType == "image/jpeg" || file1.ContentType == "image/png")
            //{
            //    ViewBag.msg = "uploaded";
            //     string filename = file1.FileName;
            //string folder = @"~\images\cards\";
            //string fullpath = Path.Combine(folder + filename);
            //    file1.SaveAs(Server.MapPath(fullpath));  
                tb_cards.ca_pic = file1;
            if (ModelState.IsValid)
            {
                db.tb_cards.Add(tb_cards);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //}
            //else
            //{
            //    ViewBag.msg = "You can only upload an image.";
            //}
          
         
            

            ViewBag.ca_fk_c = new SelectList(db.tb_category, "c_id", "c_categoryname", tb_cards.ca_fk_c);
            return View(tb_cards);
        }

        // GET: cards/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_cards tb_cards = db.tb_cards.Find(id);
            if (tb_cards == null)
            {
                return HttpNotFound();
            }
            ViewBag.ca_fk_c = new SelectList(db.tb_category, "c_id", "c_categoryname", tb_cards.ca_fk_c);
            return View(tb_cards);
        }

        // POST: cards/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ca_id,ca_pic,ca_fk_c,ca_name")] tb_cards tb_cards)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tb_cards).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ca_fk_c = new SelectList(db.tb_category, "c_id", "c_categoryname", tb_cards.ca_fk_c);
            return View(tb_cards);
        }

        // GET: cards/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_cards tb_cards = db.tb_cards.Find(id);
            if (tb_cards == null)
            {
                return HttpNotFound();
            }
            return View(tb_cards);
        }

        // POST: cards/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tb_cards tb_cards = db.tb_cards.Find(id);
            db.tb_cards.Remove(tb_cards);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Index(string search)
        {
            var res = db.tb_cards.Where(x => x.ca_name.Contains(search)).ToList();
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
