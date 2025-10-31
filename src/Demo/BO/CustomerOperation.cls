Class Demo.BO.CustomerOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method CreateCustomerJSON(pInput As Demo.MSG.JSONRequest, Output pOutput As Demo.MSG.JSONResponse) As %Status
{
	set sc = $$$OK
	set pOutput = ##class(Demo.MSG.JSONResponse).%New()
	return sc
}

Method CreateCustomerYAML(pInput As Demo.MSG.YAMLRequest, Output pOutput As Demo.MSG.YAMLResponse) As %Status
{
	set sc = $$$OK
	set pOutput = ##class(Demo.MSG.YAMLResponse).%New()
	return sc
}

Method CreateCustomerXML(pInput As Demo.MSG.XMLRequest, Output pOutput As Ens.Response) As %Status
{
	set sc = $$$OK
	set pOutput = ##class(Ens.Response).%New()
	return sc
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Demo.MSG.JSONRequest">
    <Method>CreateCustomerJSON</Method>
  </MapItem>
  <MapItem MessageType="Demo.MSG.XMLRequest">
    <Method>CreateCustomerXML</Method>
  </MapItem>
 <MapItem MessageType="Demo.MSG.YAMLRequest">
    <Method>CreateCustomerYAML</Method>
  </MapItem>
</MapItems>
}

}
