using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using De_01.Models;

namespace De_01.Controllers
{
    public class BaiThiController : Controller
    {
        // GET: BaiThi
        QLBanQuanAoEntities db = new QLBanQuanAoEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult PhanLoai()
        {
            List<PhanLoai> phanLoais = db.PhanLoais.ToList();
            return PartialView("_Main", phanLoais);
        }

        public ActionResult SanPham()
        {
            List<SanPham> sanPhams = db.SanPhams.ToList();
            return PartialView("_Main", sanPhams);
        }

        public ActionResult ProductById(string CatId)
        {
            List<SanPham> sanPhams = db.SanPhams.Where(sp => sp.MaPhanLoai == CatId).ToList();
            return PartialView("_Main", sanPhams);
        }

        public ActionResult Them()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Them(SanPham sp, HttpPostedFileBase fileAnh)
        {
            if (fileAnh.ContentLength > 0)
            {
                string rootFolder = Server.MapPath("/Content/images/");
                string pathImage = rootFolder + fileAnh.FileName;
                fileAnh.SaveAs(pathImage);
                sp.AnhDaiDien = fileAnh.FileName;
            }

            try
            {
                sp.MaPhanLoai = Request.Form["MaPL"];
                sp.MaPhanLoaiPhu = Request.Form["MaPLP"];

                db.SanPhams.Add(sp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(sp);
            }
        }
    }
}