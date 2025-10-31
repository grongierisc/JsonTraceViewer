Class Demo.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Demo.BS.CustomerJSONService" Category="" ClassName="Demo.BS.CustomerJSONService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ThrottleDelay">5000</Setting>
  </Item>
  <Item Name="Demo.BS.CustomerXMLService" Category="" ClassName="Demo.BS.CustomerXMLService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ThrottleDelay">5000</Setting>
  </Item>
  <Item Name="Demo.BO.CustomerOperation" Category="" ClassName="Demo.BO.CustomerOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
   <Item Name="Demo.BS.CustomerYAMLService" Category="" ClassName="Demo.BS.CustomerYAMLService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">5000</Setting>
  </Item>
</Production>
}

}
