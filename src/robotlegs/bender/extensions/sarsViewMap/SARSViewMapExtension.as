// ------------------------------------------------------------------------------
// Copyright (c) 2011 the original author or authors. All Rights Reserved.
//
// NOTICE: You are permitted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// ------------------------------------------------------------------------------
package robotlegs.bender.extensions.sarsViewMap
{
	import away3d.containers.View3D;
	
	import org.hamcrest.object.instanceOf;
	
	import robotlegs.bender.extensions.sarsViewMap.api.IAway3DViewMap;
	import robotlegs.bender.extensions.sarsViewMap.api.IStarlingViewMap;
	import robotlegs.bender.extensions.sarsViewMap.impl.Away3DViewMap;
	import robotlegs.bender.extensions.sarsViewMap.impl.StarlingViewMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;



	/**
	 * Basic Away3DViewMap Extension.
	 * 
	 * @author jamieowen
	 */
	public class SARSViewMapExtension implements IExtension
	{
		/*============================================================================*/
		/* Public Properties                                                         */
		/*============================================================================*/
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private var _uid : String = UID.create(SARSViewMapExtension);
		private var _context : IContext;

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		public function extend(context : IContext) : void
		{
			_context = context;

			_context.injector.map(IAway3DViewMap).toSingleton(Away3DViewMap);
			_context.injector.map(IStarlingViewMap).toSingleton(StarlingViewMap);
			
			_context.injector.getInstance(IAway3DViewMap);
			_context.injector.getInstance(IStarlingViewMap);
		}

		public function toString() : String
		{
			return _uid;
		}
	}
}
