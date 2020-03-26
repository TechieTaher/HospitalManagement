using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Medicine
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int MedicineId { get; set; }
        public string MedicineName { get; set; }
        public int Dose { get; set; }
        [InverseProperty("Medicine")]
        public virtual ICollection<PrescribeMedicine> PrescribeMedicines { get; set; }
        public Medicine()
        {
            PrescribeMedicines = new HashSet<PrescribeMedicine>();
        }
    }
}
