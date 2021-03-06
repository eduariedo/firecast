require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGerenciarSimpleMacrosItem()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmGerenciarSimpleMacrosItem");
    obj:setTitle("Gerenciar Plugins");
    obj:setHeight(30);
    obj:setMargins({left=4, right=4, top=1, bottom=1});


		local function editarMacro()
			local frm = self:findControlByName("frmGerenciarSimpleMacros");
			
			if frm ~= nil then
				frm.editarMacroNode(sheet);
			end;
		end;
		


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({top=2, left=2});
    obj.layout1:setName("layout1");

    obj.labMacro = GUI.fromHandle(_obj_newObject("label"));
    obj.labMacro:setParent(obj.layout1);
    obj.labMacro:setName("labMacro");
    obj.labMacro:setAlign("client");
    obj.labMacro:setText("(Macro Vazia)");

    obj.btnEdit = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEdit:setParent(obj.layout1);
    obj.btnEdit:setName("btnEdit");
    obj.btnEdit:setAlign("right");
    obj.btnEdit:setText("Editar...");
    obj.btnEdit:setMargins({left=4, right=4, top=1, bottom=1});
    obj.btnEdit:setWidth(75);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setMargins({top=2});
    obj.horzLine1:setName("horzLine1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("macro");
    obj.dataLink1:setName("dataLink1");


		self.labMacro.text = "(" .. lang("macros.ui.emptyMacro") ..")";
		self.btnEdit.text = lang("macros.ui.editButton");
	


    obj._e_event0 = obj.btnEdit:addEventListener("onClick",
        function (_)
            editarMacro();
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.labMacro.text = sheet.macro or "(" .. lang("macros.ui.emptyMacro") ..")";
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.labMacro ~= nil then self.labMacro:destroy(); self.labMacro = nil; end;
        if self.btnEdit ~= nil then self.btnEdit:destroy(); self.btnEdit = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGerenciarSimpleMacrosItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGerenciarSimpleMacrosItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGerenciarSimpleMacrosItem = {
    newEditor = newfrmGerenciarSimpleMacrosItem, 
    new = newfrmGerenciarSimpleMacrosItem, 
    name = "frmGerenciarSimpleMacrosItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "Gerenciar Plugins", 
    description=""};

frmGerenciarSimpleMacrosItem = _frmGerenciarSimpleMacrosItem;
Firecast.registrarForm(_frmGerenciarSimpleMacrosItem);

return _frmGerenciarSimpleMacrosItem;
