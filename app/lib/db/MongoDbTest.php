<?php

/**
 * Test class for MongoDbAccess.
 */
class MongoDbTest extends AiryUnitTest {

    /**
     * @var MysqlAccess
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    public function testSetUp() {
    	$iniFile = dirname(dirname(dirname(dirname(__FILE__)))) . '/testfiles/test_config.ini';
    	$this->object = new DbAccess();
    	$this->object->config(0, $iniFile);
    	$testFilePath = dirname(dirname(dirname(dirname(__FILE__)))) . '/testfiles/test.sql';
		//create test database
//		$mysqli = new mysqli("localhost", "root", "root");
//		$mysqli->query("CREATE DATABASE airymvc_unit_test");
//		$mysqli->select_db("airymvc_unit_test");
//		$query = file_get_contents($testFilePath);
//		$mysqli->multi_query($query);
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown() {
		$mysqli = new mysqli("localhost", "root", "root");
//		$mysqli->query("DROP DATABASE airymvc_unit_test");    	 
    }

    /**
     * 
     * testing the where function
     */
    public function testWhere1() {
    	$condition = array("AND"=>array("="=>array("field_a"=>"value_a", "field2"=>"value2"), ">"=>array("field3"=>"value3")));
		$result = $this->object->where($condition)->getDbComponent()->getWherePart();
		$compare = " WHERE  `field_a` = 'value_a' AND `field2` = 'value2' AND `field3` > 'value3' ";
		$this->assertEquals($compare, $result);
    }
    
    public function testWhere2() {		
		$condition = array(""=>array("="=>array("field1" => "value1")));
		$result = $this->object->where($condition)->getDbComponent()->getWherePart();
		$compare = " WHERE  `field1` = 'value1' ";
		$this->assertEquals($compare, $result);
    }
    
    public function testWhereStr1() {		
		$condition = "`field1` > 2";
		$result = $this->object->where($condition)->getDbComponent()->getWherePart();
		$compare = " WHERE (`field1` > 2)";
		$this->assertEquals($compare, $result);
    }
    
    public function testWhereAnd() {		
		$condition = "`field1` > 2";
		$this->object->where($condition);
		$this->object->andWhere("`field2` > 3");
		$result = $this->object->orWhere("`field3` > 4")->getDbComponent()->getWherePart();
		$compare = " WHERE (`field1` > 2) AND (`field2` > 3) OR (`field3` > 4)";
		$this->assertEquals($compare, $result);
    }

    public function testSqlInjection() {
		$condition = "' OR ''='";
		$result = $this->object->andWhere($condition)->getDbComponent()->getWherePart();
		$compare = " AND (\' OR \'\'=\')";
		$this->assertEquals($compare, $result);    	
    }

    public function testInnerJoin() {		
		$tables = array("table1", "table2");
		$result = $this->object->innerJoin($tables)->getDbComponent()->getJoinPart();		
		$compare = " INNER JOIN `table1` INNER JOIN `table2`";
		$this->assertEquals($compare, $result);
    }
    
    public function testSelect1() {		
		$table = "table1";
		$columns = array ("count(*)", "col1", "col2");
		$result = $this->object->select($columns, $table)->getDbComponent()->getSelectPart();		
		$compare = "SELECT count(*), col1, col2 FROM `table1`";
		$this->assertEquals($compare, $result);
    }  

    public function testSelect2() {		
		$table = "table1";
		$columns = array ("count(*)", "col1", "col2");
		$result = $this->object->select($columns, $table, "distinct")->getDbComponent()->getSelectPart();		
		$compare = "SELECT DISTINCT count(*), col1, col2 FROM `table1`";
		$this->assertEquals($compare, $result);
    }
    
    public function testSelectString1() {		
		$table = "table1";
		$columns = array ("count(*), col1, col2");
		$result = $this->object->select($columns, $table, "distinct")->getDbComponent()->getSelectPart();		
		$compare = "SELECT DISTINCT count(*), col1, col2 FROM `table1`";
		$this->assertEquals($compare, $result);
    }
    
    public function testJoinOn1() {	

    	$condition = array ("AND" => array(array( "=", 'table1'=>'field1', 'table2'=>'field2'), 
    									   array("<>", 'table3'=>'field3', 'table2'=>'field2'),
                      					   array("<>", 'table4'=>'field4', 'table3'=>'field3')), 
                			 "OR" => array(array( "=", 'table5'=>'field5', 'table6'=>'field6')));

		$result = $this->object->joinOn($condition)->getDbComponent()->getJoinOnPart();		
		$compare = " ON  `table1`.`field1` = `table2`.`field2` AND `table3`.`field3` <> `table2`.`field2` AND `table4`.`field4` <> `table3`.`field3`  OR `table5`.`field5` = `table6`.`field6` ";
		$this->assertEquals($compare, $result);
    }    
    
    public function testJoinOn2() {	

    	$condition = array ("" => array(array("=", "table1"=>"field1", 
    											   "table2"=>"field2"
    	                                      )
    	                                )
    	                    );

		$result = $this->object->joinOn($condition)->getDbComponent()->getJoinOnPart();		
		$compare = " ON  `table1`.`field1` = `table2`.`field2` ";
		$this->assertEquals($compare, $result);
    } 
    
    public function testJoinOnString1() {	

    	$condition = "`table1`.`field1` = `table2`.`field2`";

		$result = $this->object->joinOn($condition)->getDbComponent()->getJoinOnPart();		
		$compare = " ON `table1`.`field1` = `table2`.`field2`";
		$this->assertEquals($compare, $result);
    } 

