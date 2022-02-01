#Rekurzió jellemzői:
#Azt az esetet nevezzük így, amikor egy eljárásban szerepló kód önmagát hívja meg.
#A leállást biztosító esetet alapesetnek nevezzük.
#Paraméterei folyamatosan változnak, ha name, akkor végtelen hívási láncba kerülnénel.
#Egyszerűbbé és átláthatóbbá tehetik a kód készítését.
#Hátránya, hogy erőforrás igényes. Túlcsorduláskor, futási idővel leáll(stack overflow), egyéb esetben a memória felülíródik, aminek
#következtében a rendszer el is szállhat.
#
#Minden rekurzív algoritmusnak van iteratív megoldása is.
#Összetevői:
#1. Alapeset: n = 0
#2. Indukciós lépés: Visszavezetjük a problémát egy előző feladatra, aminek a megoldása egyszerűbb.

#Faktoriális számítás rekurzívan
#1. Bemenetként megadunk egy n természetes számot.
#2. Ha az n egyenlő nullával, akkor a kimenete 1.
#3. Különben
#       - Meghívja önmagát, paraméterei: n - 1, majd n-nel megszorozzuk.
#4. Kimenete n!
def Faktorialis(n)
    if(n == 0)
        1
    else
        n * Faktorialis(n - 1)
    end
end

def _Faktorialis
    n = 4
    fakt = Faktorialis(n) #4 * 3 * 2 * 1 = 24
    puts "Faktoriális rekurzívan: "
    puts fakt
end

_Faktorialis()

#Fibonacci számok rekurzívan:
#1. Bemenetként megadunk egy n egész számot.
#2. Ha n kisebb egyenlő 1-nél, akkor
#       - Kimenete 1.
#3. Különben
#       - Meghívja önmagát, paraméterei: n - 2, majd összeadjuk önmagával, paraméterei: n - 1
def Fibonacci(n)
    if(n <= 1)
        1
    else
        Fibonacci(n - 2) + Fibonacci(n - 1)
    end
end

def _Fibonacci
    n = 6
    fibonacci = Fibonacci(n)
    puts "\nFibonacci számok rekurzívan: "
    puts fibonacci
end

_Fibonacci()

#Hatványozás rekurzívan:
#1. Bemenetként megadunk egy számot és egy n egész számot.
#2. Ha n egyenlő 1, akkor
#       - Kimenete a
#3. Különben
#       - Meghívja önmagát, paraméterei: a, n - 1, majd megszorozzuk a-val
#4. Kimenete a az n-ediken
def Hatvanyozas(a, b)
    if b > 0
        if b.even?
          x = Hatvanyozas(a, b / 2)
          x * x
        else
          a * Hatvanyozas(a, b - 1)
        end
    else
        1
    end
end

def _Hatvanyozas
    a = 3
    n = 7
    hatvany = Hatvanyozas(a, n)
    puts "\nHatványozás: "
    puts "#{a} a #{n}-ediken = #{hatvany}"
end

_Hatvanyozas()

#Hanoi tornyai
#1. Bemenetként megadunk egy n egész számot, forrás rudat, cél rudat és egy segéd rudat.
#2. Ha n - 1 korongot át tudnánk mozgatni a középső rúdra, akkor az n-edik korong ezután már áttehető a jobbszélső rúdra, majd
#a középső rúdról kell az n - 1 korongot a jobbszélsőre tenni.
#3. Leáll, ha a legkisebb korong mindig felül van, és bárhonnan bárhova mozgatható.
def HanoiTornyai(n, forras, cel, seged)
    return unless n

    if(n == 1)
        puts "1. lemez mozgatás, forrás rúdról \"#{forras}\" a cél rúdra \"#{cel}\""
    else
        HanoiTornyai(n - 1, forras, seged, cel)
        puts "#{n}. lemez mozgatás,  forrás rúdról \"#{forras}\" a cél rúdra \"#{cel}\""

        HanoiTornyai(n - 1, seged, cel, forras)
    end
end

def _HanoiTornyai
    HanoiTornyai(4, 'A', 'C', 'B')
end

_HanoiTornyai()

#Sorozatszámítás rekurzívan:
#1. Bemenetként megadunk egy tömböt és egy jobb egészt.
#2. Ha a jobb egyenlő nullával, akkor
#       - Kimenete a művelete kiindulási értéke.
#3. Különben
#       - Meghívja önmagát, paraméterei: x, jobb - 1, majd összeadjuk az x[jobb] értékkel.
#4. Kimenete a műveleti eredmény(összegzés például...)
def Sorozatszamitas(x, jobb)
    if(jobb == 0)
        0
    else
        (Sorozatszamitas(x, jobb - 1) + x[jobb - 1])
    end
end

def _Sorozatszamitas
    x = [5, 6, 10, 5, 10]
    n = x.length
    sum = Sorozatszamitas(x, n)
    puts "\nSorozatszámítás rekurzívan: "
    puts sum
