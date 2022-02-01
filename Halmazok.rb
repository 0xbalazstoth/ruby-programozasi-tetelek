#Halmaztulajdonság vizsgálata
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt és a méretét.
#2. Létrehozunk egy i indexelőt, értéke 2.
#3. Előltesztelő ciklussal addig megyünk, míg az i kisebb egyenlő n-nél és a kisebb indexű elem nem egyenlő a nagyobb indexű elemmel.
#       - Növeljük az i indexelőt.
#4. Ha az i indexelő nagyobb n-nél, akkor a kimenete igaz, más esetben hamis.
def HalmaztulajdonsagVizsgalata(x, n)
    i = 1
    while(i <= n && x[i] != x[i - 1])
        i += 1
    end
    halmaz_e = (i > n)
    halmaz_e
end

def _HalmaztulajdonsagVizsgalata
    x = [5, 6, 7, 12, 43]
    n = x.length - 1
    halmaz_e = HalmaztulajdonsagVizsgalata(x, n)
    puts "Halmaztulajdonság vizsgálata: "
    puts "Halmaz? #{halmaz_e == true ? "Igen" : "Nem"}"
end

_HalmaztulajdonsagVizsgalata()

#Halmaz létrehozása
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt és a tömb méretét.
#2. Létrehozunk egy a tömböt, mérete n.
#3. Létrehozunk egy db változót, értéke 1.
#4. a[db] értéke a bemeneti tömb első eleme.
#5. Számláló ciklussal 2-től elmegyünk n-ig.
#       - Ha az aktuális elem nem egyenlő az a tömb aktuális elemével, akkor
#               - Növeljük a darabszámot
#               - Átmásoljuk az aktuális elemet a kimeneti tömbbe(a).
#6. Kimenete a létrehozott halmaz és darabszáma.
def HalmazLetrehozasa(x, n)
    a = []
    db = 0
    a[db] = x[0]
    for i in(1..n)
        if(x[i] != a[db])
            db += 1
            a[db] = x[i]
        end
    end
    {a: a, db: db}
end

def _HalmazLetrehozasa
    x = [5, 8, 8, 8, 56, 56, 300, 401, 401]
    n = x.length - 1
    a = HalmazLetrehozasa(x, n).fetch(:a)
    db = HalmazLetrehozasa(x, n).fetch(:db)
    puts "\nHalmaz létrehozása: "
    puts "a: #{a}; db: #{db}"
end

_HalmazLetrehozasa()

#Tartalmazás vizsgálat
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt, méretét és egy k keresett értéket.
#2. Létrehozunk egy bal változót, értéke 1.
#3. Létrehozunk egy jobb változót, értéke n.
#4. Kiválasztjuk a tömb középső elemét.
#5. Előltesztelő ciklussal addig megyünk, míg a bal kisebb egyenlő a jobb-nál és az aktuális elem nem egyenlő a k keresett értéknél.
#       - Ha az aktuális elem nagyobb a k keresett értéknél, akkor biztos a tömb első felében van.
#               - A jobb értéke center - 1
#       - Ha az aktuális elem kisebb a k keresett értéknél, akkor biztos a tömb második felében van.
#               - A bal értéke center + 1
#6. Új középső elemet választunk.
#7. Megvizsgáljuk, hogy a bal kisebb egyenlő-e a jobb-nál, ha igen, akkor
#8. Kimenete igaz, más esetben hamis.
def TartalmazasVizsgalat(x, n, k)
    bal = 0
    jobb = n
    center = (bal + jobb) / 2
    while(bal <= jobb && x[center] != k)
        if(x[center] > k)
            jobb = center - 1
        else
            bal = center + 1
        end
        center = (bal + jobb) / 2
    end
    tartalmazza_e = (bal <= jobb)
    tartalmazza_e
end

