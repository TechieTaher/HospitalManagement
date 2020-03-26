using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Treatment
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int TreatmentId { get; set; }
        public int PatientId { get; set; }
        public int DoctorId { get; set; }
        public int TreatmentType { get; set; }
        [ForeignKey(nameof(PatientId))]
        [InverseProperty(nameof(Models.Patient.Treatments))]
        public virtual Patient Patient { get; set; }
        [ForeignKey(nameof(DoctorId))]
        [InverseProperty(nameof(Models.Doctor.Treatments))]
        public virtual Doctor Doctor { get; set; }
    }
}
