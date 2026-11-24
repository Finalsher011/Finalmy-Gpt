
--==================================================
-- FINALMY
-- Unified Configuration + ESP Modules
-- Version 1.0
--==================================================

local FINALMY = {
    Name = "FINALMY",
    Version = "1.0",

    Tabs = {
        "Aimbot",
        "Silent Aim",
        "Trigger & Rage",
        "Gun Mods",
        "Visuais",
        "World",
        "Skins",
        "Gun Skins",
        "Misc",
        "Settings"
    },

    Config = {
        Aimbot = {
            Enabled = false,
            KeyMode = "Hold",
            Smoothness = 5,
            AimPart = "Head"
        },

        SilentAim = {
            Enabled = false,
            HitChance = 50,
            HeadshotChance = 50
        },

        TriggerRage = {
            Enabled = false,
            KeyMode = "Hold",
            ReactionDelay = 100,
            FireChance = 50
        },

        GunMods = {
            NoRecoil = false,
            NoSpread = false
        },

        Visuals = {
            BoxESP = {
                Enabled = false,
                Distance = 500,
                LineThickness = 2,
                Color = {1, 1, 1}
            },

            SkeletonESP = {
                Enabled = false,
                Distance = 500,
                SkeletonLines = 4,
                LineThickness = 2,
                Color = {1, 1, 1}
            },

            NameESP = {
                Enabled = false,
                Distance = 500,
                ShowName = true,
                ShowHealth = true,
                ShowDistance = true
            },

            LineESP = {
                Enabled = false,
                Distance = 500,
                LineThickness = 2,
                Color = {1, 1, 1}
            },

            HealthPercentage = true,
            TeamCheck = true
        },

        World = {
            NoFlashbang = false,
            NoSmoke = false
        },

        Skins = {},
        GunSkins = {},
        Misc = {},

        Settings = {
            MenuKey = "RightShift",
            SaveConfig = true
        }
    }
}

--==================================================
-- ESP MODULES
--==================================================

local ESP = {}

local function clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

-- BOX ESP

function ESP.BoxESP(config)
    config = config or {}

    return {
        Enabled = config.Enabled or false,
        Distance = config.Distance or 500,
        HealthPercentage = 100,
        SkeletonLines = 4,
        LineThickness = config.LineThickness or 2,
        Color = config.Color or {1, 1, 1},

        Execute = function(self)
            return self.Enabled
        end
    }
end

-- SKELETON ESP

function ESP.SkeletonESP(config)
    config = config or {}

    return {
        Enabled = config.Enabled or false,
        Distance = config.Distance or 500,
        HealthPercentage = 100,
        SkeletonLines = config.SkeletonLines or 4,
        LineThickness = config.LineThickness or 2,
        Color = config.Color or {1, 1, 1},

        Execute = function(self)
            return self.Enabled
        end
    }
end

-- NAME ESP

function ESP.NameESP(config)
    config = config or {}

    return {
        Enabled = config.Enabled or false,
        Name = config.Name or "NPC",
        Distance = config.Distance or 500,
        HealthPercentage = 100,
        ShowName = config.ShowName ~= false,
        ShowHealth = config.ShowHealth ~= false,
        ShowDistance = config.ShowDistance ~= false,

        Execute = function(self)
            return self.Enabled
        end
    }
end

-- LINE ESP

function ESP.LineESP(config)
    config = config or {}

    return {
        Enabled = config.Enabled or false,
        Distance = config.Distance or 500,
        HealthPercentage = 100,
        LineThickness = config.LineThickness or 2,
        Color = config.Color or {1, 1, 1},

        Execute = function(self)
            return self.Enabled
        end
    }
end

--==================================================
-- INITIALIZE ESP
--==================================================

FINALMY.ESP = {
    Box = ESP.BoxESP(FINALMY.Config.Visuals.BoxESP),
    Skeleton = ESP.SkeletonESP(
        FINALMY.Config.Visuals.SkeletonESP
    ),
    Name = ESP.NameESP(
        FINALMY.Config.Visuals.NameESP
    ),
    Line = ESP.LineESP(
        FINALMY.Config.Visuals.LineESP
    )
}

--==================================================
-- CONFIGURATION HELPERS
--==================================================

function FINALMY:GetConfig(tab)
    return self.Config[tab]
end

function FINALMY:SetConfig(tab, key, value)
    if self.Config[tab] == nil then
        return false
    end

    self.Config[tab][key] = value
    return true
end

function FINALMY:GetTabs()
    return self.Tabs
end

function FINALMY:GetESP()
    return self.ESP
end

function FINALMY:Reset()
    return false -- Reset requires a UI/config manager.
end

--==================================================
-- EXPORT
--==================================================

