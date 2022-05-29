using E_Greetings.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Reporting.WebForms;
using System.IO;

namespace E_Greetings.Controllers
{
    public class AdminController : Controller
    {
        db_egreetingcardEntities1 db = new db_egreetingcardEntities1();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult reporting(string ReportType1)
        {

            LocalReport lr = new LocalReport();

            string rpath = Path.Combine(Server.MapPath("~/reports"), "Report1.rdlc");

            lr.ReportPath = rpath;

            //List<tb_trx> tbtrx = new List<tb_trx>();

            tbtrx = db.report_join().ToList();
            ReportDataSource rds = new ReportDataSource("DataSet1", tbtrx);

            lr.DataSources.Add(rds);

            string mt, enc, f;

            string[] s;

            Warning[] w;

            byte[] b = lr.Render(ReportType1, null, out ReportType1, out enc, out f, out s, out w);

            return File(b, ReportType1);
        }


        public List<report_join_Result> tbtrx { get; set; }
    }
}