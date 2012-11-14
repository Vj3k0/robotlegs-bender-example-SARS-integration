package robotlegs.bender.example.sarsintegration.config {
import flash.utils.Dictionary;

import org.osflash.signals.Signal;

import org.swiftsuspenders.Injector;
import org.swiftsuspenders.dependencyproviders.FallbackDependencyProvider;

public class DefaultFallbackProvider implements FallbackDependencyProvider {

    public function apply(targetType:Class, activeInjector:Injector, injectParameters:Dictionary):Object {
        if (targetType is Signal)
            return new Signal();

        return null;
    }

    public function destroy():void {
    }

    public function prepareNextRequest(mappingId:String):Boolean {
        return true;
    }
}
}
