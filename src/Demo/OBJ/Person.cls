Class Demo.OBJ.Person Extends (%JSON.Adaptor, %SerialObject, %XML.Adaptor)
{

Property firstName As %String [ Required ];

Property lastName As %String [ Required ];

Property phone As %String [ Required ];

Property city As Demo.OBJ.City;

Property pets As list Of Demo.OBJ.Pet;

}
