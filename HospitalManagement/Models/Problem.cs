using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Problem
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int ProblemId { get; set; }
        public string ProblemType { get; set; }
        public string Description { get; set; }
        public string Symptoms { get; set; }
        [InverseProperty("Problem")]
        public virtual ICollection<Appointment> Appointments { get; set; }

        public Problem()
        {
            Appointments = new HashSet<Appointment>();
        }
    }
}
