using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Patient
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public int Age { get; set; }
        public int Gender { get; set; }
        public Int64 PhoneNo { get; set;}
        public string Address { get; set; }
        [InverseProperty("Patient")]
        public virtual ICollection<Appointment> Appointments { get; set; }
        [InverseProperty("Patient")]
        public virtual ICollection<Admit> Admits { get; set; }
        [InverseProperty("Patient")]
        public virtual ICollection<Prescription> Prescriptions { get; set; }
        [InverseProperty("Patient")]
        public virtual ICollection<Treatment> Treatments { get; set; }
        [InverseProperty("Patient")]
        public virtual ICollection<Nursing> Nursings { get; set; }
        public Patient()
        {
            Nursings = new HashSet<Nursing>();
            Treatments = new HashSet<Treatment>();
            Admits = new HashSet<Admit>();
            Appointments = new HashSet<Appointment>();
        }
    }
}
