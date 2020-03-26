using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Appointment
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int AppointmentId { get; set; }
        public int  PatientId { get; set; }
        public int DoctorId { get; set; }
        public int ProblemId { get; set; }
        public DateTimeOffset DateTime { get; set; }
        [ForeignKey(nameof(PatientId))]
        [InverseProperty(nameof(Models.Patient.Appointments))]
        public virtual Patient Patient { get; set; }
        [ForeignKey(nameof(DoctorId))]
        [InverseProperty(nameof(Models.Doctor.Appointments))]
        public virtual Doctor Doctor{ get; set; }
        [ForeignKey(nameof(ProblemId))]
        [InverseProperty(nameof(Models.Problem.Appointments))]
        public virtual Problem Problem{ get; set; }
        
    }
}
