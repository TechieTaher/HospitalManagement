using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Employee
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public Int64 PhoneNo { get; set; }
        public int EmployeeType { get; set; }
        public DateTime ShiftStartTime{ get; set; }
        public DateTime ShiftEndTime { get; set; }
        [InverseProperty("Employee")]
        public virtual ICollection<Nursing> Nursings { get; set; }
        public Employee()
        {
            Nursings = new HashSet<Nursing>();
        }
    }
}
