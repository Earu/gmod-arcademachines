local GAME = {}

GAME.Name = "Image Test"

local w, h = 337, 85
local loaded = false

function GAME:Init()
    IMAGE:LoadFromURL("https://i.imgur.com/SH39yEU.png", "logo")
end

function GAME:DrawMarquee()
    surface.SetDrawColor(0, 0, 0, 255)
    surface.DrawRect(0, 0, MARQUEE_WIDTH, MARQUEE_HEIGHT)

    if loaded then
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(IMAGE.Images["logo"].mat)
        surface.DrawTexturedRect(MARQUEE_WIDTH / 2 - (w * 0.75 / 2), MARQUEE_HEIGHT / 2 - (h * 0.75 / 2), w * 0.75, h * 0.75)
    end
end

function GAME:Update()
    if not loaded and IMAGE.Images["logo"] and IMAGE.Images["logo"].status == IMAGE.STATUS_LOADED then
        loaded = true
        MACHINE:UpdateMarquee()
    end
end

function GAME:Draw()
    if loaded then
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(IMAGE.Images["logo"].mat)
        surface.DrawTexturedRect(SCREEN_WIDTH / 2 - (w / 2), SCREEN_HEIGHT / 2 - (h / 2), w, h)
    end
end

function GAME:OnStartPlaying(ply)

end

function GAME:OnStopPlaying(ply)
    
end

return GAME