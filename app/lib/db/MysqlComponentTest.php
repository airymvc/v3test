<?php

use airymvc\app\lib\db\MysqlComponent;
use airymvc\app\lib\db\SqlComponent;


/**
 * Test class for MysqlAccess.
 * Generated by PHPUnit on 2012-05-02 at 21:48:07.
 */
class MysqlComponentTest extends AiryUnitTest {

    /**
     * @var MysqlAccess
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    public function testSetUp() {
    	$testSql = dirname(dirname(dirname(dirname(__FILE__)))) . '/testfiles/test.sql';
    	$testConfig = dirname(dirname(dirname(dirname(__FILE__)))) . '/testfiles/test_config.json';
    	
    	//create test database
    	$mysqli = new mysqli("localhost", "root", "root");
    	$mysqli->query("CREATE DATABASE airymvc_unit_test");
    	$mysqli->select_db("airymvc_unit_test");
    	$query = file_get_contents($testSql);
    	$mysqli->multi_query($query);
    	$mysqli->close();
    	
    	
    	$configArr = json_decode(file_get_contents($testConfig), TRUE);
    	$dbConfigArr = $configArr["%application_configs"][0]["%db"][0];
    	$this->object = new MysqlComponent();
    	$this->object->setDbConfig($dbConfigArr);
    	$this->object->setConnection();

    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown() {
		$mysqli = new mysqli("localhost", "root", "root");
		$mysqli->query("DROP DATABASE airymvc_unit_test");    	 
    }

    /**
     * 
     * testing the where function
     */
    public function testWhere1() {
    	$condition = array("AND"=>array("="=>array("field_a"=>"value_a", "field2"=>"value2"), ">"=>array("field3"=>"value3")));
		$result = $this->object->where($condition)->getWherePart();
		$compare = " WHERE  field_a = 'value_a' AND field2 = 'value2' AND field3 > 'value3' ";
		$this->assertEquals($compare, $result);
    }
    
    public function testWhere2() {		
		$condition = array(""=>array("="=>array("field1" => "value1")));
		$result = $this->object->where($condition)->getWherePart();
		$compare = " WHERE  field1 = 'value1' ";
		$this->assertEquals($compare, $result);
    }
    
    public function testWhereStr1() {		
		$condition = "`field1` > 2";
		$result = $this->object->where($condition)->getWherePart();
		$compare = " WHERE (`field1` > 2)";
		$this->assertEquals($compare, $result);
    }
    
    public function testWhereAnd() {		
		$condition = "`field1` > 2";
		$this->object->where($condition);
		$this->object->andWhere("`field2` > 3");
		$result = $this->object->orWhere("`field3` > 4")->getWherePart();
		$compare = " WHERE (`field1` > 2) AND (`field2` > 3) OR (`field3` > 4)";
		$this->assertEquals($compare, $result);
    }



    public function testLimit() {	
		$result = $this->object->limit(10, 5)->getLimitPart();		
		$compare = " LIMIT 10, 5";
		$this->assertEquals($compare, $result);
    } 
    
    public function testGroupBy() {	
		$result = $this->object->groupBy("abc")->getGroupPart();		
		$compare = " GROUP BY abc";
		$this->assertEquals($compare, $result);
    } 
    
    public function testOrderBy() {	
		$result = $this->object->orderBy("abc")->getOrderPart();		
		$compare = " ORDER BY abc";
		$this->assertEquals($compare, $result);
		
		$result = $this->object->orderBy("abc", 1)->getOrderPart();		
		$compare = " ORDER BY abc DESC";
		$this->assertEquals($compare, $result);
    } 
    
    public function testInWhere() {	
		$this->object->inWhere("abc, def");
		$result = $this->object->getWherePart();		
		$compare = " IN (abc, def)";
		$this->assertEquals($compare, $result);
    } 
    
    public function testUpdate() {
    	$columns = array('column_name' => 'column_value', 'column_name1' => 'column_value1');
    	$table = 'table';	
		$result = $this->object->update($columns, $table)->getUpdatePart();		
		$compare = "UPDATE table SET column_name='column_value', column_name1='column_value1'";
		$this->assertEquals($compare, $result);
    }

    public function testInsert() {
    	$columns = array('column_name' => 'column_value', 'column_name1' => 'column_value1');
    	$table   = 'table';	
		$result  = $this->object->insert($columns, $table)->getInsertPart();		
		$compare = "INSERT INTO table ( column_name, column_name1) VALUES ('column_value', 'column_value1')";
		$this->assertEquals($compare, $result);
    }    
    