def _TartalmazasVizsgalat
    x = [5, 7, 9, 88, 344]
    n = x.length - 1
    tartalmazza_e = TartalmazasVizsgalat(x, n, 880)
    puts "\nTartalmazás vizsgálat: "
    puts tartalmazza_e == true ? "Igen" : "Nem"
end

_TartalmazasVizsgalat()

#Részhalmaz vizsgálat: Ha az a halmaz több elemet tartalmaz mint a b (m > n), akkor biztos, hogy a nem részhalmaza b-nek.
#1. Bemenetként megadunk két növekvő módon rendezett tömböt és a méreteiket.
#2. Létrehozunk két indexelőt, kezdeti értékük 1.
#3. Előltesztelő ciklussal addig megyünk, míg a két indexelő nem nagyobb a bemeneti tömbök méreténél és az a halmaz aktuális eleme nagyobb a b halmaz aktuális eleménél.
#       - Ha az a halmaz aktuális eleme egyenlő a b halmaz aktuális elemével, akkor
#               - Növeljük az i indexelőt.
#       - Növeljük a j indexelőt.
#4. Megvizsgáljuk, hogy az i indexelő nagyobb-e az a halmaz méreténél-e, ha igen, akkor
#5. Kimenete igaz, más esetben hamis.
def ReszhalmazVizsgalat(a, m, b, n)
    i = 0
    j = 0
    while(i <= m && j <= n && a[i] >= b[j])
        if(a[i] == b[j])
            i += 1
        end
        j += 1
    end
    reszhalmaz_e = (i > m) #Pontosan akkor igaz, ha a részhalmaza b-nek.
    reszhalmaz_e
end

def _ReszhalmazVizsgalat
    a = [1, 3, 5]
    m = a.length - 1

    b = [1, 3, 5, 8, 9, 122]
    n = b.length - 1

    reszhalmaz_e = ReszhalmazVizsgalat(a, m, b, n)
    puts "\nRészhalmaz vizsgálat: "
    puts "#{reszhalmaz_e == true ? "Igen" : "Nem"}"
end

_ReszhalmazVizsgalat()

#Unió
#1. Bemenetként megadunk két növekvő módon rendezett tömböt és a méreteiket.
#2. Létrehozunk egy b tömböt, mérete a két bemeneti tömb mérete összegezve.
#3. Létrehozunk két indexelőt, értékük 1.
#4. Létrehozunk egy darabszám változót, értéke 0.
#5. n1 értéke n1 + 1
#6. Az a1 tömb első elemének beállítunk egy nagyon nagy értéket.
#7. n2 értéke n2 + 1
#8. Az a2 tömb első elemének beállítunk egy nagyon nagy értéket.
#9. Előltesztelő ciklussal addig megyünk, míg az indexelőt nem nagyobbak a bemeneti tömböknél.
#       - Növeljük a darabszámot.
#       - Ha a1[i] kisebb az a2[j]-nél, akkor
#               - Átmásoljuk az a1 tömbböl az aktuális elemet a kimeneti tömbbe.
#               - Növeljük az i indexelőt.
#       - Különben
#           - Ha az a1[i] nagyobb az a2[j]-nél, akkor
#               - Átmásoljuk az a2 tömbböl az aktuális elemet a kimeneti tömbbe.
#               - Növeljük az j indexelőt.
#           - Különben
#               -  Átmásoljuk az a1 tömbböl az aktuális elemet a kimeneti tömbbe.
#               - Növeljük az i indexelőt.
#               - Növeljük az j indexelőt.
#10. Kimenete a b tömb és a darabszáma.
def Unio(a1, n1, a2, n2)
    b = Array.new(n1 + n2)
    i = 0
    j = 0
    db = 0
    n1 = n1 + 1
    a1[n1] = 999999
    n2 = n2 + 1
    a2[n2] = 999999
    while(i <= n1 && j <= n2)
        db += 1
        if(a1[i] < a2[j])
            b[db] = a1[i]
            i += 1
        else
            if(a1[i] > a2[j])
                b[db] = a2[j]
                j += 1
            else
                b[db] = a1[i]
                i += 1
                j += 1
            end
        end
    end
    {b: b, db: db}
