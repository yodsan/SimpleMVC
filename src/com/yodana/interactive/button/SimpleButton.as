package com.yodana.interactive.button {
	import com.yodana.utils.Log;

	import com.yodana.simplemvc.as3.core.Notification;
	import com.yodana.simplemvc.as3.core.View;
	import com.yodana.simplemvc.as3.interfaces.IView;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * 	@author     Yodana / 2010
	*/
	public class SimpleButton extends View implements IView
	{				
		//Label on the button.		
		private var _label: TextField;
		
		//MovieClip which holds the animation.
		private var _motor: MovieClip;
		
		//Notification object that will be dispatched on mouse down events.
		private var _notification: Notification;
		
		//Copy for the label.
		private var _copy: String;
		
		//TextFormat used on label
		private var _format: TextFormat;

		//Values that determines if the button has this interactivity enabled		
		private var _rollOverEnabled: Boolean;
		private var _rollOutEnabled: Boolean;
		private var _mouseOverEnabled: Boolean;
		private var _mouseOutEnabled: Boolean;
		private var _mouseDownEnabled: Boolean;
		private var _mouseUpEnabled: Boolean;
		private var _mouseClickEnabled: Boolean;
		
		
		
		
		private var initialized: Boolean = false;
		
		/**************************************************************************************************************
		 * Constructor 
		 **************************************************************************************************************/	
		public function SimpleButton(){}
		
		

		
		/**************************************************************************************************************
		 * Public functions
		 **************************************************************************************************************/	
		public function initialize(): void 
		{
			if( !initialized )
			{
				initNotifiers();
				setCopy();
				addMouseListeners();
			}
		}


		override public function destroy(): void 
		{
			if( initialized )
			{
				erase();
				initialized = false;
				super.destroy();
			}
		}

		
		
		
		
		/**************************************************************************************************************
		 * Private functions 
		 **************************************************************************************************************/	
		private function initNotifiers(): void 
		{
			notifier.addEventListener( ButtonNotification.DISABLE, handleNotifications, false, 0, true ); 
			notifier.addEventListener( ButtonNotification.ENABLE, handleNotifications, false, 0, true ); 
		}

		
		private function addMouseListeners(): void 
		{
			if( mouseUpEnabled ) { this.addEventListener(MouseEvent.MOUSE_UP, handleMouseEvents, false, 0, true ); }
			if( mouseDownEnabled ) { this.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseEvents, false, 0, true ); }
			if( mouseOverEnabled ) { this.addEventListener(MouseEvent.MOUSE_OVER, handleMouseEvents, false, 0, true ); }
			if( mouseOutEnabled ) { this.addEventListener(MouseEvent.MOUSE_OUT, handleMouseEvents, false, 0, true ); }
			if( rollOverEnabled ) { this.addEventListener(MouseEvent.ROLL_OVER, handleMouseEvents, false, 0, true ); }
			if( rollOutEnabled ) { this.addEventListener(MouseEvent.ROLL_OUT, handleMouseEvents, false, 0, true ); }
		}


		private function mouseDown(): void 
		{
			if( validateFrameLabel("MOUSE_DOWN") ) { motor.gotoAndPlay("MOUSE_DOWN"); }
		}


		private function mouseUp(): void 
		{
			if( validateFrameLabel("MOUSE_UP") ) { motor.gotoAndPlay("MOUSE_UP"); }
			notifier.dispatchEvent( notification );
		}


		private function mouseOver(): void 
		{
			if( validateFrameLabel("MOUSE_OVER") ) { motor.gotoAndPlay("MOUSE_OVER"); }
		}


		private function mouseOut(): void 
		{
			if( validateFrameLabel("MOUSE_OUT") ) { motor.gotoAndPlay("MOUSE_OUT"); }
		}


		private function enableButton(): void 
		{
			addMouseListeners();
			if( validateFrameLabel("enable") ) { motor.gotoAndPlay("enable"); }
		}


		private function rollOut(): void 
		{
			if( validateFrameLabel("ROLL_OUT") ) { motor.gotoAndPlay("ROLL_OUT"); }
		}


		private function rollOver(): void 
		{
			if( validateFrameLabel("ROLL_OVER") ) { motor.gotoAndPlay("ROLL_OVER"); }
		}


		private function disableButton(): void 
		{
			removeMouseListeners();
			if( validateFrameLabel("disable") ) { motor.gotoAndPlay("disable"); }
		}


		private function setCopy(): void 
		{
			if( label )
			{
				label.autoSize = TextFieldAutoSize.LEFT;
				label.antiAliasType = AntiAliasType.ADVANCED;

				if( format ) 
				{
					label.defaultTextFormat = format;
					label.embedFonts = true;
				}
				
				if( copy ) 
				{ 
					label.text = copy; 
				}
			}
		}


		private function validateFrameLabel( s: String ): Boolean
		{
			var val: Boolean;

			for( var i: uint = 0; i < motor.scenes[0].labels.length; i++ ) 
			{
 				if( motor.scenes[0].labels[i].name.toString() == s ) 
 				{ 
 					val = true;
 					return val;
 				} 
 				else 
 				{ 
 				 	val = false; 
 				}
			}
			
			return val;
		}


		private function erase(): void 
		{
			removeMouseListeners();
			removeNotificationHandlers();
			
			_motor = null;
			_format = null;
			_label = null;
			_copy = null;
			_notification = null;
		}		 
		

		private function removeMouseListeners(): void 
		{
			if( this.hasEventListener(MouseEvent.MOUSE_UP) )
			{
				this.removeEventListener( MouseEvent.MOUSE_UP, handleMouseEvents );
			}
			if( this.hasEventListener(MouseEvent.MOUSE_DOWN) )
			{
				this.removeEventListener( MouseEvent.MOUSE_DOWN, handleMouseEvents );
			}
			if( this.hasEventListener(MouseEvent.MOUSE_OVER) )
			{
				this.removeEventListener( MouseEvent.MOUSE_OVER, handleMouseEvents );
			}
			if( this.hasEventListener(MouseEvent.MOUSE_OUT) )
			{
				this.removeEventListener( MouseEvent.MOUSE_OUT, handleMouseEvents );
			}
			if( this.hasEventListener(MouseEvent.ROLL_OVER) )
			{
				this.removeEventListener( MouseEvent.ROLL_OVER, handleMouseEvents );
			}
			if( this.hasEventListener(MouseEvent.ROLL_OUT) )
			{
				this.removeEventListener( MouseEvent.ROLL_OUT, handleMouseEvents );
			}

		}
		
		
		private function removeNotificationHandlers(): void 
		{
			if( this.hasEventListener(ButtonNotification.ENABLE ) )
			{
				this.removeEventListener( ButtonNotification.ENABLE, handleNotifications );
			}

			if( this.hasEventListener(ButtonNotification.DISABLE ) )
			{
				this.removeEventListener( ButtonNotification.DISABLE, handleNotifications );
			}
		}

		


		 
		/**************************************************************************************************************
		 * Event handlers 
		 **************************************************************************************************************/	
		private function handleMouseEvents(e: MouseEvent): void 
		{
			switch( e.type )
			{
				case MouseEvent.MOUSE_UP:
					mouseUp();
					break;

				case MouseEvent.MOUSE_DOWN:
					mouseDown();
					break;

				case MouseEvent.MOUSE_OVER:
					mouseOver();
					break;

				case MouseEvent.MOUSE_OUT:
					mouseOut();
					break;

				case MouseEvent.ROLL_OVER:
					rollOver();
					break;

				case MouseEvent.ROLL_OUT:
					rollOut();
					break;

				default:
					break;
			}
		}

		
		private function handleNotifications( e: ButtonNotification ): void 
		{
			switch( e.type )
			{
				case ButtonNotification.DISABLE:
					disableButton();
					break;

				case ButtonNotification.ENABLE:
					enableButton();
					break;

				default:
					break;
			}
		}



		
		/**************************************************************************************************************
		 * Getters/Setters 
		 **************************************************************************************************************/
		public function get notification(): Notification { return _notification; }
		public function set notification(notification: Notification): void { _notification = notification; }
		
		public function get copy(): String { return _copy; }
		public function set copy(copy: String): void { _copy = copy; }

		public function get label(): TextField { return _label; }
		public function set label(label: TextField): void { _label = label; }
		
		public function get motor(): MovieClip { return _motor;}
		public function set motor(motor: MovieClip): void { _motor = motor; }
		
		public function get format(): TextFormat { return _format; }
		public function set format(format: TextFormat): void { _format = format; }
		
		public function get rollOverEnabled(): Boolean { return _rollOverEnabled; }
		public function set rollOverEnabled(rollOverEnabled: Boolean): void { _rollOverEnabled = rollOverEnabled; }
		
		public function get rollOutEnabled(): Boolean { return _rollOutEnabled; }
		public function set rollOutEnabled(rollOutEnabled: Boolean): void { _rollOutEnabled = rollOutEnabled; }
		
		public function get mouseOverEnabled(): Boolean { return _mouseOverEnabled; }
		public function set mouseOverEnabled(mouseOverEnabled: Boolean): void { _mouseOverEnabled = mouseOverEnabled; }
		
		public function get mouseOutEnabled(): Boolean { return _mouseOutEnabled; }
		public function set mouseOutEnabled(mouseOutEnabled: Boolean): void { _mouseOutEnabled = mouseOutEnabled; }
		
		public function get mouseDownEnabled(): Boolean { return _mouseDownEnabled; }
		public function set mouseDownEnabled(mouseDownEnabled: Boolean): void { _mouseDownEnabled = mouseDownEnabled; }
		
		public function get mouseUpEnabled(): Boolean { return _mouseUpEnabled; }
		public function set mouseUpEnabled(mouseUpEnabled: Boolean): void { _mouseUpEnabled = mouseUpEnabled; }
		
		public function get mouseClickEnabled(): Boolean { return _mouseClickEnabled; }
		public function set mouseClickEnabled(mouseClickEnabled: Boolean): void { _mouseClickEnabled = mouseClickEnabled; }
	}
}