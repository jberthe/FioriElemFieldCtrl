CLASS zcl_jbe_demo_fieldcon_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_jbe_demo_fieldcon_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.

    METHODS addresseswithfc_get_entityset
        REDEFINITION .
    METHODS addresseswithfc_get_entity
        REDEFINITION .
    METHODS addresseswithout_get_entityset REDEFINITION.
        METHODS addresseswithout_get_entity REDEFINITION.
    METHODS properties_get_entityset REDEFINITION.
    METHODS properties_get_entity REDEFINITION.
  PRIVATE SECTION.

    METHODS get_data
      EXPORTING
        !et_data TYPE zcl_jbe_demo_fieldcon_mpc=>tt_addresswithfc .
ENDCLASS.



CLASS zcl_jbe_demo_fieldcon_dpc_ext IMPLEMENTATION.


  METHOD addresseswithfc_get_entity.
    me->get_data( IMPORTING et_data = DATA(lt_entityset) ).

    er_entity = lt_entityset[ id = VALUE #( it_key_tab[ 1 ]-value OPTIONAL )  ].
  ENDMETHOD.


  METHOD addresseswithfc_get_entityset.
    me->get_data( IMPORTING et_data = et_entityset ).
  ENDMETHOD.


  METHOD get_data.
    et_data = VALUE #(
    ( id = '1' city = 'Paris' number = '4' street = 'Rue 01' fc_city = 0 fc_number = 7 fc_street = 1 )
    ( id = '2' city = 'Madrid' number = '3' street = 'Rue 02' fc_city = 1 fc_number = 3 fc_street = 7 )
    ( id = '3' city = 'London' number = '12' street = 'Rue 03' fc_city = 1 fc_number = 1 fc_street = 7 )
    ( id = '4' city = 'Berlin' number = '34' street = 'Rue 04' fc_city = 3 fc_number = 7 fc_street = 3 )
     ).
  ENDMETHOD.

  METHOD addresseswithout_get_entityset.
    me->get_data( IMPORTING et_data = DATA(lt_entityset) ).
    et_entityset = CORRESPONDING #( lt_entityset ).
  ENDMETHOD.

  METHOD properties_get_entityset.
    me->get_data( IMPORTING et_data = DATA(lt_entityset) ).
    et_entityset = CORRESPONDING #( lt_entityset ).
  ENDMETHOD.

  METHOD properties_get_entity.
    me->get_data( IMPORTING et_data = DATA(lt_entityset) ).
    MOVE-CORRESPONDING lt_entityset[ id = VALUE #( it_key_tab[ 1 ]-value OPTIONAL )  ] to er_entity.

  ENDMETHOD.

  METHOD addresseswithout_get_entity.
    me->get_data( IMPORTING et_data = DATA(lt_entityset) ).
    MOVE-CORRESPONDING lt_entityset[ id = VALUE #( it_key_tab[ 1 ]-value OPTIONAL )  ] to er_entity.

  ENDMETHOD.

ENDCLASS.