end

def _Unio
    a1 = [2, 3, 4, 5, 8]
    n1 = a1.length - 1

    a2 = [1, 3, 5, 7]
    n2 = a2.length - 1
    b = Unio(a1, n1, a2, n2).fetch(:b)
    db = Unio(a1, n1, a2, n2).fetch(:db)

    puts "\nUnió: "
    for i in (1..(db - 1))
        print "#{b[i]} "
    end
end

_Unio()

#Metszet
#1. Bemenetként megadunk két növekvő módon rendezett tömböt, és a méreteiket.
#2. Létrehozunk egy b tömböt, méretét úgy adjuk meg, hogy a kevesebb elemű tömb méretét adjuk meg.
#3. Létrehozunk két indexelőt, értékük 1.
#4. Létrehozunk egy darabszám változót, értéke 0.
#5. Előltesztelő ciklussal addig megyünk, míg a két indexelő nem nagyobb a két bemeneti tömbnél.
#       - Ha az a1[i] kisebb az a2[j]-nél, akkor
#               - Növeljük az i indexelőt.
#       - Különben ha az a1[i] nagyobb az a2[j]-nél, akkor
#               - Növeljük a j indexelőt.
#       - Különben
#               - Növeljük a darabszámot.
#               - Átmásoljuk az a1 aktuális elemét a b tömbbe.
#               - Növeljük mindkét indexelőt.
#6. Kimenete a b tömb és darabszáma.
def Metszet(a1, n1, a2, n2)
    b = Array.new([n1, n2].min)
    i = 0
    j = 0
    db = 0
    while(i <= n1 && j <= n2)
        if(a1[i] < a2[j])
            i += 1
        elsif(a1[i] > a2[j])
            j += 1
        else
            db += 1
            b[db] = a1[i]
            i += 1
            j += 1
        end
    end
    {b: b, db: db}
end

def _Metszet
    a1 = [2, 3, 4, 5, 8, 9]
    n1 = a1.length - 1

    a2 = [1, 5, 7, 8, 9]
    n2 = a2.length - 1

    b = Metszet(a1, n1, a2, n2).fetch(:b)
    db = Metszet(a1, n1, a2, n2).fetch(:db)

    puts "\n\nMetszet: "
    for i in (1..db)
        print "#{b[i]} "
    end
end

_Metszet()

#Halmazok különbsége
#1. Bemenetként megadunk két növekvő módon rendezett tömböt, és a méreteiket.
#2. Létrehozunk egy b tömböt, mérete az első bemeneti tömb mérete.
#3. Létrehozunk két indexelőt, méretük 1.
#4. Létrehozunk egy darabszám változót, értéke 0.
#5. Előltesztelő ciklussal addig megyünk, míg a két indexelő nem nagyobb a két bemeneti tömb méreténél.
#       - Ha az a1[i] kisebb az a2[j]-nél, akkor
#               - Növeljük a darabszámot.
#               - Átmásoljuk az a1 aktuális elemét a b tömbbe.
#               - Növeljük az i indexelőt.
#       - Különben ha az a1[i] nagyobb az a2[j]-nél, akkor
#               - Növeljük az j indexelőt.
#       - Különben
#               - Növeljük mindkét indexelőt.
#6. Előltesztelő ciklussal addig megyünk, míg i kisebb egyenlő az első tömb méreténél.
#       - Növeljük a darabszámot.
#       - Átmásoljuk az a1 aktuális elemét a b tömbbe.
#       - Növeljük az i indexelőt.
#7. Kimenete a b tömb és mérete.
def HalmazokKulonbsege(a1, n1, a2, n2)
    b = Array.new(n1)
    i = 0
    j = 0
    db = 0
    while(i <= n1 && j <= n2)
        if(a1[i] < a2[j])
            db += 1
            b[db] = a1[i]
            i += 1
        elsif(a1[i] > a2[j])
            j += 1
        else
            i += 1
            j += 1
        end
    end
    while(i <= n1)
        db += 1
        b[db] = a1[i]
        i += 1
    end
    {b: b, db: db}
