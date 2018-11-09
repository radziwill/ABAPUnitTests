CLASS zcl_abap_unit_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name          TYPE string
                                   io_elephants_api TYPE REF TO zif_abap_unit_test_api OPTIONAL.
								   
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mo_elephants_api         TYPE REF TO zif_abap_unit_test_api,
          mv_name                  TYPE string,
          mv_biggest_elephant_name TYPE string.
		
	METHODS: is_elephant_big IMPORTING iv_elephant_name       TYPE string
                             RETURNING VALUE(rv_big_elephant) TYPE abap_bool,
             sum_two_elephants IMPORTING iv_first_elephant          TYPE i
                                         iv_second_elephant         TYPE i
                               RETURNING VALUE(rv_sum_of_elephants) TYPE i.
ENDCLASS.



CLASS ZCL_ABAP_UNIT_TEST IMPLEMENTATION.

  METHOD constructor.
    mv_name = iv_name.
    IF io_elephants_api IS NOT INITIAL.
      mo_elephants_api = io_elephants_api.
      mv_biggest_elephant_name = mo_elephants_api->get_biggest_elephant( ).
    ENDIF.
  ENDMETHOD.


  METHOD is_elephant_big.
    rv_big_elephant = COND #( WHEN iv_elephant_name CA 'BIG' THEN abap_true
                              ELSE abap_false ).
  ENDMETHOD.


  METHOD sum_two_elephants.
    rv_sum_of_elephants = iv_first_elephant + iv_second_elephant.
  ENDMETHOD.
ENDCLASS.