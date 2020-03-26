using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Admit
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int AdmitId { get; set; }
        public int PatientId { get; set; }
        public int DoctorId { get; set; }
        public int DepartmentId { get; set; }
        public int BedId{ get; set; }
        public DateTimeOffset StartDate { get; set; }
        public DateTimeOffset EndDate { get; set; }
        [ForeignKey(nameof(DepartmentId))]
        [InverseProperty(nameof(Models.Department.Admits))]
        public virtual Department Department{ get; set; }
        [ForeignKey(nameof(BedId))]
        [InverseProperty(nameof(Models.Bed.Admits))]
        public virtual Bed Bed { get; set; }
        [ForeignKey(nameof(PatientId))]
        [InverseProperty(nameof(Models.Patient.Admits))]
        public virtual Patient Patient { get; set; }
        [ForeignKey(nameof(DoctorId))]
        [InverseProperty(nameof(Models.Doctor.Admits))]
        public virtual Doctor Doctor { get; set; }

    }
}
