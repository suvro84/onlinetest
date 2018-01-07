using System.Collections.Generic;
using System.ServiceModel;


namespace EmployeeService
{
    [ServiceContract]
    public interface IEmployeeService
    {
        [OperationContract]
        void SaveEmployee(Employee emp);
        [OperationContract]
        void DeleteEmployee(int empId);
        [OperationContract]
        List<Employee> GetEmployees();
    }
}
