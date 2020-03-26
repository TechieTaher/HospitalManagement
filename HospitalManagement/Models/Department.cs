using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Department
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        [InverseProperty("Department")]
        public virtual ICollection<Admit> Admits{ get; set; }
        public Department()
        {
            Admits = new HashSet<Admit>();
        }
    }
}
