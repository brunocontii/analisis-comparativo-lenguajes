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
------------------------------------------------------------------------------------------------------
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
    ------------------------------------------------------------------------------------------------------
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
distribuyo
([(s1, {X -> x}), (s2, {X -> x})], {x})
ejecuto s1
([(s2, {X -> x})], {x = 1})
ejecuto s2
([(s3, s4, {X -> x, P -> p})], {x = 1, p})
distribuyo
([(s3, {X -> x, P -> p}), (s4, {X -> x, P -> p})], {x = 1, p})
ejecuto s3 que es definicion de procedimiento
([(s4, {X -> x, P -> p})], {x = 1, p = (proc...end, {X -> x})})
ejecuto s4
([(s5, s6, {X -> x, P -> p})], {x = 1, p = (proc...end, {X -> x}), x2})
distribuyo
([(s5, {X -> x, P -> p}), (s6, {X -> x, P -> p})], {x = 1, p = (proc...end, {X -> x}), x2})
ejecuto s5
([(s6, {X -> x, P -> p})], {x = 1, p = (proc...end, {X -> x}), x2 = 2})
ejecuto s6 que es la invocacion a un procedimiento
([({Browse X}, {X -> x, Y -> x2})], {x = 1, p = (proc...end, {X -> x}), x2})
se ejecuta el {Browse X} y se muestra un 1
------------------------------------------------------------------------------------------------------
EJERCICIO 4
local X Y in                        {s}
    Y = 1                           {s1}
    local F P in                    {s2}
        F = proc {$ Y}              {s3}
            {P Y}                   {s6}
        end
        P = proc {$ Z}              {s4}
            Z = Y                   {s7}
        end
        {F X}                       {s5}
        {Browse X}                  {s8}
    end
end

([s, ∅], ∅)
ejecuto s
([s1, s2, {X -> x, Y -> y}], {x, y})
distribuyo
([(s1, {X -> x, Y -> y}), (s2, {X -> x, Y -> y})], {x, y})
ejecuto s1
([(s2, {X -> x, Y -> y})], {x, y = 1})
ejecuto s2
([(s3, s4, s5, s8, {X -> x, Y -> y, F -> f, P -> p})], {x, y = 1, f, p})
distribuyo
([(s3, {X -> x, Y -> y, F -> f, P -> p}), (s4, {X -> x, Y -> y, F -> f, P -> p}), (s5, {X -> x, Y -> y, F -> f, P -> p}), (s8, {X -> x, Y -> y, F -> f, P -> p})], {x, y = 1, f, p})
ejecuto s3 que es la definicion de un procedimiento
([(s4, {X -> x, Y -> y, F -> f, P -> p}), (s5, {X -> x, Y -> y, F -> f, P -> p}), (s8, {X -> x, Y -> y, F -> f, P -> p})], {x, y = 1, f = (proc...end, {P -> p}), p})
ejecuto s4 que es la definicion de un procedimiento
([(s5, {X -> x, Y -> y, F -> f, P -> p}), (s8, {X -> x, Y -> y, F -> f, P -> p})], {x, y = 1, f = (proc...end, {P -> p}), p = (proc...end, {Y -> y})})
ejecuto s5 que es la invocacion de un procedimiento
([(s6, {P -> p, Y -> x}), (s8, {X -> x, Y -> y, F -> f, P -> p})], {x, y = 1, f = (proc...end, {P -> p}), p = (proc...end, {Y -> y})})
ejecuto s6 que es la invocacion de un procedimiento
([(s7, {Y -> y, Z -> x}), (s8, {X -> x, Y -> y, F -> f, P -> p})], {x, y = 1, f = (proc...end, {P -> p}), p = (proc...end, {Y -> y})})
ejecuto s7
([(s8, {X -> x, Y -> y, F -> f, P -> p})], {x = y = 1, f = (proc...end, {P -> p}), p = (proc...end, {Y -> y})})
ejecuto s8
([({Browse X}, {X -> x, Y -> y, F -> f, P -> p})], {x = y = 1, f = (proc...end, {P -> p}), p = (proc...end, {Y -> y})})
se ejecuta el {Browse X} y se muestra un 1
------------------------------------------------------------------------------------------------------
EJERCICIO 5
local X in
    local Y in
        X = 1
        Y = 2 + X
        local T in
            T = X > Y
            if T then
                {Browse X}
            else
                {Browse Y}
            end
        end
    end
end
------------------------------------------------------------------------------------------------------
EJERCICIO 6
local Max in
    local A in
        local B in
            local C in
                Max = proc {$ X Y ? R}
                    local T in
                        T = X >= Y
                        if T then
                            R = X
                        else
                            R = Y
                        end
                    end
                end
                A = 3
                B = 2
                local Z in
                    Z = {Max A B C}
                    {Browse C}
                end
            end
        end
    end
end
------------------------------------------------------------------------------------------------------
EJERCICIO 9-a
fun {Length Ls, r}
    case Ls
    of nil then r
    [] _ | Lr then {Length Lr, (1 + r)}
    end
end
------------------------------------------------------------------------------------------------------
EJERCICIO 9-b
ejemplo :: [a] -> [a] -> [a]
    | [] ys = ys
    | (x:xs) ys = ejemplo xs ([map x] ++ ys)
------------------------------------------------------------------------------------------------------
EJERCICIO 9-c
inversa :: [a] -> [a] -> [a]
    | [] ys = ys
    | (x:xs) ys = inversa xs (concat ys [x])
------------------------------------------------------------------------------------------------------
EJERCICIO 10





