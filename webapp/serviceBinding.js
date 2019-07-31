function initModel() {
	var sUrl = "/sap/opu/odata/sap/ZJBE_DEMO_FIELDCONTROL_SRV/";
	var oModel = new sap.ui.model.odata.ODataModel(sUrl, true);
	sap.ui.getCore().setModel(oModel);
}