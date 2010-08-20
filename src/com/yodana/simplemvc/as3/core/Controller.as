package com.yodana.simplemvc.as3.core
{
	import com.yodana.simplemvc.as3.interfaces.IBaseController;
	import com.yodana.simplemvc.as3.interfaces.IModel;
	import com.yodana.simplemvc.as3.interfaces.IView;

	import flash.display.Sprite;

	/**
	 * @author Yodana Thorsdal Santiago
	 */
	public class Controller extends Sprite implements IBaseController
	{
		private var _globalNotifier: Notifier;
		private var _notifier: Notifier;
		private var _model: IModel;
		private var _view: IView;


		/**************************************************************************************************************
		 * Constructor 
		 **************************************************************************************************************/	
		public function Controller() 
		{

		}

		
		/**************************************************************************************************************
		 * Public functions
		 **************************************************************************************************************/	
		public function registerModel( model: IModel ): void 
		{
			this.model = model;
		}


		public function registerView( view: IView ): void 
		{
			this.view = view;
		}

		public function registerNotifier( notifier: Notifier ): void
		{
			this.notifier = notifier;
		}


		public function registerGlobalNotifier( notifier: Notifier ): void
		{
			this.globalNotifier = notifier;
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
		
		protected function get model(): IModel
		{
			return _model;
		}
		
		protected function set model(model: IModel): void
		{
			_model = model;
		}
		
		protected function get view(): IView
		{
			return _view;
		}
		
		protected function set view(view: IView): void
		{
			_view = view;
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


