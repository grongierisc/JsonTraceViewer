Class Grongier.YAMLTraceViewer.Message Extends (%Persistent, Ens.Util.MessageBodyMethods, %JSON.Adaptor, %XML.Adaptor) [ Abstract ]
{

Method GetObjectJson()
{
	DO ..%JSONExportToString(.jsonString)
	QUIT jsonString
}

/// This method is called by the Management Portal to determine the content type that will be returned by the <method>%ShowContents</method> method.
/// The return value is a string containing an HTTP content type.
Method %GetContentType() As %String
{
	Quit "text/html"
}

/// This method is called by the Management Portal to display a portion of the HEAD section of a message-specific content viewer.<br>
Method %ShowContentsHead(pZenOutput As %Boolean = 0)
{
	&HTML<
	<html>
<head><style type="text/css">body{font-family:monospace;margin:0;padding:0}.yaml-container{padding:15px}.yaml-node{margin-left:20px;border-left:1px dashed #ccc;padding-left:10px}.collapsible{cursor:pointer;user-select:none}.collapsible::before{content:"▼ ";color:#666;display:inline-block;width:15px}.collapsed::before{content:"► "}.collapsed+.yaml-node{display:none}.key{color:#0066cc;font-weight:bold}.string{color:#cc6600}.number{color:#9900cc}.boolean{color:#cc0066}.null{color:#999;font-style:italic}.array-item{margin-left:20px}.array-item::before{content:"- ";color:#666}</style></head>
<body><div class="yaml-container" id="yaml-container"></div>
<script type="text/javascript">
let yamlData;function renderYaml(e,t){t.innerHTML="";renderNode(e,t);document.querySelectorAll(".collapsible").forEach(e=>{e.addEventListener("click",function(){this.classList.toggle("collapsed")})})}function renderNode(e,t,n=!1){if("object"!=typeof e||null===e){const n=document.createElement("span");n.className=getValueClass(e),n.textContent=formatValue(e),t.appendChild(n);return}if(Array.isArray(e))e.forEach(e=>{const n=document.createElement("div");n.className="array-item",renderNode(e,n,!0),t.appendChild(n)});else for(const n in e)if(e.hasOwnProperty(n)){const a=document.createElement("div"),c=document.createElement("span");if(c.className="key",c.textContent=n+": ","object"==typeof e[n]&&null!==e[n]){c.className+=" collapsible",a.appendChild(c);const t=document.createElement("div");t.className="yaml-node",renderNode(e[n],t),a.appendChild(t)}else{a.appendChild(c);const t=document.createElement("span");t.className=getValueClass(e[n]),t.textContent=formatValue(e[n]),a.appendChild(t)}t.appendChild(a)}}function getValueClass(e){return null===e?"null":"string"==typeof e?"string":"number"==typeof e?"number":"boolean"==typeof e?"boolean":""}function formatValue(e){return null===e?"null":"string"==typeof e?`"${e}"`:e.toString()}document.addEventListener("DOMContentLoaded",function(){const e=document.getElementById("yaml-container");renderYaml(yamlData,e)});</script></body>
</html>
	>
}

/// This method is called by the Management Portal to display a message-specific content viewer.<br>
/// This method displays its content by writing out to the current device.
/// The content should match the type returned by the <method>%GetContentType</method> method.<br>
Method %ShowContents(pZenOutput As %Boolean = 0)
{
	set jsonObject = ..GetObjectJson()
	set format = %request.Get("FORMAT")
    if format="JSON" {
	    #; JSON is formatted by default; the browser’s pretty-print is optional.
		set formatter = ##class(%JSON.Formatter).%New()
		do formatter.Format(jsonObject)
        quit $$$OK
    }
	&HTML<<html><script type="text/javascript">yamlData=#(jsonObject)#;</script></html>>
	Quit $$$OK
}

/// Converts an ObjectScript Dynamic Object or Dynamic Array to a YAML string.
ClassMethod DynamicObjectToYAML1(pDynamicEntity, pIndentLevel = 0, IsHTML As %Boolean = 0, ByRef tYAML)
{
	Set delim = $Select(IsHTML:"<br>",1:$C(13,10))
    // Use proper spaces for indentation
   Set $P(tIndent, " ", pIndentLevel)=" "

    // Handle Dynamic Object
    If $ISObject(pDynamicEntity)&&pDynamicEntity.%IsA("%DynamicObject") {
        Set tIterator = pDynamicEntity.%GetIterator()
        While tIterator.%GetNext(.tKey, .tValue) {
            Do tYAML.Write(tIndent _ tKey _ ": ")

            // Handle nested structures recursively
            If $IsObject(tValue)&&tValue.%IsA("%DynamicAbstractObject") {
                // Write a line break, then make the recursive call.
                // DO NOT concatenate the recursive call's return value.
                Do tYAML.Write(delim)
                Do ..DynamicObjectToYAML1(tValue, pIndentLevel + 2, IsHTML, .tYAML)
            } Else {
                // Simple value (string, number, boolean)
                If '$IsValidNum(tValue) {
                    Do tYAML.Write( """" _ tValue _ """" _ delim)
                } Else {
                    Do tYAML.Write( tValue _ delim)
                }
            }
        }
    }

    // Handle Dynamic Array (YAML lists)
    ElseIf $ISObject(pDynamicEntity)&&pDynamicEntity.%IsA("%DynamicArray") {
        Set tIterator = pDynamicEntity.%GetIterator()
        While tIterator.%GetNext(.tKey, .tValue) {

            If $IsObject(tValue)&&tValue.%IsA("%DynamicAbstractObject") {
                // For a list of objects/arrays, the '- ' is on its own line.
                // Note the increased indent level for the nested call.
                Do tYAML.Write(tIndent _ "- " _ delim)
                Do ..DynamicObjectToYAML1(tValue, pIndentLevel + 2, IsHTML, .tYAML)
            } Else {
                // Simple array element
                Do tYAML.Write(tIndent _ "- ")
                If '$IsValidNum(tValue) {
                    Do tYAML.Write( """" _ tValue _ """" _ delim)
                } Else {
                    Do tYAML.Write( tValue _ delim)
                }
            }
        }
    }
}

Storage Default
{
<Data name="MessageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Grongier.YAMLTrace267B.MessageD</DataLocation>
<DefaultData>MessageDefaultData</DefaultData>
<IdLocation>^Grongier.YAMLTrace267B.MessageD</IdLocation>
<IndexLocation>^Grongier.YAMLTrace267B.MessageI</IndexLocation>
<StreamLocation>^Grongier.YAMLTrace267B.MessageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
