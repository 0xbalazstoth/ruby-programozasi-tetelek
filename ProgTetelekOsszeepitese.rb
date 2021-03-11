#f művelet
def Abszolut(n)
    (n).abs
end

#Másolás és sorozatszámítás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy f műveletet.
#2. Létrehozunk egy érték változót, kezdeti értéke 0.(Összegzésnél 0)
#3. Számláló ciklussal bejárjuk a tömböt
#4. Konkatenáljuk az aktuális elemet az érték változóhoz, ami módosított f művelet segítségével, pl abszolút érték.
#5. Kimenete az érték.
def MasolasSorozatszamitas(x, n)
    ertek = 0
    for i in (0..n)
        ertek += Abszolut(x[i])
    end
    ertek
end

def _MasolasSorozatszamitas()
    x = [2, 4]
    n = x.length - 1
    puts "Másolás és sorozatszámítás: #{MasolasSorozatszamitas(x, n)}"
end

_MasolasSorozatszamitas()

#Másolás és maximumkiválasztás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy f műveletet
#2. Létrehozunk egy max változót, amiben a tömb első elem indexét tároljuk el.
#3. Létrehozunk egy maxérték változót, aminek értéke a tömb első eleme, ami módosítva van az f művelettel.
#4. Számláló ciklussal elmegyünk 2-től n-ig.
#5. Létrehozunk egy segéd változót, aminek az értéke f(x[i]).
#6. Ha a kiválasztott legnagyobb elem nagyobb a segéd-nél, akkor
#       - Átmásoljuk a max változóba az i indexelőt.
#       - Átmásoljuk a maxérték változóba a segéd értékét.
#7. Kimenete a max és a maxérték.
def MasolasMaximumkivalasztas(x, n)
    max = 0
    maxertek = Abszolut(x[0])
    for i in (1..n)
        seged = Abszolut(x[i])
        if(maxertek < seged)
            max = i
            maxertek = seged
        end
    end
    {max: max, maxertek: maxertek}
end

def _MasolasMaximumkivalasztas()
    x = [2, 6, -9, 12, -123]
    n = x.length - 1
    max = MasolasMaximumkivalasztas(x, n).fetch(:max)
    maxertek = MasolasMaximumkivalasztas(x, n).fetch(:maxertek)

    puts "\nMásolás és maximumkiválasztás: "
    print "max: #{max}"
    puts "\nmaxérték: #{maxertek}"
end

_MasolasMaximumkivalasztas()

#Megszámolás és keresés
#1. Bemenetként megadunk egy tömböt, tömb méretét, P tulajdonságot és egy k db keresett értéket.
#2. Létrehozunk egy darabszám változót, kezdeti értéke 0.
#3. Létrehozunk egy i indexelőt, kezdeti értéke 0.
#4. Előltesztelő ciklussal addig megyünk, míg az i indexelő nem nagyobb n-nél és a darabszám kisebb a k-nál.
#       - Növeljük az i indexelőt.
#       - Ha az aktuális elem P tulajdonságú, akkor
#               - Növeljük a darabszámot.
#5. Megvizsgáljuk, ha a darabszám egyenlő a k-val.
#6. Ha van, akkor a kimenete választ ad arra, hogy volt-e vagy sem, és hol volt az első P tulajdonságú elem indexe.
def MegszamolasKereses(x, n, k)
    db = 0
    i = 0
    while(i < n && db < k)
        i += 1
        if(x[i] % 2 == 0)
            db += 1
        end
    end
    van = (db == k)
    if(van)
        index = i
        {van: van, index: index}
    else
        {van: false, index: -1}
    end
end

def _MegszamolasKereses()
    x = [1, 5, 1, 9, 43, 6, 10, 2]
    n = x.length - 1
    k = 1
    van = MegszamolasKereses(x, n, k).fetch(:van)
    index = MegszamolasKereses(x, n, k).fetch(:index)

    puts "\nMegszámolás és keresés:"
    puts "van: #{van} ; index: #{index}"
end

_MegszamolasKereses()

