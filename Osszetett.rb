def Abszolut(n)
    (n).abs
end

#Másolás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy f műveletet(asbszolút értéke például).
#2. Létrehozunk egy y tömböt, mérete n.
#3. Számláló ciklussal bejárjuk a bemeneti tömböt.
#4. Feltöltjük az összes elemet az y tömbbe.
#5. Kimenete az y tömb.
def Masolas(x, n)
    y = []
    for i in (0..n)
        y << Abszolut(x[i])
    end
    y
end

def _Masolas
    x = [5, 6, -7]
    n = x.length - 1
    puts "Másolás: #{Masolas(x, n)}"
end

_Masolas()

#Kiválogatás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy y tömböt, mérete n.
#3. Létrehozunk egy darabszám változót, értéke 0.
#4. Számláló ciklussal bejárjuk a tömböt 1-től n-ig.
#5. Ha az aktuális elem P tulajdonságú, akkor
#       - Növeljük a darabszámot.
#       - Átmásoljuk az aktuális elemet az y tömbbe.
#6. Kimenete az y tömb és darabszáma.
def Kivalogatas(x, n)
    y = []
    db = 0
    for i in (0..n)
        if(x[i] % 2 == 0)
            db += 1
            y[db] = x[i]
        end
    end
    {y: y, db: db}
end

def _Kivalogatas
    x = [1, 4, 3, 2, 6, 8, 9, 10]
    n = x.length - 1
    puts "Kiválogatás: #{Kivalogatas(x, n)}"
end

_Kivalogatas()

#Kiválogatás eredeti tömbben
#1. Bemenetként megadunk címszerint egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy darabszám változót, kezdeti értéke 0.
#3. Számláló ciklussal bejárjuk a tömböt.
#4. Ha az aktuális elem P tulajdonságú, akkor másolunk.
#5. Kimenete a P tulajdonságú elemek darabszáma.
def KivalogatasEredeti(x, n)
    db = 0
    for i in (1..n)
        if(x[i] % 2 == 0)
            db += 1
            x[db] = x[i]
        end
    end
    db
end

def _KivalogatasEredeti
    x = [2, 6, 9, 2, 4]
    n = x.length - 1
    
    db = KivalogatasEredeti(x, n)
    puts "Kiválogatás helyben: "
    for i in (0..db)
        puts x[i]
    end
end

_KivalogatasEredeti()

#Kiválogatás helyben, cserével
#1. Bemenetként megadunk címszerint egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy darabszám változót, kezdőértéke 0.
#3. Számláló ciklussal bejárjuk a tömböt.
#4. Ha az aktuális elem P tulajdonságú, akkor
#       - Növeljük a darabszámot.
#       - Megcseréljük az elemeket.
#5. Kimenete a P tulajdonságú elemek darabszáma.
def KivalogatasCsere(x, n)
    db = 0
    for i in (1..n)
        if(x[i] % 2 == 0)
            db += 1
            csere = x[i]
            x[i] = x[db]
            x[db] = csere
        end
    end
    db
end

def _KivalogatasCsere
    x = [2, 6, 8, 12, 5, 3, 2]
    n = x.length - 1
    db = KivalogatasCsere(x, n)
    puts "\nKiválogatás helyben, cserével: "
    for i in (0..db)
        puts x[i]
    end
end

_KivalogatasCsere()

#Szétválogatás
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk két különböző darabszám változót, kezdeti értékük 0.
#3. Létrehozunk két különböző kimeneti tömböt, méretük n.
#4. Számláló ciklussal bejárjuk a bemeneti tömböt.
#5. Ha az aktuális elem P tulajdonságú, akkor
#       - Növeljük a db1-et
#       - Átmásoljuk az aktuális elemet az y1 tömbbe
#6. Ha az aktuális elem nem P tulajdonságú, akkor
#       - Növeljük a db2-t
#       - Átmásoljuk az aktuális elemet az y2 tömbbe
def Szetvalogatas(x, n)
    db1 = 0
    db2 = 0
    y1 = []
    y2 = []
    for i in (0..n)
        if(x[i] % 2 == 0)
            db1 += 1
            y1[db1] = x[i]
        else
            db2 += 1
            y2[db2] = x[i]
        end
    end
    {y1: y1, db1: db1, y2: y2, db2: db2}
end

def _Szetvalogatas
    x = [2, 6, 9, 8, 1]
    n = x.length - 1
    puts "\nSzétválogatás: "
    y1 = Szetvalogatas(x, n).fetch(:y1)
    db1 = Szetvalogatas(x, n).fetch(:db1)

    y2 = Szetvalogatas(x, n).fetch(:y2)
    db2 = Szetvalogatas(x, n).fetch(:db2)

    print "y1: #{y1}, db1: #{db1}"
    puts
    print "y2: #{y2}, db2: #{db2}"
