Connects to Azure CV service through Ballerina.

# Module Overview

## Compatibility
| Ballerina Language Version 
| -------------------------- 
| Swan Lake Preview5                    

## Sample

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
