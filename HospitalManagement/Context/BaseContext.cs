using HospitalManagement.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace HospitalManagement.Context
{
    public abstract class BaseContext :DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("data source=MSI\\SQLEXPRESS;initial catalog=HospitalDb;Integrated Security=True;MultipleActiveResultSets=True;App=EntityFramework");
        }
        public DbSet<Admit> Admits { get; set; }
        public DbSet<Appointment> Appointments{ get; set; }
        public DbSet<Bed> Beds{ get; set; }
        public DbSet<Department> Departments{ get; set; }
        public DbSet<Doctor> Doctors{ get; set; }
        public DbSet<Employee> Employees{ get; set; }
        public DbSet<Medicine> Medicines{ get; set; }
        public DbSet<Nursing>Nursings  { get; set; }
        public DbSet<Patient> Patients{ get; set; }
        public DbSet<PrescribeMedicine> PrescribeMedicines { get; set; }
        public DbSet<Prescription> Prescriptions { get; set; }
        public DbSet<Problem> Problems { get; set; }
        public DbSet<Treatment> Treatments { get; set; }
    }
}
