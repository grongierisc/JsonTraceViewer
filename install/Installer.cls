Include %occInclude

Class App.Installer
{

ClassMethod ConfigureAutoStart(pNamespace As %String) As %Status
{
    Set tSC = $$$OK
    Try
    {
        ZN pNamespace
        Set tSC = $CLASSMETHOD("Ens.Director", "SetAutoStart", "RestToDll.Production", 0)
    }
    Catch (oException)
    {
        Set tSC = oException.AsStatus()
    }
    Quit tSC
}

XData Install [ XMLNamespace = INSTALLER ]
{
<Manifest>
    <Default Name="NAMESPACE" Value="DEMO"/>
    <Default Name="DBNAME" Value="DEMO"/>
    <Default Name="APPPATH" Dir="/opt/irisapp/" />
    <Default Name="SOURCESPATH" Dir="${APPPATH}src"/>
    <Default Name="RESOURCE" Value="%DB_${DBNAME}"/>

    <Log Text="Configuring namespace ${NAMESPACE} ..." Level="0"/>
    <Namespace Name="${NAMESPACE}" Code="${DBNAME}" Data="${DBNAME}" Create="yes" Ensemble="1">
        <Configuration>
            <Database Name="${DBNAME}" Dir="${MGRDIR}${DBNAME}" Create="yes"/>
        </Configuration>
        <Log Text="Offline install from ${SOURCESPATH} ..." Level="0"/>
        <Import File="${SOURCESPATH}" Flags="cukb" Recurse="true"/>
    </Namespace>

    <Namespace Name="${NAMESPACE}" Create="no">
        <Log Text="Configuring production to auto-start ..." Level="0"/>
        <Production Name="Demo.Production" AutoStart="1"/>
    </Namespace>

</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 0, pInstaller As %Installer.Installer) As %Status [ CodeMode = objectgenerator, Internal ]
{
     Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "Install")
}

}
