CLASS zcl_jbe_demo_fieldcon_mpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_jbe_demo_fieldcon_mpc
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS define
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS add_fc_anno
      IMPORTING
        !iv_entity_type   TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
        !iv_property_name TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
        !iv_field_ctrl    TYPE string
      RAISING
        /iwbep/cx_mgw_med_exception .
ENDCLASS.



CLASS zcl_jbe_demo_fieldcon_mpc_ext IMPLEMENTATION.
  METHOD add_fc_anno.
    DATA lo_entity_type    TYPE REF TO /iwbep/if_mgw_odata_entity_typ.
    DATA lo_nw_property   TYPE REF TO /iwbep/if_mgw_odata_property.
    DATA lo_anno          TYPE REF TO /iwbep/if_mgw_odata_annotation.
    DATA lo_anno_target   TYPE REF TO /iwbep/if_mgw_vocan_ann_target.

    lo_entity_type ?= me->model->get_entity_type( iv_entity_name = iv_entity_type ).
    lo_nw_property ?= lo_entity_type->get_property( iv_property_name = iv_property_name ).

    lo_anno ?= lo_nw_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( /iwbep/if_mgw_med_odata_types=>gc_sap_namespace ).
    lo_anno->add(
          EXPORTING
            iv_key      = 'field-control'
            iv_value    = iv_field_ctrl
          ).


  ENDMETHOD.


  METHOD define.
    super->define( ).
    me->add_fc_anno(
        iv_entity_type   = 'AddressWithFC'
        iv_property_name = 'Street'
        iv_field_ctrl    = 'Fc_Street'
    ).

    me->add_fc_anno(
        iv_entity_type   = 'AddressWithFC'
        iv_property_name = 'Number'
        iv_field_ctrl    = 'Fc_Number'
    ).

    me->add_fc_anno(
        iv_entity_type   = 'AddressWithFC'
        iv_property_name = 'City'
        iv_field_ctrl    = 'Fc_City'
    ).

        me->add_fc_anno(
        iv_entity_type   = 'AddressWithoutFC'
        iv_property_name = 'Street'
        iv_field_ctrl    = 'to_Property/Fc_Street'
    ).

    me->add_fc_anno(
        iv_entity_type   = 'AddressWithoutFC'
        iv_property_name = 'Number'
        iv_field_ctrl    = 'to_Property/Fc_Number'
    ).

    me->add_fc_anno(
        iv_entity_type   = 'AddressWithoutFC'
        iv_property_name = 'City'
        iv_field_ctrl    = 'to_Property/Fc_City'
    ).
  ENDMETHOD.
ENDCLASS.