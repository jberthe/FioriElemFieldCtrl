# How to use Field Control with Smart Control
This repository is the full code base of the article posted to [SAP SCN](https://blogs.sap.com/2019/08/08/all-you-need-to-know-about-smartfields/).
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
## In SEGW (Back-End side)
- Create a project named *ZJBE_DEMO_FIELDCONTROL* 
- Import the XML metadata from the repository */ABAP/metadata.xml*
  - Rigth click on *Data Model* folder
  - Import > Data Model from File
- Generate the project
- Modify/import the both DPC_EXT and MPD_EXT file from */ABAP/*
- Register the service into your Front-End 

At this stage it should normally works :)
