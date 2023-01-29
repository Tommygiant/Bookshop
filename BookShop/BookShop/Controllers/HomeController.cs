using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DAL;
using System.Web.Security;



namespace Home.Controllers
{
    public class HomeController : Controller
    {
        BOOKSHOPEntities db = new BOOKSHOPEntities();
        //
        // GET: /Home/
        public new static string User;
        public ActionResult Index()
        {
            var book = (from w in db.books select w).Take(4);
            
            return View(book.ToList());

        }

        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult adminLogin()
        {
            return View();
        }
        public ActionResult adminRegister()
        {
            return View();
        }
        public JsonResult CheckLogin(string username, string password)
        {
            string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            var result = db.users.Where(u => u.username == username & u.password == pass);
            if (result.Count() > 0)
            {
                User = username;
                Session["username"] = username;
                return Json(new { status = 1, data = "login sucessfully" });
            }
            return Json(new { status = 0, data = "login fail" });
        }
        public JsonResult adminCheckLogin(string username, string password)
        {
            string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            var result = db.admin.Where(u => u.admin_name == username & u.admin_pwd == pass);
            if (result.Count() > 0)
            {
               
                Session["adminusername"] = username;
                return Json(new { status = 1, data = "login sucessfully" });
            }
            return Json(new { status = 0, data = "login fail" });
        }
        public JsonResult ProfileRegister(string username, string password, string repassword, string email, string phone, string address)
        {
            try
            {
                if (password == repassword)
                {
                    string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
                    users userinformation = new users
                    {
                        username = username,
                        password = pass,
                        
                        phone = phone,
                        address = address,
                        email = email,

                    };
                    db.users.Add(userinformation);
                    db.SaveChanges();
                    return Json(new { status = 1, data = "register sucessfully" });
                }
                else
                {
                    return Json(new { status = 0, data = "type wrong" });
                }
            }
            catch
            {
                return Json(new { status = 0, data = "register fail" });
            }
        }
        public JsonResult adminProfileRegister(string username, string password, string repassword, string email)
        {
            try
            {
                if (password == repassword)
                {
                    string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
                    admin userinformation = new admin
                    {
                        admin_name = username,
                        admin_pwd = pass,
                        admin_email=email
                       

                    };
                    db.admin.Add(userinformation);
                    db.SaveChanges();
                    return Json(new { status = 1, data = "register sucessfully" });
                }
                else
                {
                    return Json(new { status = 0, data = "type wrong" });
                }
            }
            catch
            {
                return Json(new { status = 0, data = "register fail" });
            }
        }

        public ActionResult BookShow()
        {
            return View(db.books.ToList());
        }
        public ActionResult cart()
        {

            ViewBag.user = Session["username"];
            if (Session["username"] == null)
            {
                return Content("<script>alert('Please Login');location.href='/Home/Login';</script>");
            }
            string s = Session["username"].ToString();
           
            var order = db.orders.Where(u => u.username == s).ToList();

            return View(order);
        }

        public ActionResult CartSubmit()
        {

            ViewBag.user = Session["username"];
            if (Session["username"] == null)
            {
                return Content("<script>alert('Please Login');location.href='/Home/Login';</script>");
            }
            string username = Session["username"].ToString();

            var order = db.orders.Where(u => u.username == username && u.status==0).ToList();
            foreach (orders r  in order)
            {
                r.order_date = System.DateTime.Now.ToString("yyyy/MM/dd");
                r.status = 1;
            }
            db.SaveChanges();
            return Content("<script>alert('Order Sucessfully');location.href='/Home/Cart';</script>");
             
        }
        public ActionResult order()
        {
            if (Session["username"] == null)
            {
                return Content("<script>alert('Please Login');location.href='/Home/Login';</script>");
            }
            string username = Session["username"].ToString();
            var order = db.orders.Where(u => u.username == username ).ToList();
            return View(order);
        }

        public ActionResult AddCart(int? id)
        {
            ViewBag.user = Session["username"];
            if (Session["username"] == null)
            {
                return Content("<script>alert('Please Login');location.href='/Home/Login';</script>");
            }
            string username = Session["username"].ToString();
            var z = db.users.Where(a => a.username == username).First();
            var b = db.books.Where(u => u.book_id == id).First();
            var cartbook = db.orders.Where(c => c.book_id == id & c.status == 1).SingleOrDefault();

            if (cartbook == null)
            {
                orders ordersinformation = new orders
                {

                    username = username,
                    order_date = System.DateTime.Now.ToString("yyyy/MM/dd"),
                    book_id = b.book_id,
                    book_title = b.title,
                    quantity = 1,
                    adress = z.address,
                    status = 1,
                    price = b.price,
                };
                db.orders.Add(ordersinformation);
            }
            else
            {

                return Content("<script>alert('This Book already be reserved');location.href='/Home/BookShow';</script>");
            }
            db.SaveChanges();
            return Content("<script>alert('Order Sucessfully');location.href='/Home/BookShow';</script>");
        }

