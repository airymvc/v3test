<?php



abstract class AiryUnitTest extends PHPUnit_Framework_TestCase {
	

    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp() {
    	$framework = "airymvc";
        set_include_path(dirname(dirname(dirname(__FILE__))) . "/{$framework}/");
        $this->includeTestFiles($framework);
        $this->testSetUp();
    }
    
    protected function includeTestFiles($framework) {
    	$frameworkRoot = dirname(dirname(__FILE__));
		require_once $frameworkRoot . "/{$framework}/core/Config.php";
		require_once $frameworkRoot . "/{$framework}/app/lib/db/DbInterface.php";
		require_once $frameworkRoot . "/{$framework}/app/lib/db/SqlComponent.php";
		require_once $frameworkRoot . "/{$framework}/app/lib/db/MysqlComponent.php";
		require_once $frameworkRoot . "/{$framework}/app/lib/db/MssqlComponent.php";
		require_once $frameworkRoot . "/{$framework}/app/lib/db/SqlDb.php";

    }
    
    public function testSetUp(){
    	
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown() {
        
    }
}