#Maximumkiválasztás és kiválogatás
#1. Bemenetként megadunk egy tömböt, tömb méretét.
#2. Létrehozunk egy y tömböt, mérete n.
#3. Kiválasztjuk a tömb első elemét a legnagyobbnak.
#4. Létrehozunk egy darabszámot, kezdeti értéke 1.
#5. Az y[db] értéke 1.
#6. Számláló ciklussal bejárjuk a bemeneti tömböt.
#7. Ha az aktuális elem nagyobb a kiválasztott legnagyobb elemnél, akkor
#       - Átmásoljuk az aktuális értéket a maxértékbe.
#       - Darabszámot 1-re állítjuk.
#       - y[db] értéke 1.
#8. Különben
#       - Ha az aktuális érték egyenlő az aktuális legnagyobb elemmel, akkor
#               - Növeljük a darabszámot.
#               - Átmásoljuk az indexet az y tömbbe.
#9. Kimenete az y tömb, darabszáma és a legnagyobb elem.
def MaximumkivalasztasKivalogatas(x, n)
    y = []
    maxertek = x[0]
    db = 0
    y[db] = 0
    for i in (0..n)
        if(x[i] > maxertek)
            maxertek = x[i]
            db = 0
            y[db] = i
        else
            if(x[i] == maxertek)
                db += 1
                y[db] = i
            end
        end
    end
    {db: db, y: y, maxertek: maxertek}
end

def _MaximumkivalasztasKivalogatas()
    x = [2, 5, 8, 9, 10, 10]
    n = x.length - 1
    db = MaximumkivalasztasKivalogatas(x, n).fetch(:db)
    y = MaximumkivalasztasKivalogatas(x, n).fetch(:y)
    maxertek = MaximumkivalasztasKivalogatas(x, n).fetch(:maxertek)

    puts "\nMaximumkiválasztás és kiválogatás: "
    puts "db: #{db}\n"
    print "y: #{y}"
    puts "\nmaxérték: #{maxertek}"
end

_MaximumkivalasztasKivalogatas()

#Kiválogatás és sorozatszámítás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy érték változót, kezdeti értéke 0.
#4. Számláló ciklussal bejárjuk a tömböt.
#5. Ha az aktuális elem P tulajdonságú, akkor
#       - Konkatenáljuk az aktuális értéket az érték változóba.
#6. Kimenete az érték.
def KivalogatasSorozatszamitas(x, n)
    ertek = 0
    for i in (0..n)
        if(x[i] % 2 == 0)
            ertek += x[i]
        end
    end
    ertek
end

def _KivalogatasSorozatszamitas()
    x = [3, 6, 1, 8, 4]
    n = x.length - 1
    puts "\nKiválogatás és sorozatszámítás: "
    puts "érték: #{KivalogatasSorozatszamitas(x, n)}"
end

_KivalogatasSorozatszamitas()

#Kiválogatás és maximumkiválasztás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Kiválasztjuk egy nagyon kicsi értéket legnagyobbként.
#3. Számláló ciklussal bejárjuk a tömböt.
#4. Ha az aktuális elem P tulajdonságú és nagyobb a kiválasztott legnagyobb elemnél, akkor
#       - Átmásoljuk az indexet a max változóba.
#       - Átmásoljuk az aktuális értéket a maxertek változóba.
#5. Megvizsgáljuk, hogy a legnagyobb elem nagyobb-e a nagyon kicsi értéknél, ha igen, akkor
#6. Kimenete választ ad arra, hogy van-e, hol található és melyik elem az.
def KivalogatasMaximumkivalasztas(x, n)
    maxertek = -999999
    max = 0
    for i in (0..n)
        if(x[i] % 2 == 0 && x[i] > maxertek)
            max = i
            maxertek = x[i] 
        end
    end
    van = (maxertek > -999999)
    if(van)
        {van: van, max: max, maxertek: maxertek}
    else
        {van: false, max: -1, maxertek: nil}
    end
end

def _KivalogatasMaximumkivalasztas()
    x = [2, 7, 4, 7, 7, 3, 7, 8, 1, 6, 7, 8, 8, 3, 7, 9, 8, 9, 80]
    n = x.length - 1
    van = KivalogatasMaximumkivalasztas(x, n).fetch(:van)
    max = KivalogatasMaximumkivalasztas(x, n).fetch(:max)
    maxertek = KivalogatasMaximumkivalasztas(x, n).fetch(:maxertek)

    puts "\nKiválogatás és maximumkiválasztás: "
    puts "van: #{van}"
    puts "max: #{max}"
    puts "maxertek: #{maxertek}"
end

_KivalogatasMaximumkivalasztas()