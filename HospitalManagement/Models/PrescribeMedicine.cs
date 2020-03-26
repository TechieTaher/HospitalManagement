using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class PrescribeMedicine
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int PrescriptionMedicineId { get; set; }
        public int PrescriptionId { get; set; }
        public int MedicineId { get; set; }
        [ForeignKey(nameof(PrescriptionId))]
        [InverseProperty(nameof(Models.Prescription.PrescribeMedicines))]
        public virtual Prescription Prescription  { get; set; }
        [ForeignKey(nameof(MedicineId))]
        [InverseProperty(nameof(Models.Medicine.PrescribeMedicines))]
        public virtual Medicine Medicine{ get; set; }
    }
}
