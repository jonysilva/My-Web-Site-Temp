package com.jonathansilva.utils
{
	import com.jonathansilva.ui.player.Mp3Event;
	import com.jonathansilva.ui.player.Mp3Lite;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.utils.*;
	import flash.events.*;
	import flash.text.TextFormat;
	import flash.geom.Rectangle;
	import flash.external.*;

	public class  Player extends MovieClip
	{
		private var player:Mp3Lite;
		private var myForm:TextFormat;
		private var mcPlayer:MovieClip;
		public var tipo:String;
		public var musica:int;
		public var tempo:int;
		private var n:Number = 1;
		private var tempVol:Number = 1;
		public var limpa:*;
				
		public function Player(_mcPlayer:MovieClip):void
		{
			mcPlayer = _mcPlayer;
		}
		public function init():void
		{
			configurePlayer();
			configureEvents();			
			configureControls();			
		}
		
		private function configurePlayer():void
		{
			myForm = new TextFormat;
			myForm.color = 0xFFFFFF;
			myForm.font = "Arial";			
			myForm.size = 11;
			//down.volume = Number(-0.2);
			//up.volume = Number(0.2);
			player = new Mp3Lite(mcPlayer);
			//player.setProgress(progresso, seekbar, bg);
			//player.setID3Info(mcPlayer.texto_txt);
			player.setTimeInfo(mcPlayer.texto_txt);
			//player.setPlaylist(mcPlayer.playListAnimation_mc.playList_mc.content, 280, myForm);			
			//player.setXMLList("http://www.ederlima.com.br/arquivos/flash/001/orkutMP3List.xml");
			player.setXMLList("/flash/php/Flash.xml.radio.php");
			
			trace(tipo);
			
			if(tipo == "pause"){				
				mcPlayer.pause_mc.gotoAndStop(2);
			}else if(tipo == "play"){
				if(musica)
					player.start(musica);				  
				else
					player.start();					
			}
			
			
			
			
			//player.start();
		}
		private function configureEvents():void
		{
			trace("DEBUG - MP3Lite :");
			// Events 
			player.addEventListener(Mp3Event.ON_START, function (e) { trace("//JonnySilva: started"); mcPlayer.pause_mc.prevFrame(); limpa = setInterval(statusPlay, 2000); } );
			player.addEventListener(Mp3Event.ON_PROGRESS, function (e){})
			player.addEventListener(Mp3Event.ON_PAUSE, function(e) { trace("paused"); mcPlayer.pause_mc.nextFrame();  } );
			player.addEventListener(Mp3Event.ON_RESUME, function(e) { trace("resumed");mcPlayer.pause_mc.prevFrame(); } );
			player.addEventListener(Mp3Event.ON_STOP, function(e) { trace("stoped"); mcPlayer.pause_mc.gotoAndStop(2); } );
			player.addEventListener(Mp3Event.ON_NEXT, function(e) { trace("next song") } );
			player.addEventListener(Mp3Event.ON_PREVIOUS, function(e) { trace("previous song") } );
			player.addEventListener(Mp3Event.ON_REPEAT, function(e) { trace("repeating song") } );
			player.addEventListener(Mp3Event.ON_SHUFFLE, function(e) { trace("shuffling song") } );
			player.addEventListener(Mp3Event.ON_COMPLETE, function(e) { trace("song complete") } );
			player.addEventListener(Mp3Event.ON_PLAYLIST, function(e) { trace("//JonnySilva: playlist loaded") } );
			player.addEventListener(Mp3Event.ON_SEEK, function(e) { trace("seek") } );
			player.addEventListener(Mp3Event.ON_FIRST, function (e) { trace("first") } );
			player.addEventListener(Mp3Event.ON_LAST, function (e) { trace("last") } );
			player.addEventListener(Mp3Event.ON_CHANGE, function (e) { trace("change")} );
			// Events			
			function onStart():void{
				
			}
		}
		
		private function configureControls():void
		{			
			mcPlayer.volume_mc.buttonMode=  mcPlayer.next_mc.buttonMode = mcPlayer.back_mc.buttonMode = mcPlayer.pause_mc.buttonMode = mcPlayer.stop_mc.buttonMode =true;
			//mcPlayer.play_mc.addEventListener(MouseEvent.CLICK, playSound);		
			mcPlayer.pause_mc.addEventListener(MouseEvent.CLICK, pauseSound);
			mcPlayer.stop_mc.addEventListener(MouseEvent.CLICK, stopSound);
			mcPlayer.back_mc.addEventListener(MouseEvent.CLICK, prevSound);
			mcPlayer.next_mc.addEventListener(MouseEvent.CLICK, nextSound);			
			mcPlayer.volume_mc.addEventListener(MouseEvent.MOUSE_DOWN, downClic);
			mcPlayer.volume_mc.addEventListener(MouseEvent.MOUSE_UP, upClic);
			mcPlayer.mute_mc.addEventListener(MouseEvent.MOUSE_UP, mute);
		}
		
		private function statusPlay():void
		{
			trace("========================================");			
			trace("Tipo: " +tipo);
			if(tipo == "play")
				trace("Musica: " + player.getSongId);
			else
				trace("Musica: " + musica);
			if(player.getActualTimeString)
				trace("Tempo: " + player.getActualTimeNumber);
			else
				trace("Tempo: 0");
				
			ExternalInterface.call("playStatus", tipo,player.getSongId,player.getActualTimeNumber);
		}
		
		private function mute(e):void
		{
			if(mcPlayer.volume_mc.x == "140"){
				mcPlayer.volume_mc.x = 169;
				player.setVolume(2);
			}else{
				mcPlayer.volume_mc.x = 140;
				player.setVolume(0);
			}
		}
		private function downClic(e:MouseEvent):void
		{
			mcPlayer.addEventListener(Event.ENTER_FRAME,monitora);
			var myRectangle:Rectangle = new Rectangle(140, 7, 29, .5);
			mcPlayer.volume_mc.startDrag(false,myRectangle);
			trace("Clicou");
		}	
		private function monitora(e):void
		{
			var num:Number = ((((-(140-mcPlayer.volume_mc.x))*200)/29)/200);
			player.setVolume(num);
		}
		private function upClic(e:MouseEvent):void
		{
			trace("DesClicou");
			mcPlayer.removeEventListener(Event.ENTER_FRAME,monitora);
			mcPlayer.volume_mc.stopDrag();
		}			
		
		private function firstSound(e:MouseEvent):void
		{
			if(tipo != "pause")
				player.first();
		}
		private function lastSound(e:MouseEvent):void
		{
			if(tipo != "pause")
				player.last();
		}
		private function repeatOrNot(e:MouseEvent):void
		{
			if(tipo != "pause")			
				player.toggleRepeating();
		}
		private function shuffleOrNot(e:MouseEvent):void
		{
			if(tipo != "pause")
				player.toggleShuffling();
		}
		private function playSound(e:MouseEvent):void
		{
			if(tipo != "pause")			
				player.pause();
			
		}
			
		private function pauseSound(e:MouseEvent):void
		{
			if(tipo != "pause"){
				if(mcPlayer.texto_txt.text == "stopped..."){
					player.play();
					tipo = "play";
				}else{
					player.pause();
					tipo = "pause";
				}
			}else{
				player.start(musica);
				tipo = "play";								
			}
		}
			
		private function stopSound(e:MouseEvent):void
		{
			if(tipo != "pause"){
				player.stop();
				tipo = "pause";
			}
		}
			
		private function prevSound(e:MouseEvent):void
		{
			if(tipo != "pause")
				player.previous()
		}
			
		private function nextSound(e:MouseEvent):void
		{
			if(tipo != "pause")
				player.next()
		}
		private function go(e:MouseEvent):void 
		{
			tempVol += Number(e.currentTarget.volume);
			if (tempVol <= 0) 
			{
				tempVol = 0;
				} else if (tempVol >=2) {
					tempVol = 2;
				}
				player.setVolume(tempVol);
		}
	}
	
}