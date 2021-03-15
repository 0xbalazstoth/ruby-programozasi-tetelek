#Oszd meg és uralkodj
#1. A megoldandó problémát felosztjuk kisebb részfeladatokra.
#2. Az egyes részfeladatokat rekurzív módon megoldjuk vagyis uralkodnak a részproblémákon.
#3. A részfeladatok megoldásait egyesítjük.

#Felező maximumkiválasztás: 
#1. Bemenetként megadunk egy tömböt, bal és jobb indexelőt.
#2. Ha a bal egyenlő jobb-al, akkor
#       - Kimenete bal
#3. Különben
#       - Kiválasztjuk a tömb középső elemét.
#       - Létrehozunk egy balmax változót, értéke: Meghívja önmagát, paraméterei: x, bal, center
#       - Létrehozunk egy jobbmax változót, értéke: Meghívja önmagát, paraméterei: x, center + 1, jobb
#4. Ha az x[balmax] nagyobb egyenlő x[jobbmax] elemnél, akkor
#       - Kimenete a balmax
#5. Különben
#       - Kimenete a jobbmax
def FelezoMax(x, bal, jobb)
    if(bal >= jobb)
        bal
    else
        center = (bal + jobb) / 2
        balmax = FelezoMax(x, bal, center)
        jobbmax = FelezoMax(x, center + 1, jobb)
        if(x[balmax] >= x[jobbmax])
            balmax
        else
            jobbmax
        end
    end
end

def _FelezoMax()
    x = [2, 1, 6, 5, 8, 30]
    bal = 0
    jobb = x.length - 1
    idx = FelezoMax(x, bal, jobb)
    puts "Felező maximumkiválasztás rekurzívan: "
    puts idx
end

_FelezoMax()

#Összefésülés:
#1. Bemenetként megadunk címszerint egy tömböt, bal, center és jobb indexelőt.
#2. Lényegében ugyanaz, mint az összefuttatás, a tömb két résztömbjét akarjuk ugyanazon a helyen összefuttatni.
#3. Kiírjuk ideiglenesen őket két átmeneti tömbbe.
#4. Az y1 tömbbe kerül a bal és center indexek közötti résztömb.
#5. Az y2 tömbbe kerül a center + 1 és jobb indexek közötti résztömb.
#6. Ezután, két résztömböt kell az x tömb bal és jobb indexű elemei közötti helyre összefésülni.
#7. Kimenete az összefésült tömb.
def Osszefesules(x, bal, center, jobb)
    n1 = center - bal + 1
    n2 = jobb - center
    y1 = Array.new(n1 + 1)
    for i in (0..n1)
      y1[i] = x[bal + i]
    end
    y2 = Array.new(n2 + 1)
    for j in (0..n2)
      y2[j] = x[center + j + 1];
    end
    y1[n1] = 999999
    y2[n2] = 999999
    i = 0
    j = 0
    for k in (bal..jobb)
      if(y1[i] <= y2[j])
          x[k] = y1[i]
          i += 1
      else
        x[k] = y2[j]
        j += 1
      end
    end
end

#1. Bemenetként megadunk egy tömböt, bal és jobb indexelőt.
#2. Az n elemű tömböt felosztjuk két résztömbre.
#3. A résztömböket rekurzív módon rendezzük, azaz:
#       - Tovább osztjuk fele olyan hosszú résztömbökre.
#       - Az 1 elemű résztömb már önmagában rendezett.
#4. A rendezett résztömböket összefuttatjuk megtartva a rendezettséget.
#5. Kimenete a rendezett tömb.
def OsszefesuloRendezes(x, bal, jobb)
    if(bal < jobb)
        center = (bal + jobb) / 2
        OsszefesuloRendezes(x, bal, center)
        OsszefesuloRendezes(x, center + 1, jobb)
        Osszefesules(x, bal, center, jobb)
    end
end

def _OsszefesuloRendezes()
    x = [9, 3, 7, 5, 6, 4, 8, 2]
    bal = 0
    jobb = x.length - 1
    OsszefesuloRendezes(x, bal, jobb)

    puts "\nÖsszefésülő rendezés: "
    print "#{x} "
