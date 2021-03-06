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
package modules.Geoprocessing.parameters
{

import modules.Geoprocessing.paramEditor.NonEditableParamView;
import modules.Geoprocessing.paramEditor.input.multivalue.InputMultiValueStringParamEditor;

import mx.core.IVisualElement;

public class MultiValueStringParameter extends BaseParameter
{
    private var _defaultValue:Array;

    override public function get defaultValue():Object
    {
        return _defaultValue;
    }

    override public function set defaultValue(value:Object):void
    {
        _defaultValue = value as Array;
    }

    override public function get type():String
    {
        return GPParameterTypes.MULTI_VALUE_STRING;
    }

    override public function defaultValueFromString(text:String):void
    {
        if (text)
        {
            defaultValue = text.split(',');
        }
    }

    override public function toXML():XML
    {
        var paramXML:XML = <param/>

        paramXML.@type = type;
        paramXML.@name = name;
        paramXML.@required = required;
        paramXML.@visible = visible;

        if (label)
        {
            paramXML.@label = label;
        }

        if (defaultValue)
        {
            paramXML.@defaultvalue = defaultValue;
        }

        if (choiceList && choiceList.length > 0)
        {
            paramXML.appendChild(getChoiceListXML());
        }

        if (toolTip)
        {
            paramXML.@tooltip = toolTip;
        }

        return paramXML;
    }

    override public function createInputEditorView():IVisualElement
    {
        var editorView:InputMultiValueStringParamEditor = new InputMultiValueStringParamEditor();
        editorView.param = this;
        return editorView;
    }

    override public function createOutputEditorView():IVisualElement
    {
        return new NonEditableParamView();
    }
}

}
