# Export SSIS dtsx to 
This Python script [ssisdtsxexport.py](\ssisdtsxexport.py) will parse the .dtsx file and extract the tasks, parameters, and property nodes, storing them in lists. You can then process these lists as needed.

##  Example .dtsx File Content
```
<DTS:Executable xmlns:DTS="www.microsoft.com/SqlServer/Dts">
    <DTS:Executable DTS:ExecutableType="Microsoft.SqlServer.Dts.Tasks.ExecuteSQLTask.ExecuteSQLTask, Microsoft.SqlServer.SQLTask">
        <DTS:Property DTS:Name="SqlStatementSource">SELECT * FROM MyTable</DTS:Property>
    </DTS:Executable>
    <DTS:Parameter DTS:Name="MyParameter" DTS:DataType="String">ParameterValue</DTS:Parameter>
    <DTS:Property DTS:Name="SomeProperty">PropertyValue</DTS:Property>
</DTS:Executable>

```

##  Example output
```
Tasks: [{'DTS:ExecutableType': 'Microsoft.SqlServer.Dts.Tasks.ExecuteSQLTask.ExecuteSQLTask, Microsoft.SqlServer.SQLTask'}]
Parameters: [{'DTS:Name': 'MyParameter', 'DTS:DataType': 'String'}]
Properties: [{'DTS:Name': 'SqlStatementSource'}, {'DTS:Name': 'SomeProperty'}]
```