

--========================================================
-- FINALMY | VERSION 1.1
-- Roblox UI - YuB-X compatible interface scaffold
--========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Remove previous interface
pcall(function()
    local old = PlayerGui:FindFirstChild("FINALMY")
    if old then old:Destroy() end
end)

local Config = {
    Aimbot = {
        Enabled = false,
        KeyMode = "Hold",
        Smoothness = 5,
        AimPart = "Head"
    },

    ["Silent Aim"] = {
        Enabled = false,
        HitChance = 50,
        HeadshotChance = 50
    },

    ["Trigger & Rage"] = {
        Enabled = false,
        KeyMode = "Hold",
        ReactionDelay = 100,
        FireChance = 50
    },

    ["Gun Mods"] = {
        NoRecoil = false,
        NoSpread = false
    },

    Visuais = {
        BoxESP = false,
        SkeletonESP = false,
        NameESP = false,
        LineESP = false,
        Distance = 500,
        HealthPercentage = true,
        TeamCheck = true,
        LineThickness = 2,
        SkeletonLines = 4
    },

    World = {
        NoFlashbang = false,
        NoSmoke = false
    },

    Skins = {},
    ["Gun Skins"] = {},
    Misc = {},
    Settings = {
        MenuKey = "RightShift",
        SaveConfig = true
    }
}

local Theme = {
    Background = Color3.fromRGB(13, 14, 19),
    Sidebar = Color3.fromRGB(18, 19, 26),
    Panel = Color3.fromRGB(24, 26, 34),
    Element = Color3.fromRGB(31, 33, 43),
    Accent = Color3.fromRGB(125, 90, 255),
    Text = Color3.fromRGB(240, 240, 248),
    Muted = Color3.fromRGB(145, 148, 165),
    Green = Color3.fromRGB(75, 205, 135)
}

local function Create(class, props, parent)
    local obj = Instance.new(class)

    for k, v in pairs(props or {}) do
        obj[k] = v
    end

    obj.Parent = parent
    return obj
end

local function Corner(parent, radius)
    Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8)
    }, parent)
end

local function Stroke(parent, color, transparency)
    return Create("UIStroke", {
        Color = color or Theme.Element,
        Transparency = transparency or 0,
        Thickness = 1
    }, parent)
end

local function Tween(object, properties, duration)
    TweenService:Create(
        object,
        TweenInfo.new(duration or 0.2, Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out),
        properties
    ):Play()
end

--========================================================
-- MAIN WINDOW
--========================================================

local Screen = Create("ScreenGui", {
    Name = "FINALMY",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, PlayerGui)

local Main = Create("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(760, 480),
    Position = UDim2.new(0.5, -380, 0.5, -240),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    ClipsDescendants = true
}, Screen)

Corner(Main, 12)
Stroke(Main, Color3.fromRGB(55, 49, 83))

--========================================================
-- LOADING SCREEN
--========================================================

local Loading = Create("Frame", {
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Theme.Background,
    ZIndex = 20
}, Main)

local LoadingTitle = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 50),
    Position = UDim2.new(0, 0, 0.36, 0),
    BackgroundTransparency = 1,
    Text = "FINALMY",
    TextColor3 = Theme.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 30,
    ZIndex = 21
}, Loading)

local LoadingSubtitle = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 25),
    Position = UDim2.new(0, 0, 0.49, 0),
    BackgroundTransparency = 1,
    Text = "INITIALIZING INTERFACE...",
    TextColor3 = Theme.Muted,
    Font = Enum.Font.Gotham,
    TextSize = 11,
    ZIndex = 21
}, Loading)

local LoadingBarBG = Create("Frame", {
    Size = UDim2.fromOffset(220, 4),
    Position = UDim2.new(0.5, -110, 0.59, 0),
    BackgroundColor3 = Theme.Element,
    BorderSizePixel = 0,
    ZIndex = 21
}, Loading)
Corner(LoadingBarBG, 5)

local LoadingBar = Create("Frame", {
    Size = UDim2.fromScale(0, 1),
    BackgroundColor3 = Theme.Accent,
    BorderSizePixel = 0,
    ZIndex = 22
}, LoadingBarBG)
Corner(LoadingBar, 5)

Tween(LoadingBar, {Size = UDim2.fromScale(1, 1)}, 1.2)

--========================================================
-- TOP BAR
--========================================================

local Top = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 48),
    BackgroundColor3 = Theme.Sidebar,
    BorderSizePixel = 0
}, Main)

local Logo = Create("TextLabel", {
    Size = UDim2.fromOffset(150, 48),
    Position = UDim2.fromOffset(17, 0),
    BackgroundTransparency = 1,
    Text = "FINALMY",
    TextColor3 = Theme.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 19,
    TextXAlignment = Enum.TextXAlignment.Left
}, Top)

