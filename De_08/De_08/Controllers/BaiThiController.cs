using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using De_08.Models.Entities;

namespace De_08.Controllers
{
    public class BaiThiController : Controller
    {
        // GET: BaiThi
        QLBanChauCanhEntities db = new QLBanChauCanhEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Menu()
        {
            List<PhanLoaiPhu> phanLoais = db.PhanLoaiPhus.ToList();
            return PartialView("_Header", phanLoais);

        }

        public ActionResult Content()
        {
            List<SanPham> sanPhams = db.SanPhams.ToList();
            return PartialView("_Main_Content", sanPhams);
        }

        public ActionResult ProductById(string CatId)
        {
            List<SanPham> sanPhams = db.SanPhams.Where(sp => sp.MaPhanLoaiPhu == CatId).ToList();
            return PartialView("_Main_Content", sanPhams);
        }

        public ActionResult Update(string id)
        {
            var data = db.SanPhams.Find(id);
            return View(data);
        }

        [HttpPost]
        public ActionResult Update(SanPham sp, HttpPostedFileBase fileAnh)
        {
            if(fileAnh.ContentLength > 0)
            {
                string rootFolder = Server.MapPath("/Content/img/bg-img/");
                string pathImage = rootFolder + fileAnh.FileName;
                fileAnh.SaveAs(pathImage);
                sp.AnhDaiDien = fileAnh.FileName;
            }

            var update = db.SanPhams.Find(sp.MaSanPham);
            try
            {
                update.TenSanPham = sp.TenSanPham;
                update.MaPhanLoai = sp.MaPhanLoai;
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
            catch(Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(sp);
            }
        }

        public ActionResult Xoa(string id)
        {
            var del = db.SanPhams.Find(id);
            db.SanPhams.Remove(del);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}