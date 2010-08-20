package com.yodana.simplemvc.as3.core
{
	import com.yodana.simplemvc.as3.interfaces.IBaseModel;

	/**
	 * @author Yodana Thorsdal Santiago
	 */
	public class Model implements IBaseModel
	{
		private var _notifier: Notifier;

		
		
		
		/**************************************************************************************************************
		 * Constructor 
		 **************************************************************************************************************/	
		public function Model() {}
		
		

		
		/**************************************************************************************************************
		 * Public functions
		 **************************************************************************************************************/	
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
		
	}
}