local Version = Create("TextLabel", {
    Size = UDim2.fromOffset(60, 20),
    Position = UDim2.fromOffset(112, 15),
    BackgroundTransparency = 1,
    Text = "v1.1",
    TextColor3 = Theme.Accent,
    Font = Enum.Font.GothamBold,
    TextSize = 10
}, Top)

local Close = Create("TextButton", {
    Size = UDim2.fromOffset(32, 30),
    Position = UDim2.new(1, -42, 0, 9),
    BackgroundColor3 = Color3.fromRGB(75, 35, 45),
    Text = "X",
    TextColor3 = Theme.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    BorderSizePixel = 0
}, Top)
Corner(Close, 6)

local Minimize = Create("TextButton", {
    Size = UDim2.fromOffset(32, 30),
    Position = UDim2.new(1, -80, 0, 9),
    BackgroundColor3 = Theme.Element,
    Text = "-",
    TextColor3 = Theme.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    BorderSizePixel = 0
}, Top)
Corner(Minimize, 6)

-- Drag window
local dragging = false
local dragStart, startPosition

Top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPosition = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

local minimized = false

Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    Main.Size = minimized
        and UDim2.fromOffset(760, 48)
        or UDim2.fromOffset(760, 480)
end)

Close.MouseButton1Click:Connect(function()
    Screen:Destroy()
end)

--========================================================
-- SIDEBAR
--========================================================

local Sidebar = Create("Frame", {
    Size = UDim2.new(0, 175, 1, -48),
    Position = UDim2.fromOffset(0, 48),
    BackgroundColor3 = Theme.Sidebar,
    BorderSizePixel = 0
}, Main)

local Content = Create("Frame", {
    Size = UDim2.new(1, -190, 1, -68),
    Position = UDim2.fromOffset(185, 58),
    BackgroundTransparency = 1,
    BorderSizePixel = 0
}, Main)

local Tabs = {
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
}

local Pages = {}
local TabButtons = {}

local function CreatePage(name)
    local page = Create("ScrollingFrame", {
        Name = name,
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Visible = false
    }, Content)

    local layout = Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, page)

    Create("UIPadding", {
        PaddingTop = UDim.new(0, 8),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 12)
    }, page)

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(
            0, 0, 0, layout.AbsoluteContentSize.Y + 20
        )
    end)

    Pages[name] = page
    return page
end

for i, name in ipairs(Tabs) do
    local button = Create("TextButton", {
        Size = UDim2.new(1, -18, 0, 35),
        Position = UDim2.fromOffset(9, 12 + (i - 1) * 40),
        BackgroundColor3 = Theme.Sidebar,
        Text = name,
        TextColor3 = Theme.Muted,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        BorderSizePixel = 0,
        AutoButtonColor = false
    }, Sidebar)

    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 12)
    }, button)

    Corner(button, 6)

    TabButtons[name] = button
    CreatePage(name)
end

--========================================================
-- PAGE NAVIGATION
--========================================================

local function SelectTab(name)
    for tab, page in pairs(Pages) do
        page.Visible = tab == name

        local button = TabButtons[tab]

        Tween(button, {
            BackgroundColor3 = tab == name
                and Theme.Accent
                or Theme.Sidebar,

            TextColor3 = tab == name
                and Color3.new(1, 1, 1)
                or Theme.Muted
        }, 0.15)
    end
end

for name, button in pairs(TabButtons) do
    button.MouseButton1Click:Connect(function()
        SelectTab(name)
    end)
end

--========================================================
-- UI ELEMENTS
--========================================================

local function Section(page, title)
    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundTransparency = 1
    }, page)

    Create("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = Theme.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left
    }, frame)

    return frame
end

local function Toggle(page, title, initial, callback)
    local state = initial == true

    local row = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0
    }, page)
    Corner(row, 7)

    Create("TextLabel", {
        Size = UDim2.new(1, -65, 1, 0),
        Position = UDim2.fromOffset(12, 0),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    }, row)

    local switch = Create("TextButton", {
        Size = UDim2.fromOffset(38, 21),
        Position = UDim2.new(1, -50, 0.5, -10),
        BackgroundColor3 = state and Theme.Accent or Theme.Element,
        Text = "",
        BorderSizePixel = 0
    }, row)
    Corner(switch, 12)

    local dot = Create("Frame", {
        Size = UDim2.fromOffset(15, 15),
        Position = state
            and UDim2.new(1, -18, 0.5, -7)
            or UDim2.fromOffset(3, 3),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0
    }, switch)
    Corner(dot, 10)

    switch.MouseButton1Click:Connect(function()
        state = not state

        Tween(switch, {
            BackgroundColor3 = state and Theme.Accent or Theme.Element
        })

        Tween(dot, {
            Position = state
                and UDim2.new(1, -18, 0.5, -7)
                or UDim2.fromOffset(3, 3)
        })

        if callback then callback(state) end
    end)

    return row
