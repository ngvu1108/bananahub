repeat task.wait() until game:IsLoaded()
if _G.Executed then return end
_G.Executed = true

local GameLoad = nil
local PlaceId, GameId = game.PlaceId, game.GameId

-- Thêm GameId và script tương ứng tại đây
if GameId == 7074860883 then
    GameLoad = "AriseC"
end

-- Tải và chạy script từ repo của bạn
local success, err = pcall(function()
    if GameLoad then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/" .. GameLoad .. ".lua"))()
    else
        warn("Không xác định GameId, không tải script.")
    end
end)

if not success then
    warn("Lỗi khi tải script: " .. tostring(err))
end
