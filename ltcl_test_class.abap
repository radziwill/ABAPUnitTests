*"* use this source file for your ABAP unit test classes
CLASS ltcl_test_class DEFINITION DEFERRED.
CLASS zcl_abap_unit_test DEFINITION LOCAL FRIENDS ltcl_test_class.

CLASS ltcl_test_class DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      mo_class_under_test TYPE REF TO zcl_abap_unit_test,
      mv_first_elephant   TYPE i,
      mv_second_elephant  TYPE i,
      mv_elephant_name    TYPE string,
      mv_is_elephant_big  TYPE abap_bool,
      mv_sum_of_elephants TYPE i,
      mock_elephants_api type ref to zif_abap_unit_test_api.
    METHODS:
      "IT SHOULD
      setup,
      return_big_elephant FOR TESTING,
      return_small_elephant FOR TESTING,
      return_five_elephants FOR TESTING,
      return_seven_elephants FOR TESTING,
      "GIVEN
      given_big_elephant,
      given_small_elephant,
      given_two_elephants_of_sum_7,
      given_two_elephants_of_sum_5,
      "WHEN
      when_elephant_size_is_calc,
      when_elephants_are_added,
      "THEN
      then_return_big_elephant_true,
      then_return_big_elephant_false,
      then_return_sum_of_elephants_5,
      then_return_sum_of_elephants_7.

ENDCLASS.


CLASS ltcl_test_class IMPLEMENTATION.

  METHOD setup.

    mock_elephants_api = cast #( cl_abap_testdouble=>create( 'zif_abap_unit_test_api' ) ).
    cl_abap_testdouble=>configure_call( mock_elephants_api )->returning( 'BOB' ).
    mock_elephants_api->get_biggest_elephant( ).

    mo_class_under_test = NEW zcl_abap_unit_test( iv_name = 'Klasa testowa' io_elephants_api = mock_elephants_api ).
    CLEAR: mv_elephant_name,
           mv_first_elephant,
           mv_second_elephant.
  ENDMETHOD.

  METHOD return_big_elephant.
    given_big_elephant( ).
    when_elephant_size_is_calc( ).
    then_return_big_elephant_true( ).
  ENDMETHOD.

  METHOD return_five_elephants.
    given_two_elephants_of_sum_5( ).
    when_elephants_are_added( ).
    then_return_sum_of_elephants_5( ).
  ENDMETHOD.

  METHOD return_small_elephant.
    given_small_elephant( ).
    when_elephant_size_is_calc( ).
    then_return_big_elephant_false( ).
  ENDMETHOD.

  METHOD return_seven_elephants.
    given_two_elephants_of_sum_7( ).
    when_elephants_are_added( ).
    then_return_sum_of_elephants_7( ).
  ENDMETHOD.

  METHOD when_elephant_size_is_calc.
    mv_is_elephant_big = mo_class_under_test->is_elephant_big( mv_elephant_name ).
  ENDMETHOD.

  METHOD when_elephants_are_added.
    mv_sum_of_elephants = mo_class_under_test->sum_two_elephants( iv_first_elephant = mv_first_elephant iv_second_elephant = mv_second_elephant ).
  ENDMETHOD.

  METHOD given_big_elephant.
    mv_elephant_name = 'MR.BIG HAROLD'.
  ENDMETHOD.

  METHOD then_return_big_elephant_true.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = mv_is_elephant_big
        exp                  = abap_true
        msg                  = 'Elephant should be big'
        quit                 = if_aunit_constants=>no
    ).
  ENDMETHOD.

  METHOD given_small_elephant.
    mv_elephant_name = 'NORMAL PETER'.
  ENDMETHOD.

  METHOD then_return_big_elephant_false.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = mv_is_elephant_big
        exp                  = abap_false
        msg                  = 'Elephant should not be big'
        quit                 = if_aunit_constants=>no
    ).
  ENDMETHOD.

  METHOD given_two_elephants_of_sum_5.
    mv_first_elephant = 4.
    mv_second_elephant = 1.
  ENDMETHOD.

  METHOD then_return_sum_of_elephants_5.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = mv_sum_of_elephants
        exp                  = 5
        msg                  = |There should be 5 elephants but there are { mv_sum_of_elephants }|
        quit                 = if_aunit_constants=>no
    ).
  ENDMETHOD.

  METHOD given_two_elephants_of_sum_7.
    mv_first_elephant = 2.
    mv_second_elephant = 5.
  ENDMETHOD.

  METHOD then_return_sum_of_elephants_7.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = mv_sum_of_elephants
        exp                  = 7
        msg                  = |There should be 7 elephants but there are { mv_sum_of_elephants }|
        quit                 = if_aunit_constants=>no
    ).
  ENDMETHOD.

ENDCLASS.