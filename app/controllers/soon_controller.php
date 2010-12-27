<?php
class SoonController extends AppController {
  
  var $helpers = array('Html', 'Form', 'Javascript','Combinator.Combinator');
    
  function index()
  {
    // Rericted controller
    $this->redirect('/em-breve');
  }
  
  function soon()
  {   
    
    // Setter Title of Web Site
    $this->set('title_for_layout',"Em Breve novo Site");
        
  } 
  function afterFilter()
  {
    
  } 
  
}
?>