    public function testGetStatement1() {
    	$columns1 = array(0 => 'attendent.id',
    					  1 => 'attendent.img',
    					  2 => 'attendent.name',
    					  3 => 'award.name',
    					  4 => 'award.annotation',
    					  5 => 'activity_mng.attend_date');
    					  
		$this->object->select($columns1, 'attendent');
		$this->object->innerJoinOn('activity_mng', 'attendent.id = activity_mng.attendent_id')
					 ->innerJoinOn('award', 'award.id = activity_mng.award_id');

		$where1 = array("AND" => array("=" => array('activity_id' => 5), 
                              		   ">" => array('award_id' => 0)
                           			  )
              			);

		$this->object->where($where1);
		$result = $this->object->getStatement();
		$compare = "SELECT attendent.id, attendent.img, attendent.name, award.name, award.annotation, activity_mng.attend_date FROM attendent INNER JOIN activity_mng ON attendent.id = activity_mng.attendent_id INNER JOIN award ON award.id = activity_mng.award_id WHERE  activity_id = '5' AND award_id > '0' ";
		$this->assertEquals($compare, $result);
    }
    
    public function testGetStatement2() {
    	$columns1 = ("attendent.id, attendent.img, attendent.name, award.name, award.annotation, activity_mng.attend_date");
    					  
		$joinTables1 = array(0 => 'activity_mng',
                     		 1 => 'award',);

		$this->object->select($columns1, 'attendent')
					 ->innerJoinOn('activity_mng', 'attendent.id = activity_mng.attendent_id')
					 ->innerJoinOn('award', 'award.id = activity_mng.award_id')
					 ->where("`activity_id` = 5")
					 ->andWhere("`award_id` > 0");

		$result = $this->object->getStatement();
		$compare = "SELECT attendent.id, attendent.img, attendent.name, award.name, award.annotation, activity_mng.attend_date FROM attendent INNER JOIN activity_mng ON attendent.id = activity_mng.attendent_id INNER JOIN award ON award.id = activity_mng.award_id WHERE (`activity_id` = 5) AND (`award_id` > 0)";
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
					 ->innerJoinOn('activity_mng', 'attendent.id = activity_mng.attendent_id')
					 ->innerJoinOn('award', 'award.id = activity_mng.award_id')
					 ->where("`activity_id` = 5")
					 ->andWhere("`award_id` > 0");

		$result = $this->object->getStatement();
		$compare = "SELECT attendent.id, attendent.img, attendent.name, award.name, award.annotation, activity_mng.attend_date FROM attendent INNER JOIN activity_mng ON attendent.id = activity_mng.attendent_id INNER JOIN award ON award.id = activity_mng.award_id WHERE (`activity_id` = 5) AND (`award_id` > 0)";
		$this->assertEquals($compare, $result);
    }
     
//     public function testExecute() {
//   		$this->object->select("*", "activity")
// 					 ->where("id > 2")
// 					 ->andWhere("id <= 3");
		  
// 		$pdoResult = $this->object->execute();
// 		$result = NULL;
// 		$count = 0;
// 		foreach ($pdoResult as $row) {
// 			if ($count == 0) {
// 				$result = $row;
// 			}
// 		}

// 		$compare = array('id' =>3, 'title'=>'act2');
// 		$this->assertEquals($compare['id'], $result['id']);
// 		$this->assertEquals($compare['title'], $result['title']);
		 	
//     }

//     public function testPrepare() {
//   		$pstatement = $this->object->prepare("SELECT * FROM activity where id = :id");
// 		$pstatement->execute(array('id' => 3));  
// 		$result = $pstatement->fetchAll();

// 		$compare = array('id' =>3, 'title'=>'act2');
// 		$this->assertEquals($compare['id'], $result[0]['id']);
// 		$this->assertEquals($compare['title'], $result[0]['title']);
		 	
//     }   

//     public function testCount() {
//     	$pdoResult = $this->object->execute("SELECT COUNT(*) FROM activity");
// 		$result = NULL;
// 		$count = 0;
// 		foreach ($pdoResult as $row) {
// 			if ($count == 0) {
// 				$result = $row;
// 			}
// 		}

// 		$compare = 3;
// 		$this->assertEquals($compare, $result["COUNT(*)"]);		
		 	
//     }

}

?>