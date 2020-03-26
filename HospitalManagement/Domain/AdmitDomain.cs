using HospitalManagement.Context;
using HospitalManagement.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HospitalManagement.Domain
{
    public class AdmitDomain:BaseContext
    {
        public void AddAdmit(Admit admits)
        {
            Admits.Add(admits);
            SaveChanges();
        }
        public List<Admit> GetAdmits()
        {
            return Admits
                .Include(t => t.Patient)
                .Include(t => t.Doctor)
                .Include(t => t.Bed)
                .ToList();
        }
    }
}
