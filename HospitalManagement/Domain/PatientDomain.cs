using HospitalManagement.Context;
using HospitalManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HospitalManagement.Domain
{
    public class PatientDomain : BaseContext
    {
        public void AddPatient(Patient patient)
        {
            Patients.Add(patient);
            SaveChanges();
        }
        public List<Patient> GetPatients()
        {
            return Patients.ToList();
        }
    }
}
