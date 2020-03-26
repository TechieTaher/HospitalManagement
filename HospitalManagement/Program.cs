using HospitalManagement.Domain;
using HospitalManagement.Models;
using System;

namespace HospitalManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Hospital List Application");
            bool showMenu = true;
            AdmitDomain admitDomain= new AdmitDomain();
            AppointmentDomain appointmentDomain = new AppointmentDomain();
            BedDomain bedDomain = new BedDomain();
            DepartmentDomain departmentDomain = new DepartmentDomain();
            DoctorDomain doctorDomain = new DoctorDomain();
            EmployeeDomain employeeDomain = new EmployeeDomain();
            MedicineDomain medicineDomain = new MedicineDomain();
            NursingDomain nursingDomain = new NursingDomain();
            PatientDomain patientDomain = new PatientDomain();
            PrescribeMedicineDomain prescribeMedicineDomain = new PrescribeMedicineDomain();
            PrescriptionDomain prescriptionDomain = new PrescriptionDomain();
            ProblemDomain problemDomain = new ProblemDomain();
            TreatmentDomain treatmentDomain = new TreatmentDomain();
            while (showMenu)
            {
                Console.Clear();
                Console.WriteLine("Choose an option:");
                Console.WriteLine("1) Appointment");
                Console.WriteLine("2) Admit");
                Console.WriteLine("3) List Admits");
                Console.WriteLine("4) Exit");
                Console.Write("\r\nSelect an option: ");

                switch (Console.ReadLine().Trim())
                {
                    case "1":
                        {
                            Appointment appointment= new Appointment();
                            Patient patient = new Patient();
                            Console.Write("Enter Name : ");
                            patient.PatientName = Console.ReadLine().Trim();
                            Console.Write("Enter Age : ");
                            patient.Age = Convert.ToInt32(Console.ReadLine().Trim());
                            Console.Write("Enter Gender : ");
                            patient.Gender = Convert.ToInt32(Console.ReadLine().Trim());
                            Console.Write("Enter PhoneNo : ");
                            patient.PhoneNo = Convert.ToInt64(Console.ReadLine().Trim());
                            Console.Write("Enter Address : ");
                            patient.Address = Console.ReadLine().Trim();
                            patientDomain.AddPatient(patient);
                            Console.Write("Patient Added");
                            appointment.PatientId = patient.PatientId;
                            Console.WriteLine("No     Name     Speciality");
                            foreach (Doctor doctor in doctorDomain.GetDoctors())
                            {
                                Console.WriteLine($"{doctor.DoctorId}     {doctor.DoctorName}     {doctor.Speciality}");
                            }
                            Console.Write("Select Doctor by No : ");
                            appointment.DoctorId= Convert.ToInt32(Console.ReadLine().Trim());
                            Console.WriteLine("No     ProblemType     Description");
                            foreach (Problem problem in problemDomain.GetProblem())
                            {
                                Console.WriteLine($"{problem.ProblemId}     {problem.ProblemType}     {problem.Description}");
                            }
                            Console.Write("Select Problem by No : ");
                            appointment.ProblemId = Convert.ToInt32(Console.ReadLine().Trim());
                            Console.Write("Enter Appointment DateTime : ");
                            appointment.DateTime= Convert.ToDateTime(Console.ReadLine().Trim()).Date;
                            appointmentDomain.AddApointment(appointment);
                            Console.ReadLine();
                            break;
                        }
                    case "2":
                        {
                            Admit admit = new Admit();
                            Console.WriteLine("No     Name     PhoneNo");
                            foreach (Patient patient in patientDomain.GetPatients())
                            {
                                Console.WriteLine($"{patient.PatientId}     {patient.PatientName}     {patient.PhoneNo}");
                            }
                            Console.Write("Select Patient by No : ");
                            admit.PatientId = Convert.ToInt32(Console.ReadLine().Trim());
                            Console.WriteLine("No     Name     Speciality");
                            foreach (Doctor doctor in doctorDomain.GetDoctors())
                            {
                                Console.WriteLine($"{doctor.DoctorId}     {doctor.DoctorName}     {doctor.Speciality}");
                            }
                            Console.Write("Select Doctor by No : ");
                            admit.DoctorId = Convert.ToInt32(Console.ReadLine().Trim());
                            Console.WriteLine("No     Department Name");
                            foreach (Department department in departmentDomain.GetDepartments())
                            {
                                Console.WriteLine($"{department.DepartmentId}     {department.DepartmentName}");
                            }
                            Console.Write("Select Department by No : ");
                            admit.DepartmentId = Convert.ToInt32(Console.ReadLine().Trim());
                            Console.WriteLine("No    BedNo    RoomNo");
                            foreach (Bed bed in bedDomain.GetBeds())
                            {
                                Console.WriteLine($"{bed.BedId}     {bed.BedNo}     {bed.RoomNo}");
                            }
                            Console.Write("Select Bed by No : ");
                            admit.DepartmentId = Convert.ToInt32(Console.ReadLine().Trim());
                            Console.Write("Enter Admit Start DateTime : ");
                            admit.StartDate= Convert.ToDateTime(Console.ReadLine().Trim()).Date;
                            admitDomain.AddAdmit(admit);
                            Console.ReadLine();
                            break;
                        }
                    case "3":
                        {
                            Console.WriteLine("No     Patient Name     BedNo     Doctor Name     StartDate");
                            foreach (Admit admit in admitDomain.GetAdmits())
                            {
                                Console.WriteLine($"{admit.AdmitId}     {admit.Patient.PatientName}     {admit.Bed.BedNo}     {admit.Doctor.DoctorName}     {admit.StartDate}");

                            }
                            Console.ReadLine();
                            break;
                        }
                    
                    case "4":
                        showMenu = false;
                        break;
                    default:
                        Console.WriteLine("please enter correct option");
                        break;
                }
            }
        }
    }
}