return FINALMY

--==================================================
-- FINALMY
-- Unified Configuration + ESP Modules
-- Version 1.0
--==================================================

local FINALMY = {
    Name = "FINALMY",
    Version = "1.0",

    Tabs = {
        "Aimbot",
        "Silent Aim",
        "Trigger & Rage",
        "Gun Mods",
        "Visuais",
        "World",
        "Skins",
        "Gun Skins",
        "Misc",
        "Settings"
    },

    Config = {
        Aimbot = {
            Enabled = false,
            KeyMode = "Hold",
            Smoothness = 5,
            AimPart = "Head"
        },

        SilentAim = {
            Enabled = false,
            HitChance = 50,
            HeadshotChance = 50
        },

        TriggerRage = {
            Enabled = false,
            KeyMode = "Hold",
            ReactionDelay = 100,
            FireChance = 50
        },

        GunMods = {
            NoRecoil = false,
            NoSpread = false
        },

        Visuals = {
            BoxESP = {
                Enabled = false,
                Distance = 500,
                LineThickness = 2,
                Color = {1, 1, 1}
            },

            SkeletonESP = {
                Enabled = false,
                Distance = 500,
                SkeletonLines = 4,
                LineThickness = 2,
                Color = {1, 1, 1}
            },

            NameESP = {
                Enabled = false,
                Distance = 500,
                ShowName = true,
                ShowHealth = true,
                ShowDistance = true
            },

            LineESP = {
                Enabled = false,
                Distance = 500,
                LineThickness = 2,
                Color = {1, 1, 1}
            },

            HealthPercentage = true,
            TeamCheck = true
        },

        World = {
            NoFlashbang = false,
            NoSmoke = false
        },

        Skins = {},
        GunSkins = {},
        Misc = {},

        Settings = {
            MenuKey = "RightShift",
            SaveConfig = true
        }
    }
}

--==================================================
-- ESP MODULES
--==================================================

local ESP = {}

local function clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

-- BOX ESP

function ESP.BoxESP(config)
    config = config or {}

    return {
        Enabled = config.Enabled or false,
        Distance = config.Distance or 500,
        HealthPercentage = 100,
        SkeletonLines = 4,
        LineThickness = config.LineThickness or 2,
        Color = config.Color or {1, 1, 1},

        Execute = function(self)
            return self.Enabled
        end
    }
end

-- SKELETON ESP

function ESP.SkeletonESP(config)
    config = config or {}

    return {
        Enabled = config.Enabled or false,
        Distance = config.Distance or 500,
        HealthPercentage = 100,
        SkeletonLines = config.SkeletonLines or 4,
        LineThickness = config.LineThickness or 2,
        Color = config.Color or {1, 1, 1},

        Execute = function(self)
            return self.Enabled
        end
    }
end

-- NAME ESP

function ESP.NameESP(config)
    config = config or {}

    return {
        Enabled = config.Enabled or false,
        Name = config.Name or "NPC",
        Distance = config.Distance or 500,
        HealthPercentage = 100,
        ShowName = config.ShowName ~= false,
        ShowHealth = config.ShowHealth ~= false,
        ShowDistance = config.ShowDistance ~= false,

        Execute = function(self)
            return self.Enabled
        end
    }
end

-- LINE ESP

function ESP.LineESP(config)
    config = config or {}

    return {
        Enabled = config.Enabled or false,
        Distance = config.Distance or 500,
        HealthPercentage = 100,
        LineThickness = config.LineThickness or 2,
        Color = config.Color or {1, 1, 1},

        Execute = function(self)
            return self.Enabled
        end
    }
end

--==================================================
-- INITIALIZE ESP
--==================================================

FINALMY.ESP = {
    Box = ESP.BoxESP(FINALMY.Config.Visuals.BoxESP),
    Skeleton = ESP.SkeletonESP(
        FINALMY.Config.Visuals.SkeletonESP
    ),
    Name = ESP.NameESP(
        FINALMY.Config.Visuals.NameESP
    ),
    Line = ESP.LineESP(
        FINALMY.Config.Visuals.LineESP
    )
}

--==================================================
-- CONFIGURATION HELPERS
--==================================================

function FINALMY:GetConfig(tab)
    return self.Config[tab]
end

function FINALMY:SetConfig(tab, key, value)
    if self.Config[tab] == nil then
        return false
    end

    self.Config[tab][key] = value
    return true
end

function FINALMY:GetTabs()
    return self.Tabs
end

function FINALMY:GetESP()
    return self.ESP
end

function FINALMY:Reset()
    return false -- Reset requires a UI/config manager.
end

--==================================================
-- EXPORT
--==================================================

return FINALMY
