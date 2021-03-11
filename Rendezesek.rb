#Egyszerű cserés rendezés
#1. Bemenetként címszerint megadunk egy tömböt és a tömb méretét.
#2. Párhuzamosan bejárjuk a bemeneti tömböt.
#3. Megvizsgáljuk, hogy melyik szomszéd elem a legkisebb, és aszerint cserélünk.
#4. Kimenete a rendezett tömb.
def CseresRendezes(x, n)
    for i in (0..n - 1)
        for j in (i + 1..n)
            if(x[i] > x[j])
                csere = x[i]
                x[i] = x[j]
                x[j] = csere
            end
        end
    end
end

def _CseresRendezes()
    x = [5, 1, 2, 7, 9, -12]
    n = x.length - 1

    CseresRendezes(x, n)

    puts "\nCserés rendezés: "
    print x
end

_CseresRendezes()

#Minimumkiválasztásos rendezés
#1. Bemenetként címszerint megadunk egy tömböt és a tömb méretét.
#2. Párhuzamosan bejárjuk a tömböt.
#3. Első előltesztelő ciklussal elmegyünk (n-1)-ig.
#       - Létrehozunk egy min változót, értéke i.
#       - Belső előltesztelő ciklussal (i + 1)-től elmegyünk n-ig.
#               - Ha a kiválasztott legkisebb elem nagyobb az aktuális elemnál, akkor új legkisebb elemet választunk.
#4. Belső ciklus kiugrása után cserélünk.
#5. Kimenete a rendezett tömb.
def MinimumkivalasztasosRendezes(x, n)
    for i in (0..n - 1)
        min = i
        for j in (i + 1..n)
            if(x[min] > x[j])
                min = j
            end
        end
        csere = x[i]
        x[i] = x[min]
        x[min] = csere
    end
end

def _MinimumkivalasztasosRendezes()
    x = [4, 3, 8, 6, 1]
    n = x.length - 1

    MinimumkivalasztasosRendezes(x, n)

    puts "\n\nMinimumkiválasztásos rendezés: "
    print x
end

_MinimumkivalasztasosRendezes()

#Buborékrendezés
#1. Bemenetként címszerint megadunk egy tömböt és a tömb méretét.
#2. A szomszédos elemeket haszonlítjuk össze egymássa, majd cserélgetünk.
#3. Párhuzamosan bejárjuk a bemeneti tömböt.
#4. Első bejárásnál a tömb elejétől a végéig minden szomszédos elemmel foglalkozik:
#       - (n - 1)-edik és az n-edik elemet vizsgáljuk.
#       - A legnagyobb elem a tömb végére kerül. (Felszáll, mint egy buborék).
#5. Második bejárásnál, már csak a (n - 1)-edik eleméig kell a szomszédos elemekkel foglalkozni.
#       - (n - 2)-edik és az (n - 1)-edik elemet vizsgáljuk.
#       - (n - 1)-edik legnagyobb elem már biztosan a helyére került.
#       - Cserélgetünk.
#6. A bejárás hossza minden eggyel csökken.
#7. Végül már csak a második elemig kell vizsgálódni.
#8. Kimenete a rendezett tömb.
def Buborekrendezes(x, n)
    for i in (n).downto(1)
        for j in (0..i - 1)
            if(x[j] > x[j + 1])
                csere = x[j]
                x[j] = x[j + 1]
                x[j + 1] = csere
            end
        end
    end
end

def _Buborekrendezes()
    x = [5, 3, -21, 4323, 1]
    n = x.length - 1
    Buborekrendezes(x, n)
    puts "\n\nBuborékrendezés: "
    print x
end

_Buborekrendezes()

#Javított buborékrendezés: Képes felismerni, hogy a bemeneti tömb rendezett-e.
#1. Bemenetként címszerint megadunk egy tömböt és a méretét.
#2. Létrehozunk egy i változót, értéke n.
#3. Előltesztelő ciklussal addig megyünk, míg i nagyobb egyenlő 2-nél.
#       - Létrehozunk egy indexelőt, ami megmondja, hogy hol volt az utolsó csere.
#       - Belső számláló ciklussal elmegyünk (i - 1)-ig
#               - Megvizsgáljuk a szomszédokat.
#               - Cserélünk ha kell, és az indexét eltároljuk az index változóban.
#4. Belső ciklus kiugrása után átadjuk az i változónak a korábban cserélt elem indexét.
#5. Kimenete a rendezett tömb.
def JavitottBuborekrendezes(x, n)
    i = n
    while(i >= 1)
        index = 0
        for j in (0..i - 1)
            if(x[j] > x[j + 1])
                csere = x[j]
                x[j] = x[j + 1]
                x[j + 1] = csere
                index = j
            end
        end
        i = index
    end
end

def _JavitottBuborekrendezes()
    x = [5, 6, 12, -12, 4]
    n = x.length - 1
    JavitottBuborekrendezes(x, n)
    puts "\n\nJavított buborékrendezés: "
    print x
end

_JavitottBuborekrendezes()

#Beillesztéses rendezés
#1. Bemenetként megadunk címszerint egy tömböt és a tömb méretét.
#2. Egy elemű tömb már rendezett.
#3. A két elemű tömbnél akkor kell rendezni, ha
#       - Az első elem nagyobb a második elemnél.
#3. Az n-edik elemet is a helyére kell illeszteni, miközben az (n - 1)-edik darab elem már rendezett.
#4. Addig folytatja az eljárást, míg a beillesztendő elem a helyére nem kerül.
#5. Kimenete a rendezett tömb.
def Beillesztesesrendezes(x, n)
    for i in (1..n)
        j = i - 1
        while(j >= 0 && x[j] > x[j + 1])
            csere = x[j]
            x[j] = x[j + 1]
            x[j + 1] = csere
            j -= 1
        end
    end
end

def _Beillesztesesrendezes()
    x = [54, 23, -12, 1, 6]
    n = x.length - 1
    Beillesztesesrendezes(x, n)
    puts "\n\nBeillesztéses rendezés: "
    print x
end

_Beillesztesesrendezes()

#Javított beillesztéses rendezés
#1. Bemenetként megadunk egy tömböt, tömb méretét.
#2. Számláló ciklussal bejárjuk a tömböt 2-től n-ig.
#       - Létrehozunk egy j változót, kezdeti értéke (i - 1)
#       - Létrehozunk egy segéd változót, aminek az értéke az aktuális elem.
#               - Belső előltesztelő ciklussal megvizsgálja, hogy mennyit kell még hátra tolni.
#                       - Hátrébb toljuk az aktuális elemet.
#3. Belső ciklus kiugrása után, a szomszéd felveszi a segéd változó értékét.
#4. Kimenete a rendezett tömb.
def JavitottBeillesztesesrendezes(x, n)
    for i in (0..n)
        j = i - 1
        seged = x[i]
        while(j >= 0 && x[j] > seged)
            x[j + 1] = x[j]
            j -= 1
        end
        x[j + 1] = seged
    end
end

def _JavitottBeillesztesesrendezes()
    x = [4, 2, 7, 10]
    n = x.length - 1
    JavitottBeillesztesesrendezes(x, n)
    puts "\n\nJavított beillesztéses rendezés: "
    print x
end

_JavitottBeillesztesesrendezes()