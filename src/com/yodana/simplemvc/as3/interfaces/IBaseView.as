package com.yodana.simplemvc.as3.interfaces 
{
	import com.yodana.simplemvc.as3.core.Notifier;

	/**
	 * @author Yodana
	 */
	public interface IBaseView 
	{
		function registerGlobalNotifier( notifier: Notifier ): void;

		function registerNotifier( notifier: Notifier ): void;
		
		function destroy(): void;		
	}
}
