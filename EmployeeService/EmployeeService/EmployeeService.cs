using System.Collections.Generic;
using System.ServiceModel;

namespace EmployeeService
{
    [ServiceBehavior(InstanceContextMode=InstanceContextMode.Single)]
    public class EmployeeService:IEmployeeService
    {
        #region IEmployeeService Members

        List<Employee> lstEmp = new List<Employee>();
        public void SaveEmployee(Employee emp)
        {
            lstEmp.Add(emp);
        }

        public void DeleteEmployee(int empId)
        {
            lstEmp.Remove(lstEmp.Find( x => x.EmpId.Equals(empId)));
        }

        public List<Employee> GetEmployees()
        {
            return lstEmp;
        }

        #endregion
    }
}
