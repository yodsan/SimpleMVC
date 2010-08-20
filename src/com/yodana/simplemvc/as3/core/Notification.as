package com.yodana.simplemvc.as3.core 
{
	import com.yodana.simplemvc.as3.interfaces.INotificationVO;
	import com.yodana.simplemvc.as3.interfaces.INotification;
	import flash.events.Event;

	/**
	 * @author Yodana
	 */
	public class Notification extends Event implements INotification
	{
		private var eventType: String;
		private var _notificationVO: INotificationVO;
		
		
		/**************************************************************************************************************
		 * Constructor 
		 **************************************************************************************************************/	
		public function Notification(type: String, notificationVO: INotificationVO = null, bubbles: Boolean = false, cancelable: Boolean = false )
		{
			super( type, bubbles, cancelable );
			
			this.eventType = type;
			this.notificationVO = notificationVO;
		}

		
		
		
		/**************************************************************************************************************
		 * Public functions 
		 **************************************************************************************************************/	
        /**
         * Override clone so the event can be redispatched. 
         */
        override public function clone() : Event 
        {
        	var event: Notification = new Notification( eventType, notificationVO, false, false );
			
			return event;
		}
		



		/**************************************************************************************************************
		 * Getters/Setters 
		 **************************************************************************************************************/	
		override public function get type(): String
		{
			return super.type;
		}
		
		public function get notificationVO(): INotificationVO
		{
			return _notificationVO;
		}
		
		public function set notificationVO(notificationVO: INotificationVO): void
		{
			_notificationVO = notificationVO;
		}
	}
}