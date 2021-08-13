local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP") 

local staffmateuz = "https://discord.com/api/webhooks/872944106773561374/t6OG8xdLGGjReauVFFZxsgknShPgxtQjvVsOX57RYXiIdPYApZVghQKHR5kx_CZmTTx9" --COLOQUE SUA LOG

local mateuzstaffs = {
    "suporte.permissão",
    "mindmaster.permissão",
    "administrador.permissão"
}
local mateuzperm = {}

RegisterCommand('soustaff',function(source,args,rawCommand)
    local user_id  = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if  vRP.hasPermission(user_id,"mindmaster.permissao")  then 
        vRP.prompt(source,"Você Deseja Sair Serviço Staff:","")
        vRP.removeUserGroup(user_id,"Dono")
        TriggerClientEvent("Notify",source,"aviso","Você Saiu serviço Para Cidade!!")
        SendWebhookMessage(staffmateuz,"```prolog\n[STAFF DONO!]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO STAFF==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    elseif vRP.hasPermission(user_id,"mateuzdono1.permissao")  then 
            vRP.prompt(source,"Você Deseja Entrar Pra Serviço STAFF?:","")
            vRP.addUserGroup(user_id,"Dono")
            TriggerClientEvent("Notify",source,"aviso","Você ENTROU serviço Para Cidade!!")
            SendWebhookMessage(staffmateuz,"```prolog\n[STAFF DONO!]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[=========== ENTROU EM SERVIÇO STAFF==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-------------------------------Toogle Admin
    elseif vRP.hasPermission(user_id,"administrador.permissao")  then 
        vRP.prompt(source,"Você Deseja Sair Serviço Staff:","")
        vRP.removeUserGroup(user_id,"administrador-mateuz")
        TriggerClientEvent("Notify",source,"aviso","Você Saiu serviço Para Cidade!!")
        SendWebhookMessage(staffmateuz,"```prolog\n[STAFF DONO!]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO STAFF==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    elseif vRP.hasPermission(user_id,"administradormateuz2.permissao")  then 
        vRP.prompt(source,"Você Deseja Entrar Pra Serviço STAFF?:","")
        vRP.addUserGroup(user_id,"administrado")
        TriggerClientEvent("Notify",source,"aviso","Você ENTROU serviço Para Cidade!!")
        SendWebhookMessage(staffmateuz,"```prolog\n[STAFF administrado!]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[=========== ENTROU EM SERVIÇO STAFF==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    -------------------------------Toogle SUPORTE
    elseif vRP.hasPermission(user_id,"suporte.permissao")  then 
        vRP.prompt(source,"Você Deseja Sair Serviço Staff:","")
        vRP.removeUserGroup(user_id,"suporte-mateuz")
    TriggerClientEvent("Notify",source,"aviso","Você Saiu serviço Para Cidade!!")
    SendWebhookMessage(staffmateuz,"```prolog\n[STAFF DONO!]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO STAFF==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    elseif vRP.hasPermission(user_id,"suportemateuz4.permissao")  then 
        vRP.prompt(source,"Você Deseja Entrar Pra Serviço STAFF?:","")
        vRP.addUserGroup(user_id,"suporte")
        TriggerClientEvent("Notify",source,"aviso","Você ENTROU serviço Para Cidade!!")
        SendWebhookMessage(staffmateuz,"```prolog\n[STAFF suporte!]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[=========== ENTROU EM SERVIÇO STAFF==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end)




function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
