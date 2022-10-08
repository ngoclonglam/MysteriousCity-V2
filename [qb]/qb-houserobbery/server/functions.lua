local QBCore = exports['qb-core']:GetCoreObject()

Jobs = {}

function GetAvailableJobs()
    local available = Config.MaxAvailableJobs
    for _, job in pairs(Jobs) do
        if job.state == Config.JobState.InProgress or job.state == Config.JobState.Assigned then
            available = available - 1
        end
    end
    return available
end

function SetJobPoints(src, points, type)
    local player = QBCore.Functions.GetPlayer(src)
    local currentPts = player.PlayerData.metadata[Config.SkillMetadata] or 0
    if type == "add" then
        currentPts = currentPts + points
    else
        currentPts = currentPts - points
    end
    player.Functions.SetMetaData(Config.SkillMetadata, currentPts)
end