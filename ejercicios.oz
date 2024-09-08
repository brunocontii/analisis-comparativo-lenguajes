EJERCICIO 1
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

imprime por pantalla un 26

EJERCICIO 2
local X in
        local Y in
            X = person(name:"George" age:25)
            Y = person(name:"George" age:26)
            X = Y
        end
    {Browse Y}
end

tira error ya que no tienen el mismo valor
y ya tenian un valor asosiado

EJERCICIO 3
local X in                  {s}
    X = 1                   {s1}
    local P in              {s2}
        P = proc { Y $}     {s3}
            {Browse X}      {s7}
        end
        local X in          {s4}
            X = 2           {s5}
            {P X}           {s6}
        end
    end
end

([s, ∅], ∅)
ejecuto s
([(s1, s2, {X -> x})], {x})
distrubuyo
([(s1, {X -> x}), (s2, {X -> x})], {x})
ejecuto s1
([(s2, {X -> x})], {x = 1})
ejecuto s2
([(s3, s4, {X -> x, P -> p})], {x = 1, p})
distrubuyo
([(s3, {X -> x, P -> p}), (s4, {X -> x, P -> p})], {x = 1, p})
ejecuto s3 que es definicion de procedimiento
([(s4, {X -> x, P -> p})], {x = 1, p = (proc...end, {X -> x})})
ejecuto s4
([(s5, s6, {X -> x, P -> p})], {x = 1, p = (proc...end, {X -> x}), x2})
distrubuyo
([(s5, {X -> x, P -> p}), (s6, {X -> x, P -> p})], {x = 1, p = (proc...end, {X -> x}), x2})
ejecuto s5
([(s6, {X -> x, P -> p})], {x = 1, p = (proc...end, {X -> x}), x2 = 2})
ejecuto s6 que es la invocacion a un procedimiento
([({Browse X}, {X -> x, Y -> x2})], {x = 1, p = (proc...end, {X -> x}), x2})
se ejecuta el {Browse X} y se muestra un 1


