////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2008-2013 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
////////////////////////////////////////////////////////////////////////////////
package com.esri.builder.controllers.supportClasses.processes
{

import flash.events.Event;

public class ProcessArbiterEvent extends Event
{
    public static const COMPLETE:String = "processArbiterComplete";
    public static const PROGRESS:String = "processArbiterProgress";
    public static const FAILURE:String = "processArbiterFailure";

    private var _message:String;

    public function get message():String
    {
        return _message;
    }

    public function ProcessArbiterEvent(type:String, message:String)
    {
        super(type);
        _message = message;
    }

    override public function clone():Event
    {
        return new ProcessArbiterEvent(type, message);
    }
}
}
