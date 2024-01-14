using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using De_02.Models;

namespace De_02.Controllers
{
    public class BaiThiController : Controller
    {
        // GET: BaiThi
        QLBanQuanAoEntities db = new QLBanQuanAoEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult PhanLoaiPhu()
        {
            List<PhanLoaiPhu> phanLoaiPhus = db.PhanLoaiPhus.ToList();
            return PartialView("_Main", phanLoaiPhus);
        }

        public ActionResult SanPham()
        {
            List<SanPham> sanPhams = db.SanPhams.ToList();
            return PartialView("_Main", sanPhams);
        }

        public ActionResult ProductById(string CatId)
        {
            List<SanPham> sanPhams = db.SanPhams.Where(sp => sp.MaPhanLoaiPhu == CatId).ToList();
            return PartialView("_Main", sanPhams);
        }

        public ActionResult Update(string id)
        {
            var data = db.SanPhams.Find(id);
            return View(data);
        }

        [HttpPost]
        public ActionResult Update(SanPham sp, HttpPostedFileBase fileAnh)
        {
            if (fileAnh.ContentLength > 0)
            {
                string rootFolder = Server.MapPath("/Content/images/");
                string pathImage = rootFolder + fileAnh.FileName;
                fileAnh.SaveAs(pathImage);
                sp.AnhDaiDien = fileAnh.FileName;
            }

            var update = db.SanPhams.Find(sp.MaSanPham);
            try
            {
                update.TenSanPham = sp.TenSanPham;
                update.MaPhanLoai = sp.SelectedMaPLC;
                update.GiaNhap = sp.GiaNhap;
                update.DonGiaBanLonNhat = sp.DonGiaBanLonNhat;
                update.DonGiaBanNhoNhat = sp.DonGiaBanNhoNhat;
                update.TrangThai = sp.TrangThai;
                update.MoTaNgan = sp.MoTaNgan;
                update.NoiBat = sp.NoiBat;
                update.MaPhanLoaiPhu = sp.SelectedMaPLP;
                update.AnhDaiDien = sp.AnhDaiDien;

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