local function init(parent)
    local dialog = setmetatable({}, parent)
    
    dialog:has("control")
    
    dialog.control:onPress("enter", function(self)
        end
    )
    
    return dialog
end
return init