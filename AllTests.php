<?php


require_once "AiryUnitTest.php";

class Airy_AllTests extends PHPUnit_Framework_TestSuite
{
    public static function suite()
    {
        $rootLoc = dirname(__FILE__);
        $suite = new PHPUnit_Framework_TestSuite('AiryMVC Framework - Test Suite');
 		$suite->addTestFile($rootLoc.'/app/lib/db/MysqlComponentTest.php');
 		$suite->addTestFile($rootLoc.'/app/lib/db/SqlDbTest.php');
 		$suite->addTestFile($rootLoc.'/app/lib/db/MssqlComponentTest.php');

//  		$suite->addTestFile($rootLoc.'/app/lib/db/MongoDbAccessTest.php');

        
		return $suite;
    }
}