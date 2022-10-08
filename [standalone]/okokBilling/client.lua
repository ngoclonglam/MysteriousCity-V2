-- ESX = nil
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

function SocietyInvoices(society)
	QBCore.Functions.TriggerCallback("okokBilling:GetSocietyInvoices", function(cb, totalInvoices, totalIncome, totalUnpaid, awaitedIncome)
		if json.encode(cb) ~= '[]' then
			SetNuiFocus(true, true)
			SendNUIMessage({
				action = 'societyinvoices',
				invoices = cb,
				totalInvoices = totalInvoices,
				totalIncome = totalIncome,
				totalUnpaid = totalUnpaid,
				awaitedIncome = awaitedIncome,
				VAT = Config.VATPercentage
			})
		else
			exports['dopeNotify2']:Alert("HÓA ĐƠN", "Doanh nghiệp của bạn không có hóa đơn nào.", 10000, 'info')
			SetNuiFocus(false, false)
		end
	end, society)
end

function CreateInvoice(society)
	SetNuiFocus(true, true)
	SendNUIMessage({
		action = 'createinvoice',
		society = society
	})
end

RegisterNetEvent('okokBilling:client:hoadon', function()
	local isAllowed = false
	-- local jobName = ""
	for k, v in pairs(Config.AllowedSocieties) do
		if v == PlayerData.job.name then
			-- jobName = v
			isAllowed = true
		end
	end

	if Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.isboss and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = true,
			create = true
		})
	-- elseif Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.isboss and isAllowed then
	-- 	SetNuiFocus(true, true)
	-- 	SendNUIMessage({
	-- 		action = 'mainmenu',
	-- 		society = false,
	-- 		create = true
	-- 	})
	elseif not Config.OnlyBossCanAccessSocietyInvoices and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = true,
			create = true
		})
	elseif not isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = false,
			create = false
		})
	end
end)

RegisterCommand(Config.InvoicesCommand, function()
	local isAllowed = false
	-- local jobName = ""
	for k, v in pairs(Config.AllowedSocieties) do
		if v == PlayerData.job.name then
			-- jobName = v
			isAllowed = true
		end
	end

	if Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.isboss and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = true,
			create = true
		})
	-- elseif Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.isboss and isAllowed then
	-- 	SetNuiFocus(true, true)
	-- 	SendNUIMessage({
	-- 		action = 'mainmenu',
	-- 		society = false,
	-- 		create = true
	-- 	})
	elseif not Config.OnlyBossCanAccessSocietyInvoices and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = true,
			create = true
		})
	elseif not isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = false,
			create = false
		})
	end
end, false)

RegisterNUICallback("action", function(data, cb)
	if data.action == "close" then
		SetNuiFocus(false, false)
	elseif data.action == "payInvoice" then
		TriggerServerEvent("okokBilling:PayInvoice", data.invoice_id)
		SetNuiFocus(false, false)
	elseif data.action == "cancelInvoice" then
		TriggerServerEvent("okokBilling:CancelInvoice", data.invoice_id)
		SetNuiFocus(false, false)
	elseif data.action == "createInvoice" then
		local closestPlayer, playerDistance = QBCore.Functions.GetClosestPlayer()
		target = GetPlayerServerId(closestPlayer)
		data.target = target
		data.society = PlayerData.job.name
		data.society_name = PlayerData.job.label

		if closestPlayer == -1 or playerDistance > 3.0 then
			exports['dopeNotify2']:Alert("HÓA ĐƠN", "Lỗi gửi hóa đơn, không có ai gần bạn.", 10000, 'error')
		else
			TriggerServerEvent("okokBilling:CreateInvoice", data)
			exports['dopeNotify2']:Alert("HÓA ĐƠN", "Hóa đơn đã được gửi thành công!", 10000, 'success')
		end
		
		SetNuiFocus(false, false)
	elseif data.action == "missingInfo" then
		exports['dopeNotify2']:Alert("HÓA ĐƠN", "Hãy điền tất cả thông tin trước khi gửi hóa đơn!", 10000, 'error')
	elseif data.action == "negativeAmount" then
		exports['dopeNotify2']:Alert("HÓA ĐƠN", "Bạn cần điền số tiền lớn hơn 0!", 10000, 'error')
	elseif data.action == "mainMenuOpenMyInvoices" then
		MyInvoices()
	elseif data.action == "mainMenuOpenSocietyInvoices" then
		for k, v in pairs(Config.AllowedSocieties) do
			if v == PlayerData.job.name then
				if Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.isboss then
					SocietyInvoices(PlayerData.job.label)
				elseif not Config.OnlyBossCanAccessSocietyInvoices then
					SocietyInvoices(PlayerData.job.label)
				elseif Config.OnlyBossCanAccessSocietyInvoices then
					exports['dopeNotify2']:Alert("HÓA ĐƠN", "Chỉ có Quản Lý mới truy cập được.", 10000, 'error')
				end
			end
		end
	elseif data.action == "mainMenuOpenCreateInvoice" then
		for k, v in pairs(Config.AllowedSocieties) do
			if v == PlayerData.job.name then
				CreateInvoice(PlayerData.job.label)
			end
		end
	end
end)

function MyInvoices()
	QBCore.Functions.TriggerCallback("okokBilling:GetInvoices", function(invoices)
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'myinvoices',
			invoices = invoices,
			VAT = Config.VATPercentage
		})
	end)
end