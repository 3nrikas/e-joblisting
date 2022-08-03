RegisterNetEvent('esx:playerLoaded', function()
    CreateBlips()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        CreateBlips()
    end
end)

RegisterNUICallback('close', function(data, cb)
    if data then
        SetNuiFocus(false, false)
        cb(true)
    end

    cb(false)
end)

RegisterNUICallback('leavejob', function(data, cb)
    if data then
        TriggerServerEvent('e-joblisting:job', data.job)
        lib.notify({
            title = 'Job Center',
            description = 'You leaved a job',
            type = 'error'
        })
        cb(true)
    end

    cb(false)
end)

RegisterNUICallback('employ', function(data, cb)
    if data then
        TriggerServerEvent('e-joblisting:job', data.job)
        lib.notify({
            title = 'Job Center',
            description = 'You were recruited into the ' ..data.label,
            type = 'success'
        })
        cb(true)
    end

    cb(false)
end)

RegisterCommand('openJobListing', function()
    OpenMenu()
end, false)
RegisterKeyMapping('openJobListing', 'Opens job listing', 'keyboard', 'e')

OpenMenu = function()
    local zone = GetZone()
    local ped = PlayerPedId()

    if zone and IsPedOnFoot(ped) then
        SendNUIMessage({
            type = 'show',
            jobs = zone.jobs,
            label = zone.label,
            desc = zone.desc,
            close = Config.Locale.close,
            leavejob = Config.Locale.leavejob,
            getjob = Config.Locale.getjob
        })
        SetNuiFocus(true, true)
    end
end

GetZone = function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local dist
    for k, v in pairs(Config.JobCenters) do
        dist = #(coords - v.coords)
        if dist < 3.0 then
            return v
        end
    end

    return false
end

CreateBlips = function()
    for k, v in pairs(Config.JobCenters) do
        local blip = AddBlipForCoord(v.coords)

        SetBlipHighDetail(blip, true)
        SetBlipSprite(blip, v.blip.sprite)
        SetBlipScale(blip, v.blip.scale)
        SetBlipColour(blip, v.blip.color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(v.label)
        EndTextCommandSetBlipName(blip)
    end
end