end

_Szetvalogatas()

#Szétválogatás egy tömbben
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy darabszám változót, kezdeti értéke 0.
#3. Létrehozunk egy y tömböt, mérete n.
#4. Létrehozunk egy jobb változót, értéke n + 1.
#5. Számláló ciklussal bejárjuk a tömböt.
#6. Ha az aktuális elem P tulajdonságú, akkor
#       - Növeljük a darabszámot.
#       - Átmásoljuk az y tömbbe az aktuális elemet a tömb elejére.
#7. Ha az aktuális elem nem P tulajdonságú, akkor
#       - Csökkentjük a jobb értékét.
#       - Átmásoljuk az y tömbbe az aktuális elemet a tömb végére.
#8. Kimenete az y tömb és a P tulajdonságú elemek darabszáma.
def SzetvalogatasEgy(x, n)
    db = 0
    y = []
    jobb = n + 2
    for i in (0..n)
        if(x[i] % 2 == 0)
            db += 1
            y[db] = x[i]
        else
            jobb -= 1
            y[jobb] = x[i]
        end
    end
    {y: y, db: db}
end

def _SzetvalogatasEgy
    x = [4, 1, 3, 8, 2, 7]
    n = x.length - 1
    #db = SzetvalogatasEgy(x, n).fetch(:db)
    y = SzetvalogatasEgy(x, n).fetch(:y)

    puts "\n\nSzétválogatás egyetlen tömbbe: "
    print y
    puts
end

_SzetvalogatasEgy()

#Szétválogatás eredeti tömbben
#1. Bemenetként megadunk címszerint egy tömböt, tömb méretét és egy P tulajdonságot.
#2. Létrehozunk egy bal változót, értéke 1.
#3. Létrehozunk egy jobb változót, értéke n.
#4. Létrehozunk egy segéd változót, értéke a tömb első eleme.
#5. Addig megyünk, míg a bal kisebb jobb-nál
#6. Belső előltesztelő ciklussal addig megyünk, míg a bal kisebb jobbnál és az aktuális elem nem P tulajdonságú
#       - Csökkentjük a jobb értékét.
#7. Ha a bal kisebb jobb-nál
#       - x[jobb] értékét belemásoljuk az x[bal]-ba
#       - A bal értékét növeljük.
#       - Belső előltesztelő ciklussal addig megyünk, míg a bal kisebb jobb-nál és az aktuális elem P tulajdonságú
#               - A bal értékét növeljük.
#       - Ha a bal kisebb jobb-nál
#               - x[bal] értékét belemásoljuk az x[jobb]-ba.
#               - Csökkentjük a jobb értékét.
#8. A segéd értékét belemásoljuk az x[bal]-ba.
#9. Ha az x[bal] P tulajdonságú, akkor
#       - A bal értékét belemásoljuk a db-ba.
#10. Kimenete a db.
def SzetvalogatasHelyben(x, n)
    db = 0
    bal = 0
    jobb = n
    seged = x[0]
    while(bal < jobb)
        while(bal < jobb && !(x[jobb] % 2 == 0))
            jobb -= 1
        end
        if(bal < jobb)
            x[bal] = x[jobb]
            bal += 1
            while(bal < jobb && x[bal] % 2 == 0)
                bal += 1
            end

            if(bal < jobb)
                x[jobb] = x[bal]
                jobb -= 1
            end
        end
    end
    x[bal] = seged
    if(x[bal] % 2 == 0)
        db = bal
    end
    db
end

def _SzetvalogatasHelyben
    x = [2, 6, 7, 20, 12, 1]
    n = x.length - 1
    SzetvalogatasHelyben(x, n)
    puts "\nSzétválogatás helyben: "
    print x
    puts
end

_SzetvalogatasHelyben()

#Metszet
#1. Bemenetként megadunk két tömböt, két tömb méretét.
#2. Létrehozunk egy y tömböt, mérete az első tömb mérete.
#3. Létrehozunk egy darabszám változót, értéke 0.
#4. Számláló ciklussal bejárjuk az első tömböt.
#5. Létrehozunk egy j változót, értéke 0.
#6. Belső előltesztelő ciklussal addig megyünk, míg j indexelő kisebb egyenlő második tömbnél és a két szomszéd nem egyenlő.
#       - Növeljük az j értékét.
#7. Ha az j indexelő kisebb egyenlő a második tömb méreténél, akkor
#       - Növeljük a darabszámot.
#       - Átmásoljuk az aktuális elemet az y tömbbe.
#9. Kimenete az y tömb és a darabszáma.
def Metszet(x1, n1, x2, n2)
    y = []
    db = 0
    for i in (0..n1)
        j = 0
        while(j <= n2 && x1[i] != x2[j])
            j += 1
        end
        if(j <= n2)
            db += 1
            y[db] = x1[i]
        end
    end
    {y: y, db: db}
