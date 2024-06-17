local Core = exports[Config.Framework]:GetCoreObject()

RegisterNetEvent('v-carflip:flipcar')
AddEventHandler('v-carflip:flipcar', function()
    FlipCarOver()
end)

-- Fliperiino function
function FlipCarOver()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local radius = 2.5  -- Define the search radius for the closest vehicle

    -- Check if the player is in any vehicle
    if IsPedInAnyVehicle(ped, false) then
        lib.notify({
            id = '1',
            description = Strings.Notify.playerinvehicle,
            position = Strings.Notify.position,
            type = 'error',
        })
        return
    end

    local VehicleData = Core.Functions.GetClosestVehicle()

    -- Check if the closest vehicle is within the defined radius
    local vehicleCoords = GetEntityCoords(VehicleData)
    local distance = #(pedCoords - vehicleCoords)
    if distance > radius then
        lib.notify({
            id = '1',
            description = Strings.Notify.novehiclenearby,
            position = Strings.Notify.position,
            type = 'error',
        })
        return
    end

    -- Check if the vehicle is already on all wheels
    if IsVehicleOnAllWheels(VehicleData) then
        lib.notify({
            id = '1',
            description = Strings.Notify.vehiclealreadyflipped,
            position = Strings.Notify.position,
            type = 'error',
        })
        return
    end

    -- Check again if the player is in any vehicle before starting the skill check
    if IsPedInAnyVehicle(ped, false) then
        lib.notify({
            id = '1',
            description = Strings.Notify.playerinvehicle,
            position = Strings.Notify.position,
            type = 'error',
        })
        return
    end

    local success = lib.skillCheck(Config.skillcheckdiffuculty, Config.skillcheckinput)

    if success then
        RequestAnimDict('missfinale_c2ig_11')
        while not HasAnimDictLoaded("missfinale_c2ig_11") do
            Wait(10)
        end
        local result = lib.progressBar({
            label = Strings.Progressbar.label,
            duration = Config.duration,
            position = Strings.Progressbar.position,
            useWhileDead = Config.useWhileDead,
            canCancel = Config.canCancel,
            disable = {
                move = Config.disablemove,
                car = Config.disablecar,
                combat = Config.disablecombat,
            },
            anim = {
                dict = 'missfinale_c2ig_11',
                clip = 'pushcar_offcliff_m'
            },
        })

        if result then  -- If the progress bar is completed successfully
            local carCoords = GetEntityRotation(VehicleData, 2)
            SetEntityRotation(VehicleData, carCoords[1], 0, carCoords[3], 2, true)
            SetVehicleOnGroundProperly(VehicleData)
            lib.notify({
                id = '1',
                description = Strings.Notify.vehicleflipped,
                position = Strings.Notify.position,
                type = 'success',
            })
            ClearPedTasks(ped)
        else  -- If the progress bar is cancelled
            lib.notify({
                id = '1',
                description = Strings.Notify.flippingcanceled,
                position = Strings.Notify.position,
                type = 'error',
            })
        end
    else
        lib.notify({
            id = '1',
            description = Strings.Notify.flippingfailed,
            position = Strings.Notify.position,
            type = 'error',
        })
    end
end
