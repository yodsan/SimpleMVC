package com.yodana.simplemvc.as3.core
{
	import com.yodana.simplemvc.as3.interfaces.IBaseView;

	import flash.display.Sprite;

	/**
	 * @author Yodana Thorsdal Santiago
	 */
	public class View extends Sprite implements IBaseView
	{
		private var _notifier: Notifier;
		private var _globalNotifier: Notifier;
		
		
		/**************************************************************************************************************
		 * Constructor 
		 **************************************************************************************************************/	
		public function View() 
		{

		}

		
		/**************************************************************************************************************
		 * Public functions
		 **************************************************************************************************************/	
		public function registerGlobalNotifier( notifier: Notifier ): void
		{
			this.globalNotifier = notifier;
		}

		public function registerNotifier( notifier: Notifier ): void
		{
			this.notifier = notifier;
		}

		public function destroy(): void 
		{
			erase();
		}

		
		
		
		
		/**************************************************************************************************************
		 * Private functions 
		 **************************************************************************************************************/	
		private function erase(): void 
		{
			notifier = null;
		}
		
		
		
		
		/**************************************************************************************************************
		 * Getters/Setters 
		 **************************************************************************************************************/	
		protected function get notifier(): Notifier
		{
			return _notifier;
		}
		
		protected function set notifier(notifier: Notifier): void
		{
			_notifier = notifier;
		}
		
		protected function get globalNotifier(): Notifier
		{
			return _globalNotifier;
		}
		
		protected function set globalNotifier(globalNotifier: Notifier): void
		{
			_globalNotifier = globalNotifier;
		}				 
	}
}