end

_Sorozatszamitas()

#Lineáris keresés rekurzívan:
#1. Bemenetként megadunk egy tömböt, bal indexet, tömb méretét és egy P tulajdonságot.
#2. Ha a bal nagyobb n-nél, akkor
#       - Kimenete 0
#3. Különben
#       - Ha az x[bal] P tulajdonságú, akkor
#               - Kimenete a bal
#       - Különben
#               - Meghívja önmagát, paraméterei: x, bal + 1, n, P tulajdonság
#4. Kimenetnél az első P tulajdonságú elem indexét adja meg, ha nins akkor 0.
def LinearisKereses(x, bal, n)
    if(bal > n)
        0
    else
        if(x[bal] % 2 == 0)
            bal
        else
            LinearisKereses(x, bal + 1, n)
        end
    end
end

def _LinearisKereses
    x = [3, 9, 4, 1, 8]
    n = x.length - 1
    bal = 0
    van = LinearisKereses(x, bal, n)
    puts "\nLineáris keresés rekurzívan: "
    puts van
end

_LinearisKereses()

#Logaritmikus keresés rekurzívan:
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt, bal, jobb indexelőt és egy k keresett értéket.
#2. Ha a bal nagyobb jobb-nál, akkor
#       - Kimenete 0.
#3. Különben
#       - Kiválasztjuk a tömb középső elemét.
#       - Ha az aktuális elem egyenlő a k keresett értékkel, akkor
#               - Kimenete a center
#       - Különben
#               - Ha az aktuális elem nagyobb a keresett értéknél, akkor biztos a tömb első felében van.
#                       - Meghívja önmagát, paraméterei, x, bal, center - 1, k
#               - Ha az aktuális elem kisebb a keresett értéknél, akkor biztos a tömb második felében van.
#                       - Meghívja önmagát, paraméterei, x, center + 1, jobb, k
#4. Kimenete a k keresett érték indexe.
def LogaritmikusKereses(x, bal, jobb, k)
    if(bal > jobb)
        0
    else
        center = (bal + jobb) / 2
        if(x[center] == k)
            center
        else
            if(x[center] > k)
                LogaritmikusKereses(x, bal, center - 1, k)
            else
                LogaritmikusKereses(x, center + 1, jobb, k)
            end
        end
    end
end

def _LogaritmikusKereses
    x = [5, 7, 9, 11, 44]
    bal = 0
    jobb = x.length - 1
    k = 44
    idx = LogaritmikusKereses(x, bal, jobb, k)
    puts "\nLogaritmikus keresés: "
    puts idx
end

_LogaritmikusKereses()

#Megszámlálás rekurzívan:
#1. Bemenetként megadunk egy tömböt, jobb indexelőt és egy P tulajdonságot.
#2. Ha a jobb egyenlő nullával, akkor
#       - Kimenete 0
#3. Különben
#       - Ha az x[jobb] P tulajdonságú, akkor
#               - Meghívja önmagát, paraméterei: x, jobb - 1, P, majd hozzáadunk egyet, így növeljük a darabszámot.
#       - Különben
#               - Meghívja önmagát, paraméterei: x, jobb - 1, P, így lépünk a következő elemre, ha az aktuális elem nem P tulajdonságú.
#4. Kimenete a P tulajdonságú elemek darabszáma.
def Megszamlalas(x, jobb)
    if(jobb == 0)
        0
    else
        if(x[jobb - 1] % 2 == 0)
            1 + Megszamlalas(x, jobb - 1)
        else
            Megszamlalas(x, jobb - 1)
        end
    end
end

def _Megszamlalas
    x = [4, 7, 9, 10, 6]
    jobb = x.length
    db = Megszamlalas(x, jobb)
    puts "\nMegszámlálás: "
    puts db
end

_Megszamlalas()

#Maximumkiválasztás rekurzívan:
#1. Bemenetként megadunk egy tömböt és a jobb indexelőt.
#2. Ha a jobb egyenlő nullával, akkor    
#       - Kimenete 1
#3. Különben
#       - Kiválasztjuk a tömb első elemét a legnagyobbnak
#       - Ha az x[jobb] nagyobb a kiválasztott legnagyobb elemnél, akkor
#               - Kimenete jobb elem indexe
#       - Különben
#               - Kimenete a max elem indexe
def Maximumkivalasztas(x, jobb)
    if(jobb == 0)
        0
    else
        max = Maximumkivalasztas(x, jobb - 1)
        if(x[jobb] > max)
            jobb
        else
            max
        end
    end
end

def _Maximumkivalasztas
    x = [2, 1, 6, 5, 8, 3]
    jobb = x.length - 1
    max = Maximumkivalasztas(x, jobb)
    puts "\nMaximumkiválasztás rekurzívan: "
    puts max
end

_Maximumkivalasztas()