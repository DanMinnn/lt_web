//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace De_01.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            this.SPTheoMaus = new HashSet<SPTheoMau>();
        }
    
        public string MaSanPham { get; set; }

        [RegularExpression(@"^[A-Za-z]*[A-Za-z][A-Za-z0-9-. _]*$", ErrorMessage = "Ten san pham phai bat dau bang 1 ky tu chu cai")]
        public string TenSanPham { get; set; }
        public string MaPhanLoai { get; set; }

        [RegularExpression("^[0-9]+$", ErrorMessage = "Giá nhập phải là một số.")]
        public Nullable<decimal> GiaNhap { get; set; }

        [RegularExpression("^[0-9]+$", ErrorMessage = "Giá nhập phải là một số.")]
        public Nullable<decimal> DonGiaBanNhoNhat { get; set; }

        [RegularExpression("^[0-9]+$", ErrorMessage = "Giá nhập phải là một số.")]
        public Nullable<decimal> DonGiaBanLonNhat { get; set; }
        public string TrangThai { get; set; }
        public string MoTaNgan { get; set; }

        public string AnhDaiDien { get; set; }
        public string NoiBat { get; set; }
        public string MaPhanLoaiPhu { get; set; }
        public string SelectedMPL { get; set; }
        public string SelectedMPLP { get; set; }
    
        public virtual PhanLoai PhanLoai { get; set; }
        public virtual PhanLoaiPhu PhanLoaiPhu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SPTheoMau> SPTheoMaus { get; set; }
    }
}
