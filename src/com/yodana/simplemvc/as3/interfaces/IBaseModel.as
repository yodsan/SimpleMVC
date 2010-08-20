package com.yodana.simplemvc.as3.interfaces 
{
	import com.yodana.simplemvc.as3.core.Notifier;

	/**
	 * @author Yodana
	 */
	public interface IBaseModel 
	{
		function registerNotifier( notifier: Notifier ): void;
		
		function destroy(): void;		
	}
}
