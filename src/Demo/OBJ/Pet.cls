Class Demo.OBJ.Pet Extends (%JSON.Adaptor, %SerialObject, %XML.Adaptor)
{

Property name As %String;

Property category As %String;

Property color As %String;

Property gender As list Of %String;

Property age As %Integer;

Method %OnNew(name As %String = "", category As %String = "", color As %String = "", gender As %String = "", age As %Integer = -1) As %Status
{
	Set ..name = name
	Set ..category = category
	Set ..color = color
	Set ..gender = gender
	Set ..age = age
	Quit $$$OK
}

}