end

local function Slider(page, title, min, max, initial, callback)
    local value = initial

    local row = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 66),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0
    }, page)
    Corner(row, 7)

    local label = Create("TextLabel", {
        Size = UDim2.new(1, -70, 0, 25),
        Position = UDim2.fromOffset(12, 4),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    }, row)

    local number = Create("TextLabel", {
        Size = UDim2.fromOffset(55, 25),
        Position = UDim2.new(1, -65, 0, 4),
        BackgroundTransparency = 1,
        Text = tostring(value),
        TextColor3 = Theme.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 12
    }, row)

    local bar = Create("TextButton", {
        Size = UDim2.new(1, -24, 0, 7),
        Position = UDim2.fromOffset(12, 43),
        BackgroundColor3 = Theme.Element,
        Text = "",
        BorderSizePixel = 0,
        AutoButtonColor = false
    }, row)
    Corner(bar, 5)

    local fill = Create("Frame", {
        Size = UDim2.new(
            math.clamp((value - min) / (max - min), 0, 1),
            0, 1, 0
        ),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0
    }, bar)
    Corner(fill, 5)

    local function SetValue(inputX)
        local percent = math.clamp(
            (inputX - bar.AbsolutePosition.X) / bar.AbsoluteSize.X,
            0, 1
        )

        value = math.floor(min + (max - min) * percent)
        number.Text = tostring(value)

        Tween(fill, {
            Size = UDim2.new(percent, 0, 1, 0)
        }, 0.08)

        if callback then callback(value) end
    end

    bar.MouseButton1Down:Connect(function()
        SetValue(UIS:GetMouseLocation().X)
    end)

    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
            and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            -- Slider updates are handled while dragging.
            if bar.Parent and bar:IsDescendantOf(Screen) then
                local mouse = UIS:GetMouseLocation()
                local p = mouse - bar.AbsolutePosition

                if p.X >= 0 and p.X <= bar.AbsoluteSize.X
                    and p.Y >= -15 and p.Y <= 22 then
                    SetValue(mouse.X)
                end
            end
        end
    end)

    return row
end

