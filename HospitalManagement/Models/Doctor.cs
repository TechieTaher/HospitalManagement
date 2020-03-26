using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Doctor
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string Speciality { get; set; }
        public int JobType { get; set; }
        [InverseProperty("Doctor")]
        public virtual ICollection<Appointment> Appointments { get; set; }
        [InverseProperty("Doctor")]
        public virtual ICollection<Admit> Admits { get; set; }
        [InverseProperty("Doctor")]
        public virtual ICollection<Prescription> Prescriptions { get; set; }
        [InverseProperty("Doctor")]
        public virtual ICollection<Treatment> Treatments { get; set; }
        public Doctor()
        {
            Treatments = new HashSet<Treatment>();
            Appointments = new HashSet<Appointment>();
            Prescriptions = new HashSet<Prescription>();
            Admits = new HashSet<Admit>();
        }
    }
}