end

_OsszefesuloRendezes()

#Gyorsrendezés szétválogatása:
#1. Bemenetként megadunk egy tömböt, bal és jobb indexelőt.
#2. Válogassuk szét úgy a rendezendő x tömb elemeit, hogy az első elemnél, kisebb értékű elemek az első elem elé, a nagyobbak pedig mögé kerüljenek.
#3. A támpont elem, biztos hogy a végleges helyére került a széválogatás végére.
#4. Végezzük el ezt a szétválogatást a támpont elemnél kisebbekre, majd a nagyobbakra külön-külön.
#5. Kimenete a rendezett tömb.
def Szetvalogat(x, bal, jobb)
    seged = x[bal]
    while(bal < jobb)
        while(bal < jobb && x[jobb] > seged)
            jobb -= 1
        end
        if(bal < jobb)
            x[bal] = x[jobb]
            bal += 1
            while(bal < jobb && x[bal] <= seged)
                bal += 1
            end
            if(bal < jobb)
                x[jobb] = x[bal]
                jobb -= 1
            end
        end
    end
    idx = bal
    x[idx] = seged
    idx
end

#1. Bemenetként megadunk egy tömböt, bal és jobb indexelőt.
#2. Meghívjuk a Szétválogatást, a megfelelő paraméterekkel.
#3. Ha az adott index nagyobb a bal + 1-nél, akkor
#       - Meghívja önmagát: paraméterei: x, bal, idx - 1
#4. Ha az adott index kisebb jobb - 1-nél, akkor
#       - Meghívja önmagát, paraméterei: x, idx + 1, jobb
#5. Kimenete a rendezett tömb.
def Gyorsrendezes(x, bal, jobb)
    idx = Szetvalogat(x, bal, jobb)
    if(idx > bal + 1)
        Gyorsrendezes(x, bal, idx - 1)
    end
    if (idx < jobb)
        Gyorsrendezes(x, idx + 1, jobb)
    end
end

def _Gyorsrendezes()
    x = [3, 2, 1, 4, 8, 6, 12, 10, 7, 9, 5, 14, 13, 11]
    bal = 0
    jobb = x.length - 1
    Gyorsrendezes(x, bal, jobb)
    puts "\nGyorsrendezés: "
    print "#{x} "
end

_Gyorsrendezes()

#K-adik legkisebb elem kiválasztása:
#1. Bemenetként megadunk egy tömböt, bal és jobb indexelőt és egy k-adik legkisebb elemet.
#2. Ha a bal egyenlő a jobb változóval, akkor
#       - Kimenete a tömb aktuális eleme. (x[bal])
#3. Különben
#       - Létrehozunk egy index változót, amiben meghívjuk a Szétválogatást a megfelelő paraméterekkel: x, bal, jobb
#       - Ha a k egyenlő az (index - bal + 1)-el, akkor
#               - Kimenete x[idx]
#       - Különben ha a k kisebb (index - bal + 1)-nél, akkor
#               - Meghívja önmagát, paraméterei: x, bal, index - 1, k
#       - Különben
#               - Meghívja önmagát, paraméterei: x, index + 1, jobb, k - (index - bal + 1)
def KAdikLegkisebbElemKivalasztasa(x, bal, jobb, k)
    if(bal == jobb)
        x[bal]
    else
        index = Szetvalogat(x,bal, jobb)
        if(k == (index - bal + 1))
            KAdikLegkisebbElemKivalasztasa(x, bal, index - 1, k)
        else
            KAdikLegkisebbElemKivalasztasa(x, index + 1, jobb, k - (index - bal + 1))
        end
    end
end

def _KAdikLegkisebbElemKivalasztasa()
    x = [3, 2, 1, 4, 8, 6, 12, 10, 7, 9, 5, 14, 13, 11]
    bal = 0
    jobb = x.length - 1
    k = 5
    kmin = KAdikLegkisebbElemKivalasztasa(x, bal, jobb, k)

    puts "\n\nK-adik legkisebb elem kiválasztása: "
    puts kmin
end

_KAdikLegkisebbElemKivalasztasa()