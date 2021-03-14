#Lineáris keresés rendezett tömbben
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt, méretét és egy keresett értéket.
#2. Létrehozunk egy i változót, értéke 1.
#3. Előltesztelő ciklussal addig megyünk, míg az i indexelő nem nagyobb a bemeneti tömbnél és az aktuális érték kevesebb, mint a keresett érték.
#       -Növeljük az i-t.
#4. Megvizsgáljuk, hogy az i indexelő érvényes-e.
#5. Ha igen, akkor a kimenete a keresett érték indexe, és választ ad arra, hogy megtalálta-e.
def LinearisKereses(x, n, k)
    i = 0
    while(i <= n && x[i] < k)
        i += 1
    end
    van = (i <= n)
    if(van)
        idx = i
        {van: van, idx: idx}
    else
        {van: false, idx: -1}
    end
end

def _LinearisKereses()
    x = [1, 5, 8, 9, 12]
    n = x.length - 1
    van = LinearisKereses(x, n, 9).fetch(:van)
    idx = LinearisKereses(x, n, 9).fetch(:idx)
    
    puts "Lineáris keresés: " 

    puts "van: #{van} ; idx: #{idx}"
end

_LinearisKereses();

#Logaritmikus keresés rendezett tömbben
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt, méretét és egy keresett értéket.
#2. Létrehozunk egy bal változót, ami az alsóhatár, kezdeti értéke 1.
#3. Létrehozunk egy jobb változót, ami a felsőhatár, kezdeti értéke n.
#4. Kiválasztjuk a tömb középső elemét.
#5. Előltesztelő ciklussal addig megyünk, míg a bal kisebb jobb-nál és a középső elem nem egyenlő a keresett értékkel.
#       - Ha az aktuális elem nagyobb a keresett értéknél, akkor biztos a tömb első felében van:
#               - A jobb megkapja a (center - 1) értéket.
#       - Ha az aktuális elem kisebb a keresett értéknél, akkor biztos a tömb második felében van:
#               - A bal megkapja a (center + 1) értékét.
#6. Új középső elemet választunk.
#7. Megvizsgáljuk, hogy az indexelő érvényes-e még, ha igen, akkor:
#8. Kimenetként választ kapunk arra, hogy megtalálta-e a keresett értéket és, hogy hol van.
def LogaritmikusKereses(x, n, k)
    bal = 0
    jobb = n
    center = (bal + jobb) / 2
    while(bal <= jobb && x[center] != k)
        if(x[center] > k)
            jobb = (center - 1);
        else
            bal = (center + 1);
        end
        center = (bal + jobb) / 2
    end
    van = (bal <= jobb)
    if(van)
        idx = center
        {van: van, idx: idx}
    else
        {van: false, idx: -1}
    end
end

def _LogaritmikusKereses()
    x = [2, 5, 7, 9, 12]
    n = x.length - 1
    van = LogaritmikusKereses(x, n, 7).fetch(:van)
    idx = LogaritmikusKereses(x, n, 7).fetch(:idx)

    puts "\nLogaritmikus keresés: "
    puts "van: #{van} ; idx: #{idx}"
end

_LogaritmikusKereses()

#Eldöntés rendezett tömbben
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt, tömb méretét és egy k keresett értéket.
#2. Létrehozunk egy bal változót, kezdeti értéke 1.
#3. Létrehozunk egy jobb változót, kezdeti értéke n.
#4. Kiválasztjuk a tömb középső elemét.
#5. Előltesztelő ciklussal addig megyünk, míg a bal kisebb egyenlő jobb-nál és az aktuális elem nem egyenlő a keresett értékkel.
#       - Ha az aktuális elem nagyobb a keresett értéknél, akkor biztos a tömb első felében van:
#               - A jobb értéke (center - 1).
#       - Ha az aktuális elem kisebb a keresett értéknél, akkor biztos a tömb második felében van:
#               - A bal értéke (center + 1).
#6. Új középső elemet választunk.
#7. Megvizsgáljuk, hogy a bal kisebb egyenlő, és ha igen, akkor
#8. Kimenete választ ad arra, hogy megtalálta-e a keresett értéket.
def Eldontes(x, n, k)
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
    van = (bal <= jobb)
    if(van)
        van
    else
        false
    end
end

def _Eldontes()
    x = [5, 7, 9, 10, 123, 566]
    n = x.length - 1
    van = Eldontes(x, n, 10)
    puts "\nEldöntés: "
    puts "van: #{van}"
end

_Eldontes()

#Kiválasztás rendezett tömbben
#1. Bemenetként megadunk egy tömböt, tömb méretét és egy k keresett értéket.
#2. Létrehozunk egy bal változót, kezdeti értéke 1.
#3. Létrehozunk egy jobb változót, kezdeti értéke n.
#4. Kiválasztjuk a tömb középső elemét.
#5. Előltesztelő ciklussal addig megyünk, míg a bal kisebb jobb-nál és az aktuális elem nem egyenlő a keresett értékkel.
#       - Ha az aktuális elem nagyobb a keresett értéknél, akkor biztos a tömb első felében van:
#               - A jobb értéke (center - 1)
#       - Ha az aktuális elem kisebb a keresett értéknél, akkor biztos a tömb második felében van:
#               - A bal értéke (center + 1)
#6. Új középső elemet választunk.
#7. Kimenete a megtalált elem indexe.
def Kivalasztas(x, n, k)
    bal = 0
    jobb = n
    center = (bal + jobb) / 2
    while(bal <= jobb && x[center] != k)
        if(x[center] > k)
            jobb = (center - 1)
        else
            bal = (center + 1)
        end
        center = (bal + jobb) / 2
    end
    idx = center
    idx
