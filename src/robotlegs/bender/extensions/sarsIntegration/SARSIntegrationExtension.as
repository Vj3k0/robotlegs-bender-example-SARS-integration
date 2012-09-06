//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.sarsIntegration
{
	import away3d.containers.View3D;
	
	import org.hamcrest.object.instanceOf;
	
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.ILogger;
	import robotlegs.bender.framework.impl.UID;
	
	import starling.display.DisplayObjectContainer;

	/**
	 * <p>This Extension waits for a DisplayObjectContainer to be added as a configuration
	 * and maps that container into the context's injector.</p>
	 *
	 * <p>It should be installed before context initialization.</p>
	 */
	public class SARSIntegrationExtension implements IExtension
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private const _uid:String = UID.create(SARSIntegrationExtension);

		private var _context:IContext;

		private var _logger:ILogger;

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		// todo: accept contextView via constructor and use that if provided

		public function extend(context:IContext):void
		{
			_context = context;
			_logger = context.getLogger(this);
			
			_context.addConfigHandler(instanceOf(DisplayObjectContainer), handleContextView);
			_context.addConfigHandler(instanceOf(View3D), handleView3D);
		}

		public function toString():String
		{
			return _uid;
		}

		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/

		private function handleContextView(view:DisplayObjectContainer):void
		{
			_logger.debug("Mapping provided DisplayObjectContainer as Starling contextView...");
			_context.injector.map(DisplayObjectContainer).toValue(view);
		}
		
		private function handleView3D(view3D:View3D):void
		{
			_logger.debug("Mapping provided View3D as Away3D contextView...");
			_context.injector.map(View3D).toValue(view3D);
		}
	}
}
