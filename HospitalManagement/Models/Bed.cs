using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Bed
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int BedId { get; set; }
        public int BedNo { get; set; }
        public int RoomNo { get; set; }
        [InverseProperty("Bed")]
        public virtual ICollection<Admit> Admits { get; set; }
        public Bed()
        {
            Admits = new HashSet<Admit>();
        }
    }
}
