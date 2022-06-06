# Youbora sessions integration

## To integrate youbora sessions follow this documentation:
### This Session Feature  will allow Apps to send App events to Youbora BE in same context as the Players one.

https://documentation.npaw.com/npaw-integration/docs/application-analytics-custom-events-data-collection

This means: create a plugin instance that can be accessed globally, and call fireEvent() and fireNav() to report what you want.
with the Plugin Options you want

#### Init Example:
Init has to be created some time before creating the player youbora plugin config,
since it is async call and player should use the fastDataConfig that is creatred internally.

```
let appOptions = YBOptions();
appOptions.accountCode = "kalturatest";
appYBPlugin = YBPlugin(options: appOptions);

// To start tracking sessions
let appDimentions: [String: String] = [
	"customDimensionone": "App customDimensionone value",
	"customDimensiontwo": "App customDimensiontwo value"
]
appYBPlugin?.getInfinity().begin(withScreenName: "Screen1", andDimensions: appDimentions)
```

## Mix session analytics and video analytics
After init, to communicate youbora plugin for sessions and kaltura player youbora plugin:

### Before instantiating the player:
```
let youboradataconfig = appYBPlugin?.viewTransform.fastDataConfig
```
### Instantiating the player youbora plugin
#### YouboraConfig initiliazation with fastDataConfig params crfeated in appNpawPlugin's fastDataConfig (you must validate youboradataconfig values are not nil)

```
let youboraPluginParams: [String: Any] = [
            "accountCode": "kalturatest",
            
            "fastDataConfig": [
                "host": youboradataconfig?.host,
                "code": youboradataconfig?.code,
                "pingTime": youboradataconfig?.pingTime,
                "beatTime": youboradataconfig?.beatTime,
                "expirationTime": youboradataconfig?.expirationTime,
                "youboraId": youboradataconfig?.youboraId
            ]
        ]
```

### Sending app events to youbora:

#### Example:

```
// If you want to track navigation between your ViewControllers/Views
appYBPlugin?.getInfinity().fireNav(withScreenName: "Activity1");

let dimensions = ["dim1" : "value1", "dim2" : "value2"];
let values = ["value1" : NSNumber(1), "value2" : NSNumber(2)];
let topLevelDimensions = ["topDim1" : "value1", "topDim2" : "value2"];
           
appYBPlugin.getInfinity().fireEvent("EventName1", dimensions: dimensions, values: values, topLevelDimensions:topLevelDimensions);
            
appYBPlugin.getInfinity().fireEvent("EventName2", dimensions: dimensions, values: values, topLevelDimensions:nil);

let errDimensions = ["message" : "Error1"];
let errValues = ["code" : NSNumber(1000)];
appYBPlugin.getInfinity().fireEvent("Error", dimensions: errDimensions, values: errValues, topLevelDimensions:nil);
               
appYBPlugin.getInfinity().end()
```
