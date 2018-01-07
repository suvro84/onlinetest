using System.Runtime.Serialization;

namespace EmployeeService
{
    [DataContract]
    public class Employee
    {
        [DataMember]
        public int EmpId;
        [DataMember]
        public string FirstName;
        [DataMember]
        public string LastName;
        [DataMember]
        public string Address;
        [DataMember]
        public int Age;
        [DataMember]
        public string Designation;
    }
}
