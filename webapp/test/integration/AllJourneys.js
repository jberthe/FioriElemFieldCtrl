/* global QUnit*/

sap.ui.define([
	"sap/ui/test/Opa5",
	"FieldControl/DemoJBEFieldControl/test/integration/pages/Common",
	"sap/ui/test/opaQunit",
	"FieldControl/DemoJBEFieldControl/test/integration/pages/WithFC",
	"FieldControl/DemoJBEFieldControl/test/integration/navigationJourney"
], function (Opa5, Common) {
	"use strict";
	Opa5.extendConfig({
		arrangements: new Common(),
		viewNamespace: "FieldControl.DemoJBEFieldControl.view.",
		autoWait: true
	});
});