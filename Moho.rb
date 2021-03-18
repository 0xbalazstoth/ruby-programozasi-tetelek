require "matrix"

#Mohó stratégia: Kiválasztjuk azt, ami pillanatnyilag a legkedvezőbbnek tűnik. Olyan feladatoknál merülhet fel az alkalmazása, ahol
#több döntést kell hozni egymás után, és a döntés jóságát is meg kell fogalmazni, vagyis minimum vagy maximum feltételt fogalmazunk meg.
#Fentről-lefelé építkezik (top-down stratégia). Nem minden esetben ad optimális megoldást.

#Stratégia elemei:
#1. Választások sorozatával építjük fel a megoldást.
#2. Megmutatjuk, hogy mindig van olyan megoldása az eredeti feladatnak, amely a mohó választással kezdődik.
#3. Az optimális megoldáshoz hozzávéve a mohó választást, az eredeti probléma megoldását kapjuk.
#4. Ha a bizonyítás nem megy, akkor keresünk ellenpéldát, ami megmutatja, hogy nem vezet optimális eredményhez.

#0-1 hátizsák probléma mohó algoritmussal:
#1. Bemenetként megadunk két tömböt, az egyik tömb a kincsek értékét tartalmazza, a másik a kincsek súlyát tartalmazza,
#még megadjuk a tömb méretét és a hátizsák kapacitását.
#2. Létrehozunk egy üres halmazt, amiben majd a helyezendő tárgyak indexét fogjuk tárolni.
#3. Létrehozunk egy i változót, ami kezdetben 1.
#4. Előltesztelő ciklussal addig megyünk, míg van szabad hely és amíg van vizsgálandó elem.
#5.     - Ha az aktuális súly kisebb a hátizsák kapacitásánál, akkor
#               - Belepakoljuk az aktuális indexet a halmazba.
#               - Csökkentjük a szabad kapacitást.
#6. Ciklus kilépése után növeljük az i-t eggyel.
#7. Kimenete a halmaz, amiben a tárgyak indexei vannak.
def Hatizsak(p, w, n, c)
    # nem_rendezett = lambda {|i| p[i] / w[i] }
    # rendezett = (0...n).to_a.sort_by(&nem_rendezett).reverse
    s, ertek, suly = [], 0, 0

    i = 0

    # for i in rendezett
    #     if(suly + w[i] <= c)
    #         s += [i]
    #         suly += w[i]
    #         ertek += p[i]
    #     end
    # end

    while c > 0 && i < n
      if w[i] <= c
        s << i
        c = c - w[i]
        ertek += p[i]
        suly += w[i]
      end
      i += 1
    end
    {s: s, ertek: ertek, suly: suly} 
end

def _Hatizsak()
    w = [10, 20, 30]
    p = [60, 100, 120]
    c = 50
    n = w.length

  puts "0-1 hátizsák probléma mohó algoritmussal: "

    s = Hatizsak(p, w, n, c).fetch(:s)
    ertek = Hatizsak(p, w, n, c).fetch(:ertek)
    suly = Hatizsak(p, w, n, c).fetch(:suly)

    puts "s: #{s}; összesen #{ertek} értéket viszünk el. össz súly: #{suly}"
end

_Hatizsak()

#Pénzkifizetés
#1. Bemenetként megadunk egy kifizetendő összeget, címletek tömböt és a tömb méretét.
#2. Létrehozunk egy db tömböt, mérete n.
#3. Számláló ciklussalbejárjuk a bemeneti tömböt és feltöltjük 0 értékekkel.
#4. Létrehozunk egy j változót, értéke n.
#5. Előltesztelő ciklussal addig megyünk, míg a kifizetendő összeg pozitív.
#       - Belső előltesztelő ciklussal pedig megkeressük a legnagyobb címletet.
#               - Majd a j indexet csökkentjük, míg a címlet nagyobb a kifizetendő összegnél.
#6. Növeljük a darabszámot a db tömbben.
#7. Csükkentjük a még kifizetendő összeget a címlet értékével.
#8. Kimenete a db tömb.
def Penzkifizetes(x, c, n)
    db = Array.new(n)
    for i in (0..n)
      db[i] = 0
    end
    j = n
    while(x > 0)
      while(c[j] > x)
        j -= 1 
      end
      db[j] = db[j] + 1
      x = x - c[j]
    end
    db
end

def _Penzkifizetes()
  x = 79485
  c = [5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000]
  n = c.length - 1
  db = Penzkifizetes(x, c, n)

  puts "\nPénzkifizetés probléma mohó algoritmussal: "

  for i in db.length.times
    puts "#{db[i]}db = #{c[i]}"
  end
end

_Penzkifizetes()

#Kincsek begyűjtése mohó algoritmussal:
#1. Bemenetként megadunk egy táblát, és a sorok, oszlopok számát.
#2. Létrehozunk egy P tömbt, mérete m + n - 1
#3. Elindulunk a bal alsó sarokból.
#4. Megvizsgáljuk, hogy a jobb vagy a felső nagyobb-e, és arra megyünk tovább.
#       - Ha elértük a felső sort vagy a jobb szélső sor szélét, már csak egyetlen irányba lehet menni.
#5. Tároljuk el az útvonal pozícióit.
#6. Megmutatjuk a teljes megoldás útvonalát és a begyűjtött kincsek összegét.
def KincsGyujtes(_C, m, n)
  _P = Array.new(m + n - 1)
  i = 0
  j = 0
  k = -1
  while(i < m - 1 && j < n - 1)
    k = k + 1
    _P[k] = [i, j]
    if(_C[i + 1][j] > _C[i][j + 1])
      i += 1
    else
      j += 1
    end
  end
  
  while(i < m - 1)
    k += 1
    _P[k] = [i, j]
    i +=  1
  end

  while(j < n - 1)
    k += 1
    _P[k] = [i, j]
    j +=  1
  end
  k += 1
  _P[k] = [i, j]
  _P
end

def _KincsGyujtes()
  _C = [[1, 3, 4, 8], [6, 10, 20, 9], [11, 2, 15, 1], [1, 5, 3, 6 ]]
  m = 4
  n = 4
  _P = KincsGyujtes(_C, m, n)
  osszegyujtott = 0

  puts "\nKincsek begyűjtése mohó algoritmussal: "

  puts "Bemeneti táblázat: "
  _C.reverse_each do |sor|
    sor.each do |oszlop|
      print "#{oszlop} "
    end
    puts
  end

  puts 

  _P.each do |sor|
      if(sor[0] > sor[1])
        csere = sor[0]
        sor[0] = sor[1]
        sor[1] = csere
      end

      if(sor[1] > sor[0])
        csere = sor[1]
        sor[1] = sor[0]
        sor[0] = csere
      end

      osszegyujtott += _C[sor[0]][sor[1]]

      puts "#{sor[0]} #{sor[1]} => #{_C[sor[0]][sor[1]]}"
  end
  puts "Összegyűjtött kincsek összege: #{osszegyujtott}"
end

_KincsGyujtes()