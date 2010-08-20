package com.yodana.interactive.button 
{
	import com.yodana.simplemvc.as3.core.Notification;
	import com.yodana.simplemvc.as3.interfaces.INotificationVO;

	/**
	 * @author Yodana
	 */
	public class ButtonNotification extends Notification 
	{
		public static const DISABLE: String = "DISABLE";
		public static const ENABLE: String = "ENABLE";

		
		public function ButtonNotification(type: String, notificationVO: INotificationVO = null, bubbles: Boolean = false, cancelable: Boolean = false)
		{
			super( type, notificationVO, bubbles, cancelable );
		}
	}
}
