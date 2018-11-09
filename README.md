# ABAPUnitTests
Unit test in ABAP

This simple example shows how to write ABAP Unit Tests.

## ZCL_ABAP_UNIT_TEST
This simple class is used for calculations on elephants.  
Method 'is_elephant_big' checks if passed elephant is big.  
Method 'sum_two_elephants' sums two elephants (it's a very special kind of elephant, represented in integer).  
There is also a private attribute which keeps a name of the biggest elephant from our elephant database. Our elephant API deals with extracting data from database, which needs to be instantiated in constructor.

## ZIF_ABAP_UNIT_TEST_API
API class implements interface zif_abap_unit_test_api. It is required to perform mock API object injection in our elephant class constructor.

## LTCL_TEST_CLASS

