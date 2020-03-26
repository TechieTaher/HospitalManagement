using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Nursing
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int NursingId { get; set; }
        public int EmployeeId{ get; set; }
        public int PatientId { get; set; }
        public string Description { get; set; }
        [ForeignKey(nameof(PatientId))]
        [InverseProperty(nameof(Models.Patient.Nursings))]
        public virtual Patient Patient { get; set; }
        [ForeignKey(nameof(EmployeeId))]
        [InverseProperty(nameof(Models.Employee.Nursings))]
        public virtual Employee Employee { get; set; }
       
    }
}