end

def _Kivalasztas()
    x = [4, 6, 7, 8, 12]
    n = x.length - 1
    idx = Kivalasztas(x, n, 8)
    puts "\nKiválasztás: "
    puts "idx: #{idx}"
end

_Kivalasztas()

#Kiválogatás rendezett tömbben
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt, tömb méretét és egy k keresett értéket.
#2. Létrehozunk egy bal változót, értéke 1.
#3. Létrehozunk egy jobb változót, értéke n.
#4. Kiválasztjuk a tömb középső elemét.
#5. Előltesztelő ciklussal addig megyünk, amíg a bal kisebb egyenlő jobb-nál és az aktuális elem nem egyenlő a keresett értékkel.
#       - Ha az aktuális elem nagyobb a keresett értéknél, akkor biztos a tömb első felében van.
#               - A jobb értéke (center - 1)
#       - Ha az aktuális elem kisebb a keresett értéknél, akkor biztos a tömb második felében van.
#               - A bal értéke (center + 1).
#6.Kiválasztjuk a tömb középső elemét.
#7. Megvizsgáljuk, hogy a bal kisebb egyenlő jobb-nál, ha igen, akkor:
#8. A bal értéke center
#9. Előltesztelő ciklussal addig megyünk, míg a bal nagyobb 1-nél és az x[bal - 1] értéke egyenlő a keresett értékkel.
#       - Csökkentjük a bal értékét.
#10. A jobb értéke center
#11. Előltesztelő ciklussal addig megyünk, míg a jobb kisebb n-nél és az x[jobb + 1] értéke egyenlő a keresett értékkel.
#       - Növeljük a jobb értékét.
#12.Kimenete választ ad arra, hogy megtalálta-e a keresett értéket és megadja a bal és a jobb értékét is.
#13 Más esetben hamissal tér vissza.
def Kivalogatas(x, n, k)               
    bal = 0
    jobb = n
    center = (bal + jobb) / 2
    while(bal <= jobb && x[center] != k)
        if(x[center] > k)
            jobb = (center - 1)
        else
            bal = (center + 1)
        end
        center = (bal + jobb) / 2
    end
    van = (bal <= jobb)
    if(van)
        bal = center
        while(bal > 1 && x[bal - 1] == k)
            bal -= 1
        end
        jobb = center
        while(jobb < n && x[jobb + 1] == k)
            jobb += 1
        end
        {van: van, bal: bal, jobb: jobb}
    else
        {van: false, bal: -1, jobb: -1}
    end
end

def _Kivalogatas()
    x = [5, 12, 34, 56]
    n = x.length - 1
    van = Kivalogatas(x, n, 34).fetch(:van)
    bal = Kivalogatas(x, n, 34).fetch(:bal)
    jobb = Kivalogatas(x, n, 34).fetch(:jobb)

    puts "\nKiválogatás: "
    puts "van: #{van} ; bal: #{bal} ; jobb: #{jobb}"
end

_Kivalogatas()

#Megszámlálás rendezett tömbben
#1. Bemenetként megadunk egy növekvő módon rendezett tömböt, tömb méretét és egy k keresett értéket.
#2. Létrehozunk egy bal változót, kezdeti értéke 1.
#3. Létrehozunk egy jobb változót, kezdeti értéke n.
#4. Kiválasztjuk a tömb középső elemét.
#5. Előltesztelő ciklussal addig megyünk, míg bal kisebb egyenlő jobb-nál és az aktuális elem nem egyenlő a keresett értékkel.
#       - Ha az aktuális elem nagyobb a keresett értéknél, akkor biztos a tömb első felében van.
#               - A jobb értéke (center - 1)
#       - Ha az aktuális elem kisebb a keresett értéknél, akkor biztos a tömb második felében van.
#               - A bal értéke (center + 1)
#6. Újra kiválasztjuk a tömb középső elemét.
#7. Megvizsgáljuk, hogy a bal kisebb egyenlő a jobb-nál, ha igen, akkor
#8. A bal értéke center
#9. Előltesztelő ciklussal addig megyünk, míg a bal nagyobb 1-nél és az x[bal - 1] egyenlő a keresett értékkel.
#       - Csökkentjük a bal értékét.
#10. A jobb értéke center
#11. Előltesztelő ciklussal addig megyünk, míg a jobb kisebb n-nél és az x[jobb + 1] egyenlő a keresett értékkel.
#       - Növeljük a jobb értékét.
#12. A darabszáma: jobb - bal + 1
#13. Kimenete a keresett érték darabszáma
def Megszamlalas(x, n, k)
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
    db = 0
    van = (bal <= jobb)
    if(van)
        bal = center
        while(bal > 1 && x[bal - 1] == k)
            bal -= 1
        end

        jobb = center
        while(jobb < n && x[jobb + 1] == k)
            jobb += 1
        end
        db = jobb - bal + 1
    else
        db = 0
    end
    db
end

def _Megszamlalas()
    x = [34, 124, 555, 555, 666769]
    n = x.length - 1
    db = Megszamlalas(x, n, 555)
    puts "\nMegszámlálás: "
    puts "db: #{db}"
end

_Megszamlalas()