end

def _Metszet
    x1 = [3, 2, 1, 3]
    n1 = x1.length - 1

    x2 = [2, 3, 2, 2]
    n2 = x2.length - 1

    y = Metszet(x1, n1, x2, n2).fetch(:y)
    # db = Metszet(x1, n1, x2, n2).fetch(:db)

    puts "\nMetszet: "
    print y
end

_Metszet()

#Unió
#1. Bemenetként megadunk két tömböt és a két tömb méretét.
#2. Létrehozunk egy darabszámot, kezdeti értéke n1.
#3. Létrehozunk egy y tömböt, mérete a két bemeneti tömb mérete összegezve.
#4. Számláló ciklussal bejárjuk az első tömböt.
#       - Feltöltjük az összes elemet az y tömbbe
#5. Számláló ciklussal bejárjuk a második tömböt.
#6. Létrehozunk egy i indexelót, értéke 0.
#7. Belső előltesztelő ciklussal addig megyünk, míg az i indexelő kisebb egyenlő az első tömb méreténél és a két szomszéd nem egyenlő.
#       - Növeljük az i indexelőt.
#8. Ha az i indexelő nagyobb az első tömb méreténél, akkor
#       - Növeljük a darabszámot.
#       - Átmásoljuk az aktuális elemet(második tömb) az y tömbbe.
#9. Kimenete az y tömb és a darabszáma.
def Unio(x1, n1, x2, n2)
    db = n1
    y = []
    for i in (0..n1)
        y << x1[i]
    end
    for j in (0..n2)
        i = 0
        while(i <= n1 && x1[i] != x2[j])
            i += 1
        end
        if(i > n1)
            db += 1
            y[db] = x2[j]
        end
    end
    {y: y, db: db}
end

def _Unio
    x1 = [1, 6, 7, 8, 10]
    n1 = x1.length - 1

    x2 = [2, 6, 7, 8, 11, 76]
    n2 = x2.length - 1

    y = Unio(x1, n1, x2, n2).fetch(:y)
    # db = Unio(x1, n1, x2, n2).fetch(:db)

    puts "\n\nUnió: "
    print y
    puts
end

_Unio()

#Összefuttatás
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt és a méreteiket.
#2. Létrehozunk egy y tömböt, mérete a két bemeneti tömb mérete összegezve.
#3. Létrehozunk két indexelőt(i, j), kezdeti értékei 1.
#4. Létrehozunk egy darabszám változót, kezdeti értéke 0.
#5. Előltesztelő ciklussal addig megyünk, míg a két indexelő nem nagyobb a két bemeneti tömb méreténél.
#       - Növeljük a darabszám értékét.
#       - Ha x1[i] kisebb x2[j]-nél, akkor
#               - Átmásoljuk az x1[i] értékét az y tömbbe.
#               - Növeljük az i indexelőt.
#       - Különben
#               - Ha x1[i] nagyobb az x2[j]-nél, akkor
#                       - Átmásoljuk az x2[j] értékét az y tömbbe.
#                       - Növeljük az j indexelőt.
#               - Különben
#                       - Átmásoljuk az x1[i] értékét az y tömbbe.
#                       - Növeljük mindkét indexelőt.
#6. Előltesztelő ciklussal addig megyünk, míg i indexelő kisebb egyenlő az első tömb méreténél.
#       - Növeljük a darabszámot.
#       - Átmásoljuk az x1[i] értékét az y tömbbe.
#       - Növeljük az i indexelőt.
#7. Előltesztelő ciklussal addig megyünk, míg j indexelő kisebb egyenlő a második tömb méreténél.
#       - Növeljük a darabszámot.
#       - Átmásoljuk az xj[j] értékét az y tömbbe.
#       - Növeljük az j indexelőt.
#8. Kimenete az y tömb és a darabszáma.
def Osszefuttatas(x1, n1, x2, n2)
    y = []
    i = 0
    j = 0
    db = 0
    while((i < n1) && (j < n2))
        db += 1
        if(x1[i] < x2[j])
            y[db] = x1[i]
            i += 1
        else
            if(x1[i] > x2[j])
                y[db] = x2[j]
                j += 1
            else
                y[db] = x1[i]
                i += 1
                j += 1
            end
        end
    end
    while(i < n1)
        db += 1
        y[db] = x1[i]
        i += 1
    end
    while(j < n2)
        db += 1
        y[db] = x2[j]
        j += 1
    end
    {y: y, db: db}
end

def _Osszefuttatas
    x1 = [2, 3, 5, 8]
    n1 = x1.length

    x2 = [1, 3, 4, 8, 10]
    n2 = x2.length

    y = Osszefuttatas(x1, n1, x2, n2).fetch(:y)

    puts "\nÖsszefuttatás: "
    print y
    puts
end

_Osszefuttatas()