// JavaScript Document

$(function(){

  $('#ex3c')
    .jqDrag('.jqDrag')
    .jqResize('.jqResize')
    .jqm({
      trigger:'#ex3cTrigger',
      overlay: 0,
      onShow: function(h) {

    	$("#ex3c .jqmnContent").html("<object classid='CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6' id='player'  width='320' height='260'><param name='url' value='http://streaming03.brlogic.com/castcontrol/playlist.php?id=167&type=asx' /><param name='src' value='http://streaming03.brlogic.com/castcontrol/playlist.php?id=167&type=asx' />	<param name='showcontrols' value='true' /> <param name='autostart' value='true' /><!--[if !IE]>-->   <object type='video/x-ms-wmv' data='http://streaming03.brlogic.com/castcontrol/playlist.php?id=167&type=asx' width='320' height='260' ><param name='src' value='http://streaming03.brlogic.com/castcontrol/playlist.php?id=167&type=asx' /><param name='autostart' value='true' />	<param name='controller' value='true' /></object><!--<![endif]--> </object>");
		//$("#ex3c .jqmnContent").html("<iframe src='http://www.106fmgospel.com.br/online.php' width='385' height='289' border='0' scrolling='no' frameborder='0' />");
		
        h.w.css('opacity',0.92).slideDown(); 
        },
      onHide: function(h) {
	  	
		$("#ex3c .jqmnContent").html('');
		h.w.slideUp("slow",function() { if(h.o) h.o.remove(); });
		} 
      });
  
  $('#ex4c')
  .jqDrag('.jqDrag')
  .jqResize('.jqResize')
  .jqm({
    trigger:'#ex4cTrigger',
    overlay: 0,
    onShow: function(h) {

		//document.getElementById("jqmnContent").innerHTML = "<object classid='CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6' id='player'  width='320' height='260'><param name='url' value='http://streaming03.brlogic.com/castcontrol/playlist.php?id=167&type=asx' /><param name='src' value='http://streaming03.brlogic.com/castcontrol/playlist.php?id=167&type=asx' />	<param name='showcontrols' value='true' /> <param name='autostart' value='true' /><!--[if !IE]>-->   <object type='video/x-ms-wmv' data='http://streaming03.brlogic.com/castcontrol/playlist.php?id=167&type=asx' width='320' height='260' ><param name='src' value='http://streaming03.brlogic.com/castcontrol/playlist.php?id=167&type=asx' /><param name='autostart' value='true' />	<param name='controller' value='true' /></object><!--<![endif]--> </object>";
		$("#ex4c .jqmnContent").html("<iframe src='http://www.106fmgospel.com.br/online.php' width='385' height='289' border='0' scrolling='no' frameborder='0' />");
		
      h.w.css('opacity',0.92).slideDown(); 
      },
    onHide: function(h) {
	  	
    	$("#ex4c .jqmnContent").html('');
		h.w.slideUp("slow",function() { if(h.o) h.o.remove(); });
		} 
    });  
  
 // Executar();
});

function Executar()
{
	document.getElementById("ex3cTrigger").click();
}

function Executar2()
{
	//alert('ola');
	document.getElementById("ex4cTrigger").click();
}

var retorno = false;
var retorno2 = false;
var i=0;
var j=0;

time = setInterval("upclock()",100);
function upclock(){
	var hoje   = new Date();
	var hora = hoje.getHours();
	var minutos = hoje.getMinutes();	
	var diadasemana = new Array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado");
	var diaSemana = diadasemana[hoje.getDay()];	
	if(diaSemana != "Sábado" && diaSemana != "Domingo" && hora >=17){
		if (hora == 17) {
			if (minutos >= 25) {
				if (i == 0) {										
					i = 1;
				}
				//alert('ola');				
				clearInterval(time);
				document.getElementById("ex3c").style.display = 'none';			
				
				
			}
		}else{		
				if (i == 0) {										
					i = 1;
				}			
				
				
				document.getElementById("ex3c").style.display = 'none';
				
		}
	}	
}

time2 = setInterval("upclock2()",100);
function upclock2(){
	var hoje   = new Date();
	var hora = hoje.getHours();
	var minutos = hoje.getMinutes();	
	var diadasemana = new Array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado");
	var diaSemana = diadasemana[hoje.getDay()];	
	
	if(diaSemana == "Sexta-Feira" && hora >=22){
		if (hora == 22) {
			if (minutos >= 55) {
				if (j == 0) {										
					j = 1;
				}
				//alert('ola');				
				clearInterval(time2);
				document.getElementById("ex4c").style.display = 'none';			
				
				
			}
		}else{		
				if (j == 0) {										
					j = 1;
				}			
				
				
				document.getElementById("ex4c").style.display = 'none';
				
		}
	}	
}
