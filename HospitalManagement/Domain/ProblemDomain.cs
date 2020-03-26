using HospitalManagement.Context;
using HospitalManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HospitalManagement.Domain
{
    public class ProblemDomain : BaseContext
    {
        public List<Problem> GetProblem()
        {
            return Problems.ToList();
        }
    }
}
