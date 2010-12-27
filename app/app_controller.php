<?php
  class AppController extends Controller {
    
    var $helpers = array('Html', 'Form', 'Javascript','Combinator.Combinator');
      
    function afterFilter()
    {
      //$this->error(404, 'Not found', 'This page was not found, sorry');
    }    
    
  }
?>