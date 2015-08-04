<?php
require_once dirname(__FILE__) . '/../zframework/app/library/ui/JsUIComponentInterface.php';
require_once dirname(__FILE__) . '/../zframework/app/library/ui/jquery/JUIComponent.php';
require_once dirname(__FILE__) . '/../zframework/app/library/ui/html/UIComponent.php';
require_once dirname(__FILE__) . '/../zframework/app/library/ui/jquery/AutoCompleteTextField.php';
require_once dirname(__FILE__) . '/../zframework/app/library/ui/html/components/TextElement.php';


//put your code here
$selections = array("about", "apple", "tomato", "orange");
$acTextField = new AutoCompleteTextField('test_autoComplete');
$acTextField->setSelections($selections);
$acTextField->setLabel("testAuto", "testAuto");
echo $acTextField->render();

?>
