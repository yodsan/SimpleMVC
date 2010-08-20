package com.yodana.utils {
	import com.yodana.utils.log.Sos;
//	import nl.demonsters.debugger.MonsterDebugger;


	/**
	 * @author madmad
	 */
	public class Log {
		private static var _logEnabled : Boolean = true;
		private static var _alertEnabled : Boolean = true;
		private static var _debugEnabled : Boolean = true;
		private static var _warnEnabled : Boolean = true;
		private static var _errorEnabled : Boolean = true;
		private static var _systemEnabled : Boolean = true;
		private static var _tagEnabled : Boolean = true;
		
		private static var _useMonsterDebugger : Boolean = false;
		private static var _useSOSDebugger : Boolean = true;
		private static var _useTraceDebugger : Boolean = false;
		
		public static function alert(msg : Object, filter : String = "fCore") : void {
			if (_alertEnabled){
//				if (_useMonsterDebugger) MonsterDebugger.trace(filter, msg, 0x00FF00);
				if (_useSOSDebugger) Sos.alert( sosifyMessage(msg.toString()), filter);
				if (_useTraceDebugger) traceMsg("ALR#" + filter + ": " + msg);
			}
		}
		public static function debug(msg : Object, filter : String = "fCore") : void {
			if (_debugEnabled){
//				if (_useMonsterDebugger) MonsterDebugger.trace(filter, msg, 0x330033);
				if (_useSOSDebugger) Sos.debug( sosifyMessage(msg.toString()), filter);
				if (_useTraceDebugger) traceMsg("DBG#" + filter + ": " + msg);
			}
		}
		public static function error(msg : Object, filter : String = "fCore") : void {
			if (_errorEnabled) {
//				if (_useMonsterDebugger) MonsterDebugger.trace(filter, msg, 0xFF0000);
				if (_useSOSDebugger) Sos.error( sosifyMessage(msg.toString()), filter);
				if (_useTraceDebugger) traceMsg("ERR#" + filter + ": " + msg);
			}
		}
		public static function log(msg : Object, filter : String = "fCore") : void {
			if (_logEnabled){
//				if (_useMonsterDebugger) MonsterDebugger.trace(filter, msg);
				if (_useSOSDebugger) Sos.log( sosifyMessage(msg.toString()), filter);
				if (_useTraceDebugger) traceMsg("LOG#" + filter + ": " + msg);
			}
		}
		public static function system(msg : Object, filter : String = "fCore") : void {
			if (_systemEnabled){
//				if (_useMonsterDebugger) MonsterDebugger.trace(filter, msg, 0xEEEEEE);
				if (_useSOSDebugger) Sos.system( sosifyMessage(msg.toString()), filter );
				if (_useTraceDebugger) traceMsg("SYS#" + filter + ": " + msg);
			}
		}
		public static function tag(msg : Object, filter : String = "fCore") : void {
			if (_tagEnabled){
//				if (_useMonsterDebugger) MonsterDebugger.trace(filter, msg, 0xFF00CC);
				if (_useSOSDebugger) Sos.tag( sosifyMessage(msg.toString()), filter );
				if (_useTraceDebugger) traceMsg("TAG#" + filter + ": " + msg);
			}
		}
		public static function warn(msg : Object, filter : String = "fCore") : void {
			if (_warnEnabled){
//				if (_useMonsterDebugger) MonsterDebugger.trace(filter, msg, 0xCC3333);
				if (_useSOSDebugger) Sos.warning( sosifyMessage(msg.toString()), filter);
				if (_useTraceDebugger) traceMsg("WRN#" + filter + ": " + msg);
			}
		}
		
		public static function get enableLog() : Boolean {
			return _logEnabled;
		}
		
		public static function set enableLog(logEnabled : Boolean) : void {
			_logEnabled = logEnabled;
		}
		
		public static function get enableAlert() : Boolean {
			return _alertEnabled;
		}
		
		public static function set enableAlert(alertEnabled : Boolean) : void {
			_alertEnabled = alertEnabled;
		}
		
		public static function get enableDebug() : Boolean {
			return _debugEnabled;
		}
		
		public static function set enableDebug(debugEnabled : Boolean) : void {
			_debugEnabled = debugEnabled;
		}
		
		public static function get enableWarn() : Boolean {
			return _warnEnabled;
		}
		
		public static function set enableWarn(warnEnabled : Boolean) : void {
			_warnEnabled = warnEnabled;
		}
		
		public static function get enableError() : Boolean {
			return _errorEnabled;
		}
		
		public static function set enableError(errorEnabled : Boolean) : void {
			_errorEnabled = errorEnabled;
		}
		
		public static function get enableSystem() : Boolean {
			return _systemEnabled;
		}
		
		public static function set enableSystem(systemEnabled : Boolean) : void {
			_systemEnabled = systemEnabled;
		}
		
		public static function get enableTag() : Boolean {
			return _tagEnabled;
		}
		
		public static function set enableTag(tagEnabled : Boolean) : void {
			_tagEnabled = tagEnabled;
		}
		
		/**
		 * DeMonster socket debugger. Default is 'true'.
		 */
		static public function get useMonsterDebugger() : Boolean {
			return _useMonsterDebugger;
		}
		
		static public function set useMonsterDebugger(useMonsterDebugger : Boolean) : void {
			_useMonsterDebugger = useMonsterDebugger;
		}
		
		/**
		 * SOSMax socket debugger. Default is 'true'.
		 */
		static public function get useSOSDebugger() : Boolean {
			return _useSOSDebugger;
		}
		
		static public function set useSOSDebugger(useSOSDebugger : Boolean) : void {
			_useSOSDebugger = useSOSDebugger;
		}
		
		/**
		 * Plain trace. Default is 'false'
		 */
		static public function get useTraceDebugger() : Boolean {
			return _useTraceDebugger;
		}
		
		static public function set useTraceDebugger(useTraceDebugger : Boolean) : void {
			_useTraceDebugger = useTraceDebugger;
		}
	}
}

function traceMsg(msg : String) : void {
	// trace(msg);
}

function sosifyMessage( msg : String ) : String {
	msg = msg.split("<![CDATA[").join("");
	msg = msg.split("]]>").join("");
	return msg;
}