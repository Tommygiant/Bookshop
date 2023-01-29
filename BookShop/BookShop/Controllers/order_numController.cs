using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DAL;

namespace BookShop.Controllers
{
    public class order_numController : Controller
    {
        private BOOKSHOPEntities db = new BOOKSHOPEntities();

        // GET: order_num
        public ActionResult Index()
        {
            return View(db.order_num.ToList());
        }

        // GET: order_num/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            order_num order_num = db.order_num.Find(id);
            if (order_num == null)
            {
                return HttpNotFound();
            }
            return View(order_num);
        }

        // GET: order_num/Create
        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "book_id,order_num1")] order_num order_num)
        {
            if (ModelState.IsValid)
            {
                db.order_num.Add(order_num);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(order_num);
        }

        // GET: order_num/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            order_num order_num = db.order_num.Find(id);
            if (order_num == null)
            {
                return HttpNotFound();
            }
            return View(order_num);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "book_id,order_num1")] order_num order_num)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order_num).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(order_num);
        }

        // GET: order_num/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            order_num order_num = db.order_num.Find(id);
            if (order_num == null)
            {
                return HttpNotFound();
            }
            return View(order_num);
        }

        // POST: order_num/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            order_num order_num = db.order_num.Find(id);
            db.order_num.Remove(order_num);
            db.SaveChanges();
            return RedirectToAction("Index");
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