end

def _HalmazokKulonbsege
    a1 = [2, 3, 4, 5, 8]
    n1 = a1.length - 1

    a2 = [1, 3, 5, 7]
    n2 = a2.length - 1

    b = HalmazokKulonbsege(a1, n1, a2, n2).fetch(:b)
    db = HalmazokKulonbsege(a1, n1, a2, n2).fetch(:db)

    puts "\n\nHalmazok különbsége: "
    for i in (1..db)
        print "#{b[i]} "
    end
end

_HalmazokKulonbsege()

#Halmazok szimmetrikus különbsége
#1. Bemenetként megadunk két növekvő módon rendezett tömböt és a méreteiket.
#2. Létrehozunk egy b tömböt, mérete a két tömb méretének összege.
#3. Létrehozunk két indexelőt, értéke 1.
#4. Létrehozunk egy darabszám változót, értéke 0.
#5. Előltesztelő ciklussal addig megyünk, míg a két indexelő nem nagyobb a két bemeneti tömbnél
#       - Ha az a1[i] kisebb az a2[j]-nél, akkor
#               - Növeljük a darabszámot
#               - Átmásoljuk az a2 aktuális elemét a b tömbbe.
#               - Növeljük az i indexelőt.
#       - Különben ha az a1[i] nagyobb az a2[j]-nél, akkor
#               - Növeljük a darabszámot.
#               - Átmásoljuk az a1 aktuális elemét a b tömbbe.
#               - Növeljük az j indexelőt.
#       - Különben
#               - Növeljük mindkét indexelőt.
#6. Előltesztelő ciklussal addig megyünk, míg i kisebb egyenlő az első tömb méreténél.
#       - Növeljük a darabszámot.
#       - Átmásoljuk az a1 aktuális elemét a b tömbbe.
#       - Növeljük az i indexelőt.
#7. Előltesztelő ciklussal addig megyünk, míg j kisebb egyenlő a második tömb méreténél.
#       - Növeljük a darabszámot.
#       - Átmásoljuk az a2 aktuális elemét a b tömbbe.
#       - Növeljük az j indexelőt.
#8. Kimenete a b tömb és mérete.
def HalmazokSzimmetrikusKulonbsege(a1, n1, a2, n2)
    b = Array.new(n1 + n2)
    i = 0
    j = 0
    db = 0
    while(i <= n1 && j <= n2)
        if(a1[i] < a2[j])
            db += 1
            b[db] = a1[i]
            i += 1
        elsif(a1[i] > a2[j])
            db += 1
            b[db] = a2[j]
            j += 1
        else
            i += 1
            j += 1            
        end
    end
    while(i <= n1)
        db += 1
        b[db] = a1[i]
        i += 1
    end
    while(j <= n2)
        db += 1
        b[db] = a2[j]
        j += 1
    end
    {b: b, db: db}
end

def _HalmazokSzimmetrikusKulonbsege
    a1 = [2, 3, 4, 5, 8]
    n1 = a1.length - 1

    a2 = [1, 3, 5, 7]
    n2 = a2.length - 1

    b = HalmazokSzimmetrikusKulonbsege(a1, n1, a2, n2).fetch(:b)
    db = HalmazokSzimmetrikusKulonbsege(a1, n1, a2, n2).fetch(:db)

    puts "\n\nHalmazok szimmetrikus különbsége: "
    for i in (1..db)
        print "#{b[i]} "
    end
end

_HalmazokSzimmetrikusKulonbsege()