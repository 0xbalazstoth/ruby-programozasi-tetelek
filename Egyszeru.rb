#Sorozatszámítás
#1. Bemenetként megadunk egy tömböt és a tömb méretét.
#2. Létrehozunk egy érték változót, kezdeti értéke 0, ha összegezni akarunk.
#3. Számláló ciklussal bejárjuk a bemeneti tömböt 1-től n-ig.
#4. Konkatenáljuk az aktuális elemet az érték változóhoz.
#5. Kimenete a tömb elemeinek összege.
def Sorozatszamitas(x, n)
    ertek = 0
    for i in (0..n - 1) do
        ertek += x[i]
    end
    ertek
end

def _Sorozatszamitas
    x = [2, 2, 3]
    n = x.length

    puts "Sorozatszámítás: #{Sorozatszamitas(x, n)}"
end

_Sorozatszamitas()

#Eldöntés
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy i változót, értéke 0.
#3. Addig megyünk, míg az aktuális elem nem P tulajdonságú és az i nem nagyobb a tömb méreténél.
#4. Megvizsgáljuk, hogy az i indexelő érvényes-e még.
#5. Kimenete választ ad arra, hogy talált-e P tulajdonságú elemet-e vagy sem.

def Eldontes(x, n)
    i = 0
    while(i <= n && x[i] % 2 != 0)
        i += 1
    end
    van = (i <= n)
    van
end

def _Eldontes
    x = [1, 3, 9, 7, 8]
    n = x.length - 1
    puts "Eldöntés: #{Eldontes(x, n)}"
end

_Eldontes()

#Módosított eldöntés
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy i változót, kezdeti értéke 0.
#3. Addig megyünk, míg minden elem nem P tulajdonságú és az i nem nagyobb a tömb méreténél.
#4. Megvizsgáljuk, hogy az i érvényes-e még.
#5. Kimenete választ ad arra, hogy minden elem P tulajdonságú-e vagy sem.

def ModositottEldontes(x, n)
    i = 0
    while(i <= n && x[i] % 2 == 0)
        i += 1
    end
    van = (i > n)
    van
end

def _ModositottEldontes
    x = [2, 4, 6, 8]
    n = x.length - 1
    puts "Módosított eldöntés: #{ModositottEldontes(x, n)}"
end

_ModositottEldontes()

#Kiválasztás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságú elemet.
#2. Létrehozunk egy i változót, értéke 0.
#3. Addig megyünk, míg i indexeló nem nagyobb n-nél és az aktuális elem nem P tulajdonságú.
#4. Megvizsgáljuk, hogy az i indexelő érvényes-e még.
#5. Kimenete a P tulajdonságú elem indexe.
def Kivalasztas(x, n)
    i = 0
    while(i <= n && x[i] % 2 != 0)
        i += 1
    end
    van = (i <= n)
    van
end

def _Kivalasztas
    x = [1, 3, 7, 4]
    n = x.length - 1
    puts "Kiválasztás: #{Kivalasztas(x, n)}"
end

_Kivalasztas()

#Lineáris keresés
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy i változót, kezdeti értéke 0.
#3. Addig megyünk, míg i indexelő nem nagyobb n-nél és az aktuális elem nem P tulajdonságú.
#4. Megvizsgáljuk, hogy i indexelő érvényes-e még vagy sem.
#5. Kimenete a P tulajdonságú elem indexe és választ ad arra, hogy talált-e vagy sem.
def LinearisKereses(x, n)
    i = 0
    while(i <= n && x[i] % 2 != 0)
        i += 1
    end
    van = (i <= n)
    if(van)
        {van: van, index: i}
    else
        {van: false, index: -1}
    end
end

def _LinearisKereses
    x = [1, 4, 5, 9, 4, 8, 10]
    n = x.length - 1
    puts "Lineáris keresés: #{LinearisKereses(x, n)}"
end

_LinearisKereses()

#Megszámlálás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy darabszám változót, kezdeti értéke 0.
#3. Számláló ciklussal bejárjuk a tömböt.
#4. Ha az aktuális elem P tulajdonságú elem, akkor
#       - Növeljük a darabszámot.
#5. Kimenete a darabszám változó.
def Megszamlalas(x, n)
    darabszam = 0
    for i in (0..n)
        if(i % 2 == 0)
            darabszam += 1
        end
    end
    darabszam
end

def _Megszamlalas
    x = [1, 2, 6, 7, 10]
    n = x.length - 1
    puts "Megszámlálás: #{Megszamlalas(x, n)}"
end

_Megszamlalas()

#Maximumkiválasztás
#1. Bemenetként megadunk egy tömböt, tömb méretét
#2. Létrehozunk egy max változót, aminek megadjuk a tömb első elemét indexét, így ez a legnagyobb elem.
#3. Számláló ciklussal bejárjuk a tömböt.
#4. Ha az aktuális elem nagyobb a kiválasztott legnagyobb elemnél, akkor új legnagyobb elemet kaptunk.
#       - Átmásoljuk az aktuális elem indexét a max változóba.
#5. Kimenete a max változót(legnagyobb elem indexe)
def Maximumkivalasztas(x, n)
    max = 0
    for i in (1..n)
        if(x[i] > x[max])
            max = i
        end
    end
    max
end

def _Maximumkivalasztas
    x = [2, 5, 7, 9, 23]
    n = x.length - 1
    puts "Maximumkiválasztás: #{Maximumkivalasztas(x, n)}"
end

_Maximumkivalasztas()