INTERFACE zif_abap_unit_test_api
  PUBLIC .
  DATA:
    mt_elephants TYPE HASHED TABLE OF zcl_abap_unit_test_types=>ty_elephants WITH UNIQUE KEY name.
  METHODS:
    get_biggest_elephant RETURNING VALUE(rv_biggest_elephant) TYPE string,
    get_smallest_elephant RETURNING VALUE(rv_smallest_elephant) TYPE string,
    is_elephant_with_name IMPORTING iv_name                   TYPE string
                          RETURNING VALUE(rv_elephant_exists) TYPE abap_bool.
ENDINTERFACE.