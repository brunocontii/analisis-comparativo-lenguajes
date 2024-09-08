% EJERCICIO 1
local X in
    local Y in
        local Z in
            X = person(name:"George" age:Y)
            Z = 26
            Z = Y
            {Browse Y}
        end
    end
    {Browse X}
end

% imprime por pantalla un 26

% EJERCICIO 2
local X in
        local Y in
            X = person(name:"George" age:25)
            Y = person(name:"George" age:26)
            X = Y
        end
    {Browse Y}
end

% tira error ya que no tienen el mismo valor
% y ya tenian un valor asosiado



