Class Demo.BS.CustomerYAMLService Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{

	set pOutput = ##class(Ens.Response).%New()

	set request = ##class(Demo.MSG.YAMLRequest).%New()
	set client = ##class(Demo.OBJ.Person).%New()
	set client.firstName = "James"
	set client.lastName = "Bond"
	set client.phone = "007"
	set request.client = client
	set request.test = "test text"
	F I=1:1:1000 do request.test2.Insert("test array")
	do request.%Save()

	set tSC =  ..SendRequestSync("Demo.BO.CustomerOperation", request, .pResponse)
	if $$$ISERR(tSC) quit tSC
	Quit $$$OK
}

}
