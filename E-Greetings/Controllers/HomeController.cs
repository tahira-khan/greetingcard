using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using E_Greetings.Models;
using System.Web.Helpers;
using System.Web.Security;

namespace E_Greetings.Controllers
{
    
    public class HomeController : Controller
    {
        db_egreetingcardEntities1 db = new db_egreetingcardEntities1();
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult About()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Contact(string name, string email, string msg)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string to="msaad2110@gmail.com";
                    WebMail.EnableSsl = true;
                    WebMail.From = to;
                    WebMail.SmtpPort = 587;
                    WebMail.SmtpServer = "smtp.gmail.com";
                    WebMail.UserName = "aptecheproject2019@gmail.com";
                    WebMail.Password = "szi456789";
                    WebMail.SmtpUseDefaultCredentials = true;
                    WebMail.Send(to: to, subject: name, body: msg+email, isBodyHtml: true);
                }

            }
            catch (Exception)
            {

                throw;
            }

            return View();
        }
        [AllowAnonymous]
        public ActionResult Birthday()
        {
            return View(db.tb_cards.ToList().Where(x => x.tb_category.c_id == 1003));
        }
        [AllowAnonymous]
        public ActionResult Festival()
        {
            return View(db.tb_cards.ToList().Where(x => x.tb_category.c_id == 6));
        }
        [AllowAnonymous]
        public ActionResult Newyear()
        {
            return View(db.tb_cards.ToList().Where(x => x.tb_category.c_id == 5));
        }
        [AllowAnonymous]
        public ActionResult Wedding()
        {
            return View(db.tb_cards.ToList().Where(x => x.tb_category.c_id == 4));
        }
        [AllowAnonymous]
        public ActionResult Login_Register()
        {
            return View();
        }
        
        public ActionResult Card(int? id, string ca_pic)
        {
            tb_cards tb_cards = db.tb_cards.Find(id);
            if (Session["User"]!=null)
            {
               

            return View(tb_cards);
            }
            else
            {
                return RedirectToAction("Login_Register");
            }
          
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login_Register([Bind(Include = "U_id,U_fname,U_lname,U_email,U_pass,U_country,U_number,u_role_id")] tb_userdetails tb_userdetails)
        {
            try
            {
                tb_userdetails.u_role_id = 2;
                tb_userdetails.U_pass = Crypto.HashPassword(tb_userdetails.U_pass);
                if (ModelState.IsValid)
                {
                    db.tb_userdetails.Add(tb_userdetails);
                    db.SaveChanges();
                    return RedirectToAction("Login_Register");
                }
                return View(tb_userdetails);
            }
            catch (Exception)
            {
                ViewBag.msg = "Email is already registered";
            }

            return View();
        }
        [AllowAnonymous]
        public ActionResult Login(string email,string password)
        {
            try
            {
                var res = db.tb_userdetails.Where(x => x.U_email == email).SingleOrDefault();
                if (Crypto.VerifyHashedPassword(res.U_pass, password))
                {
                    FormsAuthentication.SetAuthCookie(res.U_fname, false);
                    TempData["u_id"] = res.U_id;
                    Session["User"] = res.U_fname+ " "+res.U_lname;
                    if (res.u_role_id == 2)
                    {
                        
                        TempData["invalid"] = "";
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        TempData["invalid"] = "";
                        return RedirectToAction("Index","Admin");  // admin page
                    }

                }
                else
                {
                    TempData["invalid"] = "Invalid Username/Password";
                    return RedirectToAction("Login_Register");

                }
            }
            catch (Exception)
            {
                TempData["invalid"] = "Invalid Username/Password";
                return RedirectToAction("Login_Register");
            }
            return Redirect(Request.UrlReferrer.PathAndQuery);
        }
        [AllowAnonymous]
        public ActionResult feedback([Bind(Include = "FD_id,FD_reaction,FD_email,FD_message")] tb_feedback tb_feedback, string reaction)
        {
            if (reaction == "1")
            {
                tb_feedback.FD_reaction = "Not Satisfied";
                if (ModelState.IsValid)
                {
                    db.tb_feedback.Add(tb_feedback);
                    db.SaveChanges();
                    //return RedirectToAction("Index");
                }
            }
            else if (reaction == "2")
            {
                tb_feedback.FD_reaction = "Decent";
                if (ModelState.IsValid)
                {
                    db.tb_feedback.Add(tb_feedback);
                    db.SaveChanges();
                    //return RedirectToAction("Index");
                }
            }
            else if (reaction == "3")
            {
                tb_feedback.FD_reaction = "Neutral";
                if (ModelState.IsValid)
                {
                    db.tb_feedback.Add(tb_feedback);
                    db.SaveChanges();
                    //return RedirectToAction("Index");
                }
            }
            else if (reaction == "4")
            {
                tb_feedback.FD_reaction = "Good";
                if (ModelState.IsValid)
                {
                    db.tb_feedback.Add(tb_feedback);
                    db.SaveChanges();
                    //return RedirectToAction("Index");
                }
            }
            else if (reaction == "5")
            {
                tb_feedback.FD_reaction = "Highly Satisfied";
                if (ModelState.IsValid)
                {
                    db.tb_feedback.Add(tb_feedback);
                    db.SaveChanges();
                    //return RedirectToAction("Index");
                }
            }
            return Redirect(Request.UrlReferrer.PathAndQuery);
        }
        public ActionResult subscribe([Bind(Include = "n_id,n_email")] tb_newsletter tb_newsletter)
        {
            if (ModelState.IsValid)
            {
                db.tb_newsletter.Add(tb_newsletter);
                db.SaveChanges();
                
            }
             return Redirect(Request.UrlReferrer.PathAndQuery);
        }
        public ActionResult logout()
        {
            FormsAuthentication.SignOut();
            TempData["u_id"] = "";
            Session.Abandon();
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Card([Bind(Include = "tr_id,tr_to,tr_cardname,tr_time,tr_fk_u")] tb_trx tb_trx,string sub, string to, string msg, string ca_pic, tb_cards c)
        {
            try
            {
                tb_trx.tr_to = to;
                tb_trx.tr_cardname = "Blue Flower";
                tb_trx.tr_time = DateTime.Now;
                tb_trx.tr_fk_u = Convert.ToInt32(TempData["u_id"]);
                db.tb_trx.Add(tb_trx);
                db.SaveChanges();
                 
                WebMail.EnableSsl = true;
                WebMail.From = to;
                WebMail.SmtpPort = 587;
                WebMail.SmtpServer = "smtp.gmail.com";
                WebMail.UserName = "sfcstudent101@gmail.com";
                WebMail.Password = "Today123";
                WebMail.SmtpUseDefaultCredentials = true;
                WebMail.Send(to: to, subject: sub, body: "Message : "+msg + "<br /><img src='"+ca_pic+"' width='300' height='400' />  ", isBodyHtml: true);


                //http://hexa.ovh/img/391244daeb1d1e65782989836611f0c9.png

            }
            catch (Exception ex)
            {

                ViewBag.msg = ex;
            }

            return Redirect(Request.UrlReferrer.PathAndQuery);
        }

    }
}