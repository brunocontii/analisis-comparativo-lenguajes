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
local Max in                                {s}
    local A in                              {s1}
        local B in                          {s2}
            local C in                      {s3}
                Max = proc {$ X Y ? R}      {s4}
                    local T in              {s9}
                        T = X >= Y          {s10}
                        if T then           {s11}
                            R = X           {s12}
                        else
                            R = Y           {s13}
                        end
                    end
                end
                A = 3                       {s5}
                B = 2                       {s6}
                local Z in                  {s7}
                    Z = {Max A B C}         {s8}
                    {Browse C}              {s14}
                end
            end
        end
    end
end

([s, ∅], ∅)
ejecuto s
([(s1, {MAX -> max})], max)
ejecuto s1
([(s2, {MAX -> max, A -> a})], max, a)
ejecuto s2
([(s3, {MAX -> max, A -> a, B -> b})], max, a, b)
ejecuto s3
([(s4, s5, s6, s7, {MAX -> max, A -> a, B -> b, C -> c})], max, a, b, c)
distribuyo
([(s4, {MAX -> max, A -> a, B -> b, C -> c}), (s5, {MAX -> max, A -> a, B -> b, C -> c}), (s6, {MAX -> max, A -> a, B -> b, C -> c}), (s7, {MAX -> max, A -> a, B -> b, C -> c})], max, a, b, c)
ejecuto s4 que es la definicion de un procedimiento
([(s5, {MAX -> max, A -> a, B -> b, C -> c}), (s6, {MAX -> max, A -> a, B -> b, C -> c}), (s7, {MAX -> max, A -> a, B -> b, C -> c})], max = (proc...end, {T -> t}), a, b, c)
ejecuto s5
([(s6, {MAX -> max, A -> a, B -> b, C -> c}), (s7, {MAX -> max, A -> a, B -> b, C -> c})], max = (proc...end, {T -> t}), a = 3, b, c)
ejecuto s6
([(s7, {MAX -> max, A -> a, B -> b, C -> c})], max = (proc...end, {T -> t}), a = 3, b = 2, c)
ejecuto s7
([(s8, s14, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3, b = 2, c, z)
distribuyo
([(s8, {MAX -> max, A -> a, B -> b, C -> c, Z -> z}), (s14, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3, b = 2, c, z)
ejecuto s8 que es la invocaciona un procedimiento
([(s9, {X -> a, Y -> b, R -> c}), (s14, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3, b = 2, c, z)
ejecuto s9
([(s10, s11, {X -> a, Y -> b, R -> c, T -> t}), (s14, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3, b = 2, c, z, t)
distribuyo
([(s10, {X -> a, Y -> b, R -> c, T -> t}), (s11, {X -> a, Y -> b, R -> c, T -> t}), (s14, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3, b = 2, c, z, t)
ejecuto s10
([(s11, {X -> a, Y -> b, R -> c, T -> t}), (s14, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3, b = 2, c, z, t = true)
ejecuto s11
([(s12, {X -> a, Y -> b, R -> c, T -> t}), (s14, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3, b = 2, c, z, t = true)
ejecuto s12
([(s14, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3 = c, b = 2, z, t = true)
ejecuto s14
([({Browse C}, {MAX -> max, A -> a, B -> b, C -> c, Z -> z})], max = (proc...end, { }), a = 3 = c, b = 2, z, t = true)
se ejecuta el {Browse C} y se muestra un 3

------------------------------------------------------------------------------------------------------
EJERCICIO 7
------------------------------------------------------------------------------------------------------
EJERCICIO 8
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
EJERCICIO 10-a
definicion de FoldR
fun {FoldR L F N}
    case L
    of nil then N
    [] x|xs then F(x) : {FoldR xs F N}
    end
end

fun {SumList L}
    {FoldR L fun {$ X Y} X + Y end 0}
end

fun {ProdList L}
    {FoldR L fun {$ X Y} X * Y end 1}
end
------------------------------------------------------------------------------------------------------
EJERCICIO 10-b
fun {Some L}
    {FoldR L fun {$ X Y} X orelse Y end false}
end

esta funcion es el v logico de una lista, devuelve true sii alguno de los elementos es true, caso contrario false
------------------------------------------------------------------------------------------------------
EJERCICIO 10-c
------------------------------------------------------------------------------------------------------
EJERCICIO 11
fun lazy{Enteros N}
    N | {Enteros N + 1}
end

caso en donde poder usarla
imprime los 3 numeros siguientes al 5
local L in
    L = {Enteros 5}
    case L of 
    A|B|C|_ = {Browse A|B|C}
    end
end