        /* public ActionResult AddCart(int? id)
         {
             ViewBag.user = Session["username"];
             if (Session["username"] == null)
             {
                 return Content("<script>alert('请先登录');location.href='/Home/Login';</script>");
             }
             string username = Session["username"].ToString();           
             var z = db.users.Where(a => a.username == username).First();
             var b = db.books.Where(u => u.book_id == id).First();
             var cartbook = db.orders.Where(c => c.book_id == id & c.username== username).SingleOrDefault();
             if (cartbook == null)
             {
                 orders ordersinformation = new orders
                 {

                     username = username,
                     order_date = System.DateTime.Now.ToString("yyyy/MM/dd"),
                     book_id = b.book_id,
                     book_title = b.title,
                     quantity = 1,
                     adress = z.address,
                     price = b.price,
                 };
                 db.orders.Add(ordersinformation);
             }
             else {

                 var result = from s in db.orders
                              where s.book_id == id
                              select s;
                 foreach (orders r in result)
                 {
                     r.order_date = System.DateTime.Now.ToString("yyyy/MM/dd");
                     r.quantity +=1;
                 }                            
             }       
             db.SaveChanges();
             return Content("<script>alert('添加成功');location.href='/Home/BookShow';</script>");
         }*/
        public ActionResult AddCart1(int? id)
        {
            ViewBag.user = Session["username"];
            int quantity = int.Parse(Request["quantity"]);
            if (Session["username"] == null)
            {
                return Content("<script>alert('Please Login');location.href='/Home/Login';</script>");
            }
            string username = Session["username"].ToString();
           
            var z = db.users.Where(a => a.username == username).First();
            var b = db.books.Where(u => u.book_id == id).First();
            var cartbook = db.orders.Where(c => c.book_id == id & c.username == username).SingleOrDefault();

            if (cartbook == null)
            {
                orders ordersinformation = new orders
                {

                    username = username,
                    order_date = System.DateTime.Now.ToString("yyyy/MM/dd"),
                    book_id = b.book_id,
                    book_title = b.title,
                    quantity = 1,
                    adress = z.address,
                    price = b.price,

                };
                db.orders.Add(ordersinformation);
            }
            else
            {
                var result = from s in db.orders
                             where s.book_id == id
                             select s;
                foreach (orders r in result)
                {
                    r.order_date = System.DateTime.Now.ToString("yyyy/MM/dd");
                    r.quantity += 1;
                }

            }
            db.SaveChanges();
            return Content("<script>alert('Order Sucessfully');location.href='/';</script>");
        }
      
        public ActionResult BookSeach()
        {

            string BookTitle = Request["s"];
            string BookType = Request["product_cat"];
            string BookAuthor = Request["book_author"];
            
            if (string.IsNullOrEmpty(BookTitle) && BookType == "0" && BookAuthor == "0")
            {
                var book = db.books;
                return View(book.ToList());
            }

            else if (!string.IsNullOrEmpty(BookTitle) && BookType != "0")
            {
                string btitle = "%" + BookTitle + "%";
                string btype = "%" + BookType + "%";
                var book = db.books.Where(x => SqlFunctions.PatIndex(btype, x.type) > 0 & SqlFunctions.PatIndex(btitle, x.title) > 0);
                // return RedirectToAction("index", Alist2);
                if (book.Count() == 0)
                {
                    return Content("<script>alert('NOT FOUND');location.href='/';</script>");
                }
                else
                {
                    return View(book.ToList());
                }
                
            }
            else if (!string.IsNullOrEmpty(BookTitle))
            {
                string btitle = "%" + BookTitle + "%";
                string btype = "%" + BookType + "%";
                var book = db.books.Where(x => SqlFunctions.PatIndex(btitle, x.title) > 0);
                // return RedirectToAction("index", Alist2);
                if (book.Count() == 0)
                {
                    return Content("<script>alert('NOT FOUND');location.href='/';</script>");
                }
                else
                {
                    return View(book.ToList());
                }
            }
            else
            {
                string btitle = "%" + BookTitle + "%";
                string btype = "%" + BookType + "%";
                var book = db.books.Where(x => SqlFunctions.PatIndex(btype, x.type) > 0);
                // return RedirectToAction("index", Alist2);
                if (book.Count() == 0)
                {
                    return Content("<script>alert('NOT FOUND');location.href='/';</script>");
                }
                else
                {
                    return View(book.ToList());
                }
            }
           
        }
        public ActionResult BookDetail(int? id)
        {
            
        
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            books book = db.books.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        
        }

        public ActionResult CartDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            orders orders = db.orders.Find(id);
            if (orders == null)
            {
                return HttpNotFound();
            }
            return View(orders);
        }
        

        
        
        public ActionResult CartDeleteConfirmed(int id)
        {
            orders orders = db.orders.Find(id);
            db.orders.Remove(orders);
            db.SaveChanges();
            return RedirectToAction("cart");
        }
        public ActionResult userInformation()
        {

           
            string username = Session["username"].ToString();
            var user = db.users.Where(q => q.username == username).First();
            return View(user);
        }
        public ActionResult Information()
        {
            if (Session["username"] == null)
            {
                return Content("<script>alert('Please Login');location.href='/Home/Login';</script>");
            }
            string username = Session["username"].ToString();
            var user = db.users.Where(q => q.username == username).First();
            return View(user);
        }
        public ActionResult Logout()
        {

            Session["username"] = null;
            return Content("<script>alert('Logout sucessfully');location.href='/';</script>");
        }
        public ActionResult adminLogout()
        {

            Session["adminusername"] = null;
            return Content("<script>alert('Logout sucessfully');location.href='/';</script>");
        }


       


    }
}
