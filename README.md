# How to use Field Control with Smart Control
This repository is the full code base of the article posted to SAP SCN.
The following detail will show you how to use this source code into your project in order to make it working fine :)

## In SAP WebIDE
Clone the full repository and modify the file *neo-app.json* at this point (near line 45):
```json
{
  "path": "/sap/opu/odata",
  "target": {
    "type": "destination",
    "name": "CHANGE_IT",
    "entryPath": "/sap/opu/odata"
  },
  "description": "CHANGE_IT"
}
```
