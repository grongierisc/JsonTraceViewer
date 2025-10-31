Class Demo.Generator
{

ClassMethod GenerateUsingJSON() As %Status
{
	Set sc = $$$OK
	Try {
		Set tSC = ##class(Ens.Director).CreateBusinessService("Demo.BS.CustomerJSONService",.tService)
		set request = ##class(Demo.MSG.JSONRequest).%New()
		set client = ##class(Demo.OBJ.Person).%New()
		set client.firstName = "James"
		set client.lastName = "Bond"
		set client.phone = "007"
		set request.client = client
		set request.test = "test text"
		do request.test2.Insert("test array")
		Write request.GetObjectJson(),!
		do request.%Save()
		zw request
		Set tSC = tService.ProcessInput(request,.output)
		Quit:$$$ISERR(sc)
	}
	Catch (err) {
		Set sc = $$$ADDSC(sc,err.AsStatus())
	}
	Return sc
}

ClassMethod GenerateUsingYAML() As %Status
{
	Set sc = $$$OK
	Try {
		Set tSC = ##class(Ens.Director).CreateBusinessService("Demo.BS.CustomerYAMLService",.tService)
		set request = ##class(Demo.MSG.JSONRequest).%New()
		set client = ##class(Demo.OBJ.Person).%New()
		set client.firstName = "James"
		set client.lastName = "Bond"
		set client.phone = "007"
		set request.client = client
		set request.test = "test text"
		do request.test2.Insert("test array")
		Write request.GetObjectJson(),!
		do request.%Save()
		zw request
		Set tSC = tService.ProcessInput(request,.output)
		Quit:$$$ISERR(sc)
	}
	Catch (err) {
		Set sc = $$$ADDSC(sc,err.AsStatus())
	}
	Return sc
}

ClassMethod GenerateUsingXML() As %Status
{
	Set sc = $$$OK
	Try {
		Set tSC = ##class(Ens.Director).CreateBusinessService("Demo.BS.CustomerXMLService",.tService)
		set request = ##class(Demo.MSG.XMLRequest).%New()
		set client = ##class(Demo.OBJ.Person).%New()
		set client.firstName = "James"
		set client.lastName = "Bond"
		set client.phone = "007"
		set request.client = client
		set request.test = "test text"
		do request.test2.Insert("test array")
		do request.%Save()
		zw request
		Set tSC = tService.ProcessInput(request,.output)
		Quit:$$$ISERR(sc)
	}
	Catch (err) {
		Set sc = $$$ADDSC(sc,err.AsStatus())
	}
	Return sc
}

}
