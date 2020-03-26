using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Prescription
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int PrescriptionId { get; set; }
        public int DoctorId { get; set; }
        public int PatientId { get; set; }
        public string Description { get; set; }
        [ForeignKey(nameof(PatientId))]
        [InverseProperty(nameof(Models.Patient.Prescriptions))]
        public virtual Patient Patient { get; set; }

        [ForeignKey(nameof(DoctorId))]
        [InverseProperty(nameof(Models.Doctor.Prescriptions))]
        public virtual Doctor Doctor { get; set; }
        [InverseProperty("Prescription")]
        public virtual ICollection<PrescribeMedicine> PrescribeMedicines { get; set; }
        public Prescription()
        {
            PrescribeMedicines = new HashSet<PrescribeMedicine>();
        }
    }
}
