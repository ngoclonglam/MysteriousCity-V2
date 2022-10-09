function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	AddTextEntry('0x857F902D', 'Rolls-Royce')
	AddTextEntry('0xE175BEF8', '103EX')
end)