RegisterNetEvent('e-joblisting:job')
AddEventHandler('e-joblisting:job', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob(job, 0)
end)