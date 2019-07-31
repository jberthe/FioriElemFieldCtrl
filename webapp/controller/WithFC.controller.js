sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";

	return Controller.extend("FieldControl.DemoJBEFieldControl.controller.WithFC", {
		onInit: function () {
			let oTable = this.getView().byId("idTable").getTable();
			oTable.setSelectionMode(sap.ui.table.SelectionMode.Single);
			oTable.attachRowSelectionChange(this._onSelectionChange.bind(this));

			oTable = this.getView().byId("idTable2").getTable();
			oTable.setSelectionMode(sap.ui.table.SelectionMode.Single);
			oTable.attachRowSelectionChange(this._onSelectionChange2.bind(this));

		},

		_onSelectionChange: function (oEvent) {
			let oForm = this.getView().byId("idForm");
			debugger;
			oForm.bindElement(oEvent.getParameter("rowContext").getPath());

		},

		_onSelectionChange2: function (oEvent) {
			let oForm = this.getView().byId("idForm2");
			debugger;
			oForm.bindElement(oEvent.getParameter("rowContext").getPath());

		}

	});
});