Class Demo.OBJ.City Extends (%JSON.Adaptor, %SerialObject, %XML.Adaptor)
{

Property name As %String;

Property zipCode As %String;

Property state As %String;

Property contry As list Of %String;

Method %OnNew(name As %String = "", zipCode As %String = "", state As %String = "", contry As %String = "") As %Status
{
	Set ..name = name
	Set ..zipCode = zipCode
	Set ..state = state
	Set ..contry = contry
	Quit $$$OK
}

}