    public function testLimit() {	
		$result = $this->object->limit(10, 5)->getDbComponent()->getLimitPart();		
		$compare = " LIMIT 10, 5";
		$this->assertEquals($compare, $result);
    } 
    
    public function testGroupBy() {	
		$result = $this->object->groupBy("abc")->getDbComponent()->getGroupPart();		
		$compare = " GROUP BY abc";
		$this->assertEquals($compare, $result);
    } 
    
    public function testOrderBy() {	
		$result = $this->object->orderBy("abc")->getDbComponent()->getOrderPart();		
		$compare = " ORDER BY abc";
		$this->assertEquals($compare, $result);
		
		$result = $this->object->orderBy("abc", 1)->getDbComponent()->getOrderPart();		
		$compare = " ORDER BY abc DESC";
		$this->assertEquals($compare, $result);
    } 
    
    public function testInWhere() {	
		$this->object->inWhere("abc, def");
		$result = $this->object->getDbComponent()->getWherePart();		
		$compare = " IN (abc, def)";
		$this->assertEquals($compare, $result);
    } 
    
    public function testUpdate() {
    	$columns = array('column_name' => 'column_value', 'column_name1' => 'column_value1');
    	$table = 'table';	
		$result = $this->object->update($columns, $table)->getDbComponent()->getUpdatePart();		
		$compare = "UPDATE `table` SET `column_name`='column_value', `column_name1`='column_value1'";
		$this->assertEquals($compare, $result);
    }

    public function testInsert() {
    	$columns = array('column_name' => 'column_value', 'column_name1' => 'column_value1');
    	$table   = 'table';	
		$result  = $this->object->insert($columns, $table)->getDbComponent()->getInsertPart();		
		$compare = "INSERT INTO table ( `column_name`, `column_name1`) VALUES ('column_value', 'column_value1')";
		$this->assertEquals($compare, $result);
    }    
    
    public function testGetStatement1() {
    	$columns1 = array(0 => 'attendent.id',
    					  1 => 'attendent.img',
    					  2 => 'attendent.name',
    					  3 => 'award.name',
    					  4 => 'award.annotation',
    					  5 => 'activity_mng.attend_date');
    					  
		$joinTables1 = array(0 => 'activity_mng',
                     		 1 => 'award',);
		
        $condition1 = array("AND" => array(
        								   array("=", 'award'        => 'id',
                   									  'activity_mng' => 'award_id'),
        								   array("=", 'attendent'    => 'id',
                   									  'activity_mng' => 'attendent_id')
        								   )
        				    );

		$this->object->select($columns1, 'attendent');
		$this->object->innerJoin($joinTables1);
		$this->object->joinOn($condition1);

		$where1 = array("AND" => array("=" => array('activity_id' => 5), 
                              		   ">" => array('award_id' => 0)
                           			  )
              			);

		$this->object->where($where1);
		$result = $this->object->getDbComponent()->getStatement();
		$compare = "SELECT attendent.id, attendent.img, attendent.name, award.name, award.annotation, activity_mng.attend_date FROM `attendent` INNER JOIN `activity_mng` INNER JOIN `award` ON  `award`.`id` = `activity_mng`.`award_id` AND `attendent`.`id` = `activity_mng`.`attendent_id`  WHERE  `activity_id` = '5' AND `award_id` > '0' ";
		$this->assertEquals($compare, $result);
    }
    
    public function testGetStatement2() {
    	$columns1 = ("'attendent.id','attendent.img','attendent.name','award.name','award.annotation','activity_mng.attend_date'");
    					  
		$joinTables1 = array(0 => 'activity_mng',
                     		 1 => 'award',);

		$this->object->select($columns1, 'attendent')
					 ->innerJoin($joinTables1)
					 ->joinOn("`award`.`id` = `activity_mng`.`award_id`")
					 ->andJoinOn("`attendent`.`id` = `activity_mng`.`attendent_id`")
					 ->where("`activity_id` = 5")
					 ->andWhere("`award_id` > 0");

		$result = $this->object->getDbComponent()->getStatement();
		$compare = "SELECT 'attendent.id','attendent.img','attendent.name','award.name','award.annotation','activity_mng.attend_date' FROM `attendent` INNER JOIN `activity_mng` INNER JOIN `award` ON `award`.`id` = `activity_mng`.`award_id` AND `attendent`.`id` = `activity_mng`.`attendent_id` WHERE (`activity_id` = 5) AND (`award_id` > 0)";
		$this->assertEquals($compare, $result);
    }
    
    public function testGetStatement3() {
    	$columns1 = array(0 => 'attendent.id',
    					  1 => 'attendent.img',
    					  2 => 'attendent.name',
    					  3 => 'award.name',
    					  4 => 'award.annotation',
    					  5 => 'activity_mng.attend_date');
    					  
		$joinTables1 = array(0 => 'activity_mng',
                     		 1 => 'award',);

		$this->object->select($columns1, 'attendent')
					 ->innerJoin($joinTables1)
					 ->joinOn("`award`.`id` = `activity_mng`.`award_id`")
					 ->andJoinOn("`attendent`.`id` = `activity_mng`.`attendent_id`")
					 ->where("`activity_id` = 5")
					 ->andWhere("`award_id` > 0");

		$result = $this->object->getDbComponent()->getStatement();
		$compare = "SELECT attendent.id, attendent.img, attendent.name, award.name, award.annotation, activity_mng.attend_date FROM `attendent` INNER JOIN `activity_mng` INNER JOIN `award` ON `award`.`id` = `activity_mng`.`award_id` AND `attendent`.`id` = `activity_mng`.`attendent_id` WHERE (`activity_id` = 5) AND (`award_id` > 0)";
		$this->assertEquals($compare, $result);
    }

}

?>
