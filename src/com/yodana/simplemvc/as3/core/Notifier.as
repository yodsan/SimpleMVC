package com.yodana.simplemvc.as3.core 
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * @author Yodana
	 */
	public class Notifier extends EventDispatcher implements IEventDispatcher
	{
		public function Notifier(target: IEventDispatcher = null)
		{
			super( target );
		}
	}
}
