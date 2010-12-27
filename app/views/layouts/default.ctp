<?php
  // JS Default
  $combinator->add_libs('js', array('jquery-1.4.2.min'));
  $combinator->add_libs('js', array('main'));
  
  // CSS Default
  $combinator->add_libs('css', array('reset'));
  $combinator->add_libs('css', array('style'));
?>
<!DOCTYPE HTML>
  <html lang="pt-br">
    <head>
      <meta charset="utf-8">
      <meta name="author" content="Jonathan da Silva de Faria">
      <meta name="description" content="Blog e Site pessoal de Jonathan da Silva de Faria, conteudos relacionado a programação, dicas e códigos feitos no dia dia.">
      <meta name="keywords" content="cakephp,javascript,css3,iphone,html5,programacao,php,textmate,git,github">
      <title>jonysilva.com - <?php echo $title_for_layout; ?></title>
      <?php echo $combinator->scripts('js')."\r";?>
      <?php echo $combinator->scripts('css')."\r";?>
      <?php echo $html->css('print', 'stylesheet', array('media' => 'print'))."\r";?>
      <!--[if IE 6]><?php echo $html->css("ie6") ?><?php echo $javascript->link("asn") ?><![endif]--><!--[if IE 7]><?php echo $html->css("ie7") ?><?php echo $javascript->link("asn") ?><![endif]--><!--[if IE 8]><?php echo $html->css("ie8") ?><![endif]--><!--[if IE 9]><?php echo $html->css("ie9") ?><![endif]-->      
    </head>
    <body>
      <!-- Begin #main -->
      <div id="main"><?php echo "\r".$content_for_layout."\r"; ?>
      <!-- End #main -->
      </div>
    </body>
  </html>