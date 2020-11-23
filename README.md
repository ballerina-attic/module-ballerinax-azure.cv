# Ballerina Azure CV Service Connector

This connector allows to use the Azure CV service through Ballerina. The following section provide you the details on the connector operations.

## Compatibility
| Ballerina Language Version 
| -------------------------- 
| Swan Lake Preview5                    

The following sections provide you with information on how to use the Azure CV Service Connector.

- [Working with Azure CV Service Connector actions](#working-with-azure-cv-service-connector)
- [Sample](#sample)

### Working with Azure CV Service Connector

First, import the `ballerinax/azure.cv` module into the Ballerina project.

```ballerina
import ballerinax/azure.cv;
```

In order for you to use the Azure CV service connector, first you need to create an Azure CV service connector configuration.

```ballerina
cv:Configuration config = {
    key: config:getAsString("KEY")
};

cv:Client cvClient = new(config);
```

##### Sample

```ballerina
import ballerina/config;
import ballerina/io;
import ballerinax/azure.cv;

cv:Configuration config = {
    key: config:getAsString("KEY"),
    region: "eastus"
};

cv:Client cvClient = new(config);

public function main(string... args) {
    var result = cvClient->ocr("https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Atomist_quote_from_Democritus.png/338px-Atomist_quote_from_Democritus.png");
    io:println(result);
}
```
