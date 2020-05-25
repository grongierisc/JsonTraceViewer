Class Demo.BS.CustomerJSONService Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, pHint As %String) As %Status
{
	set pOutput = ##class(Ens.Response).%New()

	set request = ##class(Demo.MSG.JSONRequest).%New()
	set client = ##class(Demo.OBJ.Person).%New()
	set client.firstName = "James"
	set client.lastName = "Bond"
	set client.phone = "007"
	set request.client = client
	set request.test = "test text"
	do request.test2.Insert("test array")
	do request.%Save()

	set tSC =  ..SendRequestSync("Demo.BO.CustomerOperation", request, .pResponse)
	if $$$ISERR(tSC) quit tSC
	Quit $$$OK
}

}
