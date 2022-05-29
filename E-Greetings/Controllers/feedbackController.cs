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
    public class feedbackController : Controller
    {
        private db_egreetingcardEntities1 db = new db_egreetingcardEntities1();

        // GET: feedback
        public ActionResult Index()
        {
            return View(db.tb_feedback.ToList());
        }
        // GET: feedback/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_feedback tb_feedback = db.tb_feedback.Find(id);
            if (tb_feedback == null)
            {
                return HttpNotFound();
            }
            return View(tb_feedback);
        }

        // POST: feedback/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tb_feedback tb_feedback = db.tb_feedback.Find(id);
            db.tb_feedback.Remove(tb_feedback);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Index(string search)
        {
            var res = db.tb_feedback.Where(x => x.FD_email.Contains(search) || x.FD_reaction.Contains(search)).ToList();
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
