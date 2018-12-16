local cobra = require ('model.cobra')
local jogador = {pontuacao = 0, cobra = cobra}

function jogador:somarPontuacao()
	self.pontuacao = self.pontuacao + 1
end

function jogador:getPontuacao()
	return self.pontuacao
end

function jogador:resetJogador()
	self.pontuacao = 0;
end


return jogador