using HospitalManagement.Context;
using HospitalManagement.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace HospitalManagement.Domain
{
    public class AppointmentDomain : BaseContext
    {
        public void AddApointment(Appointment appointments)
        {
            Appointments.Add(appointments);
            SaveChanges();
        }
    }
}
