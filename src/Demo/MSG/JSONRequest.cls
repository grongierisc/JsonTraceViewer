Class Demo.MSG.JSONRequest Extends Grongier.JsonTraceViewer.Request
{

Property test As %String;

Property test2 As list Of %String;

Property client As Demo.OBJ.Person;

Storage Default
{
<Data name="JSONRequestDefaultData">
<Subscript>"JSONRequest"</Subscript>
<Value name="1">
<Value>test</Value>
</Value>
<Value name="2">
<Value>test2</Value>
</Value>
<Value name="3">
<Value>client</Value>
</Value>
</Data>
<DefaultData>JSONRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
