identifyexecutor = function()
return "VOIDEXPLORER" 
end

setfpscap = function(fps)
    if type(fps) ~= "number" or fps <= 0 then
        error("FPS must be a positive number")
    end

    -- Calculer l'intervalle de temps entre chaque frame en secondes
    local frame_time = 1 / fps

    -- Stocker l'heure actuelle pour le contrôle des frames
    local last_time = os.clock()

    -- Fonction pour limiter les FPS
    local function limit_fps()
        -- Calculer le temps écoulé depuis la dernière frame
        local current_time = os.clock()
        local elapsed_time = current_time - last_time

        -- Si le temps écoulé est inférieur au temps de la frame, attendre
        if elapsed_time < frame_time then
            local sleep_time = frame_time - elapsed_time
            os.execute("sleep " .. sleep_time)
        end

        -- Mettre à jour le dernier temps
        last_time = os.clock()
    end

    -- Retourner la fonction de limitation des FPS
    return limit_fps
end

-- Exemple d'utilisation :
local fps_limiter = setfpscap(60) -- Définir la limite de FPS à 60

-- Boucle principale pour limiter les FPS
while true do
    fps_limiter() -- Appeler la fonction de limitation des FPS
    -- Placez votre logique de rendu ou de jeu ici
end
