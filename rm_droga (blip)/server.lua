local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

server = {}

Tunnel.bindInterface("rm_droga",server)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUANTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function server.Quantidade()
	local source = source
	if not quantidade[source] then
		quantidade[source] = math.random(3, 5)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITENS
-----------------------------------------------------------------------------------------------------------------------------------------
function server.checkItens()
	server.Quantidade()
	local source = source
	local user_id = vRP.Passport(source)
	local quantidadeItens = quantidade[source]

	if user_id and quantidadeItens then
		local itens = {"maconha", "cocaine", "lsd", "metanfetamina", "ecstasy", "baseado"}

		for _, item in ipairs(itens) do
			if vRP.ConsultItem(user_id, item, quantidadeItens) then
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function server.checkPayment()
	local source = source
	local user_id = vRP.Passport(source)
	local quantidadeItens = quantidade[source]

	if user_id and quantidadeItens then
		local itens = {"cocaine", "maconha", "lsd", "ecstasy", "metanfetamina", "baseado"}
		local valorPorItem = 1000

		for _, item in ipairs(itens) do
			if vRP.TakeItem(user_id, item, quantidadeItens, true) then
				vRP.GenerateItem(user_id, "dirtydollar", valorPorItem * quantidadeItens, true)
				break 
			end
		end

		quantidade[source] = nil
		return true
	end
end