local function Dropdown(page, title, options, initial, callback)
    local selected = initial or options[1]

    local row = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0
    }, page)
    Corner(row, 7)

    Create("TextLabel", {
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.fromOffset(12, 0),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    }, row)

    local button = Create("TextButton", {
        Size = UDim2.fromOffset(125, 30),
        Position = UDim2.new(1, -137, 0.5, -15),
        BackgroundColor3 = Theme.Element,
        Text = tostring(selected),
        TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        BorderSizePixel = 0
    }, row)
    Corner(button, 6)

    button.MouseButton1Click:Connect(function()
        local index = table.find(options, selected) or 0
        selected = options[index % #options + 1]
        button.Text = tostring(selected)

        if callback then callback(selected) end
    end)

    return row
end

--========================================================
-- AIMBOT PAGE
--========================================================

do
    local p = Pages["Aimbot"]

    Section(p, "AIMBOT CONFIGURATION")

    Toggle(p, "Enable Aimbot option", Config.Aimbot.Enabled,
        function(v) Config.Aimbot.Enabled = v end)

    Dropdown(p, "Key Mode", {"Hold", "Toggle"}, "Hold",
        function(v) Config.Aimbot.KeyMode = v end)

    Slider(p, "Smoothness", 1, 20, 5,
        function(v) Config.Aimbot.Smoothness = v end)

    Dropdown(p, "Aim Part", {"Head", "Torso", "HumanoidRootPart"},
        "Head", function(v) Config.Aimbot.AimPart = v end)
end

--========================================================
-- SILENT AIM PAGE
--========================================================

do
    local p = Pages["Silent Aim"]

    Section(p, "SILENT AIM CONFIGURATION")

    Toggle(p, "Enable Silent Aim option", false,
        function(v) Config.SilentAim.Enabled = v end)

    Slider(p, "Hit Chance", 0, 100, 50,
        function(v) Config.SilentAim.HitChance = v end)

    Slider(p, "Headshot Chance", 0, 100, 50,
        function(v) Config.SilentAim.HeadshotChance = v end)
end

--========================================================
-- TRIGGER & RAGE PAGE
--========================================================

do
    local p = Pages["Trigger & Rage"]

    Section(p, "TRIGGER CONFIGURATION")

    Toggle(p, "Enable Trigger option", false,
        function(v) Config["Trigger & Rage"].Enabled = v end)

    Dropdown(p, "Key Mode", {"Hold", "Toggle"}, "Hold",
        function(v) Config["Trigger & Rage"].KeyMode = v end)

    Slider(p, "Reaction Delay (ms)", 0, 1000, 100,
        function(v) Config["Trigger & Rage"].ReactionDelay = v end)

    Slider(p, "Fire Chance", 0, 100, 50,
        function(v) Config["Trigger & Rage"].FireChance = v end)
end

--========================================================
-- GUN MODS PAGE
--========================================================

do
    local p = Pages["Gun Mods"]

    Section(p, "WEAPON OPTIONS")

    Toggle(p, "No Recoil option", false,
        function(v) Config["Gun Mods"].NoRecoil = v end)

    Toggle(p, "No Spread option", false,
        function(v) Config["Gun Mods"].NoSpread = v end)
end

--========================================================
-- VISUALS PAGE
--========================================================

do
    local p = Pages["Visuais"]

    Section(p, "ESP OPTIONS")

    Toggle(p, "Box ESP", false,
        function(v) Config.Visuais.BoxESP = v end)

    Toggle(p, "Skeleton ESP", false,
        function(v) Config.Visuais.SkeletonESP = v end)

    Toggle(p, "Name ESP", false,
        function(v) Config.Visuais.NameESP = v end)

    Toggle(p, "Line ESP", false,
        function(v) Config.Visuais.LineESP = v end)

    Section(p, "ESP CONFIGURATION")

    Slider(p, "Maximum Distance", 50, 2000, 500,
        function(v) Config.Visuais.Distance = v end)

    Slider(p, "Line Thickness", 1, 10, 2,
        function(v) Config.Visuais.LineThickness = v end)

    Slider(p, "Skeleton Lines", 1, 20, 4,
        function(v) Config.Visuais.SkeletonLines = v end)

    Toggle(p, "Health Percentage", true,
        function(v) Config.Visuais.HealthPercentage = v end)

    Toggle(p, "Team Check", true,
        function(v) Config.Visuais.TeamCheck = v end)
end

--========================================================
-- WORLD PAGE
--========================================================

do
    local p = Pages["World"]

    Section(p, "WORLD OPTIONS")

    Toggle(p, "No Flashbang option", false,
        function(v) Config.World.NoFlashbang = v end)

    Toggle(p, "No Smoke option", false,
        function(v) Config.World.NoSmoke = v end)
end

--========================================================
-- SKINS PAGE
--========================================================

do
    local p = Pages["Skins"]

    Section(p, "SKIN CONFIGURATION")

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundColor3 = Theme.Panel,
        Text = "Skin settings will be configured here.",
        TextColor3 = Theme.Muted,
        Font = Enum.Font.Gotham,
        TextSize = 12
    }, p).TextWrapped = true
end

--========================================================
-- GUN SKINS PAGE
--========================================================

do
    local p = Pages["Gun Skins"]

    Section(p, "GUN SKIN CONFIGURATION")

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundColor3 = Theme.Panel,
        Text = "Weapon skin settings will be configured here.",
        TextColor3 = Theme.Muted,
        Font = Enum.Font.Gotham,
        TextSize = 12
    }, p).TextWrapped = true
end

--========================================================
-- MISC PAGE
--========================================================

do
    local p = Pages["Misc"]

    Section(p, "MISCELLANEOUS")

    Toggle(p, "Example option", false,
        function(v) Config.Misc.Example = v end)
end

--========================================================
-- SETTINGS PAGE
--========================================================

do
    local p = Pages["Settings"]

    Section(p, "INTERFACE SETTINGS")

    Toggle(p, "Save configuration in session", true,
        function(v) Config.Settings.SaveConfig = v end)

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Theme.Panel,
        Text = "Menu Toggle Key: RIGHT SHIFT",
        TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 12
    }, p)
end

--========================================================
-- MENU KEY
--========================================================

UIS.InputBegan:Connect(function(input, processed)
    if processed then return end

    if input.KeyCode == Enum.KeyCode.RightShift then
        Main.Visible = not Main.Visible
    end
end)

--========================================================
-- INITIALIZE
--========================================================

SelectTab("Aimbot")

task.wait(1.3)

Tween(Loading, {
    BackgroundTransparency = 1
}, 0.3)

task.wait(0.3)
Loading:Destroy()

print("[FINALMY] Interface loaded successfully!")
