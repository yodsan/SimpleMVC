package com.yodana.simplemvc.as3.interfaces 
{

	/**
	 * @author Yodana
	 */
	public interface INotification 
	{
		function get type(): String;
		
		function get notificationVO(): INotificationVO
		
		function set notificationVO(notificationVO: INotificationVO): void
	}
}
