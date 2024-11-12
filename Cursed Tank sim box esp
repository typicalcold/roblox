local camera = game.Workspace.CurrentCamera

local function getCorners(model)

    local cframe, size = model:GetBoundingBox()
    local halfSize = size / 2
    local corners = {
        Vector3.new(-halfSize.X, -halfSize.Y, -halfSize.Z), -- Bottom-Left-Front
        Vector3.new(halfSize.X, -halfSize.Y, -halfSize.Z),-- Bottom-Right-Front
        Vector3.new(-halfSize.X, -halfSize.Y, halfSize.Z), -- Bottom-Left-Back
        Vector3.new(halfSize.X, -halfSize.Y, halfSize.Z),-- Bottom-Right-Back

        Vector3.new(-halfSize.X, halfSize.Y, -halfSize.Z),-- Top-Left-Front
        Vector3.new(halfSize.X, halfSize.Y, -halfSize.Z), -- Top-Right-Front
        Vector3.new(-halfSize.X, halfSize.Y, halfSize.Z),-- Top-Left-Back
        Vector3.new(halfSize.X, halfSize.Y, halfSize.Z),-- Top-Right-Back
    }




    local screenCorners = {}
    for _, corner in pairs(corners) do
        local worldCorner = cframe:PointToWorldSpace(corner)
        local screenPos, onScreen = camera:WorldToViewportPoint(worldCorner) -- use only WorldToViewportPoint or weird position things happen
        if onScreen then
            table.insert(screenCorners, Vector2.new(screenPos.X, screenPos.Y))
        end
    end

    return screenCorners
end

local function drawline(from, to)

    local line = Drawing.new("Line")
    line.From = from
    line.To = to
    line.Thickness = 1
    line.Color = Color3.new(1, 1, 1)
    line.Visible = true
end

while task.wait() do

    cleardrawcache()

    

        for i, v in pairs(game.Workspace.Vehicles:GetChildren()) do
  
            local sc = getCorners(v)

 
                if #sc == 8 then -- check if table is good and, draw lines to each point, and so on. idk what other solution to do.
                    drawline(sc[1], sc[2]) -- draws a line from point 1 to 2
                    drawline(sc[2], sc[4])
                    drawline(sc[4], sc[3])
                    drawline(sc[3], sc[1])
                    drawline(sc[5], sc[6])
                    drawline(sc[6], sc[8])
                    drawline(sc[8], sc[7])
                    drawline(sc[7], sc[5])
                    drawline(sc[1], sc[5])
                    drawline(sc[2], sc[6])
                    drawline(sc[3], sc[7])
                    drawline(sc[4], sc[8])
                end
       
        end

end
