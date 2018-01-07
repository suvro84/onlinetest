using System;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;

[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class TestWcfService
{
	// Add [WebGet] attribute to use HTTP GET
	[OperationContract]
	public void DoWork()
	{
		// Add your operation implementation here
		return;
	}


    // Add more operations here and mark them with [OperationContract]
    [OperationContract]
    public  String Hello(String theString)
    {
        return "Hello, " + theString + ".";
    }

    [OperationContract]
    public String HelloJS(String theString)
    {
        return "Hello, " + theString + ".";
    }
}
