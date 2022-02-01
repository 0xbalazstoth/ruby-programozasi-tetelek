#Dinamikus programozás:
#Általában olyan feladatoknál alkalmazzuk, amelyek első ránézésre rengeteg időt vesznek igénybe.
#
#Részei:
#1. Átfedő részfeladatokat old meg.
#2. Az egyes részfeladatokat csak egyszer oldja meg.
#3. Az optimális megoldás optimális részmegoldások kombinációja.
#4. Lentről-felfelé építkezik.
#5. A problémára adott megoldás optimális.

#A megoldás menete:
#1. Rekurzíós összefüggés felírása.
#2. Tömbre átírás (a változók diszkrétek, korlátozottak).
#3. A tömbben a kitöltési irány meghatározása.
#4. A teljes megoldás helyének megadása.

#0-1 hátizsák probléma
#1. Bemenetként megadunk két tömböt, az egyik tömb a kincsek értékét tartalmazza, a másik a kincsek súlyát tartalmazza,
#még megadjuk a tömb méretét és a hátizsák kapacitását.
#2. Létrehozunk egy táblát, aminek a mérete (n + 1) sora, és (c + 1) oszlopa van.
#3. Feltöltjük 0 értékekkel az F tábla nulladik sorát és oszlopát.
#4. Két egymásba ágyazott ciklussal meghatározzuk az F tábla egyes elemeinek értékét.
#5. Kimenete az F tábla, aminek a meghatározott értékek vannak.
def Hatizsak(p, w, n, c)
    _F = Array.new(n + 1){Array.new(c + 1)}
    for i in (0..n)
        for x in (0..c)
            if(i == 0 || x == 0)
                _F[i][x] = 0
            elsif(w[i - 1] <= x)
                _F[i][x] = [p[i - 1] + _F[i - 1][x - w[i - 1]], _F[i - 1][x]].max
            else
                _F[i][x] = _F[i - 1][x]
            end
        end
    end
    {_F: _F, max: _F[n][c]}
end

def _Hatizsak
    w = [10, 20, 30]
    p = [60, 100, 120]
    c = 50
    n = w.length

    _F = Hatizsak(p, w, n, c).fetch(:_F)
    max = Hatizsak(p, w, n, c).fetch(:max)

    puts "\n0-1 hátizsák probléma dinamikus programozással: "

    puts "Kitöltött táblázat: "
    _F.each do |sor|
        sor.each do |oszlop|
            print "#{oszlop} "
        end
        puts
    end

    puts "max: #{max}"
end

_Hatizsak()

#Kiolvasas
def Kiolvasas(_F, n, c, w)
    s = []
    i = n - 1
    x = c
    while(i > 0 && x > 0)
        if(_F[i][x] != _F[i - 1][x])
            s << i
            x -= w[i]
        end
        i -= 1
    end
    s
end

def _Kiolvasas
    w = [10, 20, 30]
    p = [60, 100, 120]
    c = 50
    n = p.length

    _F = Hatizsak(p, w, n, c).fetch(:_F)

    puts "\nKiválasztott elemek kiolvasása: "

    s = Kiolvasas(_F, n, c, w)
    print "Nem rendezett: #{s} | Rendezett: #{s.sort}"
end

_Kiolvasas()

#Leghosszabb közös részsorozat meghatározása (hossza, majd előállítás)
#Stratégia:
#1.	Először az LKR hosszát határozzuk meg.
#2.	Ezután mondjuk meg az LKR elemeit.

#Leghosszabb közös részsorozat hossza:
#1. Bemenetként megadunk két tömböt, ami tartalmazza a sorozatokat és a tömbök méretét.
#2. Létrehozunk egy F táblát, aminek (n + 1) sora és (m + 1) oszlopa van.
#3. Feltöltjük az F tábla nulladik sorát és oszlopát null elemekkel.
#4. Két egybe ágyazott számláló ciklussal megvizsgáljuk a két tömböt. 
#       - Ha x és az y tömb aktuális eleme egyezik, akkor egy hosszú a részsorozat.
#       - Ha nem egyeznek meg, akkor a legnagyobb elemet kiválasztjuk.
#5. Kimenete az F tábla és hossza.
def LKRHossza(x, n, y, m)
    _F = Array.new(n + 1){Array.new(m + 1)}
    for i in (0..n)
        for j in (0..m)
            if(i == 0 || j == 0)
                _F[i][j] = 0
            elsif(x[i - 1] == y[j - 1])
                _F[i][j] = _F[i - 1][j - 1] + 1;
            else
                _F[i][j] = [_F[i - 1][j], _F[i][j - 1]].max
            end
        end
    end
    {_F: _F, hossz: _F[n][m]}
end

def _LKRHossza
    x = [ 'C', 'A', 'L', 'E', 'N', 'D', 'A', 'R' ]
    y = [ 'C', 'A', 'L', 'L', 'C', 'E', 'N', 'T', 'E', 'R' ]
    n = x.length
    m = y.length

    _F = LKRHossza(x, n, y, m).fetch(:_F);
    hossza = LKRHossza(x, n, y, m).fetch(:hossz);

    puts "\n\nLeghosszabb közös részsorozat hossza és táblázata: "
    print x
    print "\n#{y}\n"
    _F.each do |sor|
        sor.each do |oszlop|
            print "#{oszlop} "
        end
        puts
    end

    puts "Hossza: #{hossza}"
end

_LKRHossza()

#Leghosszabb közös részsorozat előállítása:
#1. Bemenetként megadunk egy F táblát, két sorozatatot tartalmazó tömböt és a méreteiket.
#2. Létrehozunk egy S tömböt, aminek az F tábla a mérete, tehát F[n, m]
#3. Létrehozunk egy i változót, aminek értéke n.
#4. Létrehozunk egy j változót, aminek értéke m.
#5. Létrehozunk egy index változót, aminek értéke az F tábla utolsó eleme.
#6. Előltesztelő ciklussal addig megyünk, míg el nem fogy a tömb.
#       - Ha a két elem megegyezik (x[i] == y[j]), akkor feltöltjük az aktuális elemet a tömbbe.
#               - Csökkentjük az indexelőt, i-t és a j-t.
#       - Különben ha az F[i - 1, j] nagyobb az F[i, j - 1]-nél, akkor
#               - Csökkentjük az i értékét.
#       - Különben
#               - Csökkentjük a j-t.
#7. Kimenete az előállított S tömb.
def LKREloallitasa(_F, x, n, y, m)
    index = _F[n][m]
    s = Array.new(index + 1)
    k = n
    l = m
    while(k > 0 && l > 0)
        if (x[k - 1] == y[l - 1])
            s[index - 1] = x[k - 1]
            k -= 1
            l -= 1
            index -= 1
        elsif(_F[k - 1][l] > _F[k][l - 1])
            k -= 1
        else
            l -= 1
        end
    end
    s
end

def _LKREloallitasa
    x = [ 'C', 'A', 'L', 'E', 'N', 'D', 'A', 'R' ]
    y = [ 'C', 'A', 'L', 'L', 'C', 'E', 'N', 'T', 'E', 'R' ]
    n = x.length
    m = y.length

    _F = LKRHossza(x, n, y, m).fetch(:_F);
    hossza = LKRHossza(x, n, y, m).fetch(:hossz);
    s = LKREloallitasa(_F, x, n, y, m)

    puts "\nLeghosszabb közös részsorozat előállítása: "
    
    for i in (0..hossza)
        print "#{s[i]} "
    end
end

_LKREloallitasa()

#Kincsek begyűjtése dinamikus programozással:
#1. Bemenetként megadunk egy táblát, amiben a kincsek értékei vannak, sorok és oszlopok számát.
#2. Létrehozunk egy F táblát, aminek m sora és n oszlopa van.
#3. Elindulunk a bal alsó sarokból.
#4. Minden mezőre kiszámítjuk, hogy maximálisan mennyi kincset szedhetnénk fel az adott mezőre érkezve, ha addig a legjobb döntéseket hoztuk volna meg.
#5. Tároljuk el az útvonal pozícióit.
#6. Kimenete az F tábla lesz, amiben a koordináták lesznek.
def KincsGyujtes(_C, m, n)
    _P = Array.new(m) { Array.new(n, 0) }
    _P[0, 0] = _C[0, 0]
    i = 0
    j = 0

    (1...n).each do |j|
      _P[0][j] = _P.dig(0, j - 1) + _C.dig(i, j)
    end

    (1...m).each do |i|
      _P[i][0] = _P.dig(i - 1, 0) + _C.dig(i, j)
    end

    (1...m).each do |i|
      (1...n).each do |j|
        _P[i][j] = [_P.dig(i - 1, j), _P.dig(i, j - 1)].max + _C.dig(i, j)
      end
    end
    _P
end

def _KincsGyujtes
    _C = [[ 1, 8, 3, 5, 6], [ 4, 2, 1, 2, 4], [ 3, 4, 1, 4, 3], [ 6, 0, 5, 4, 6], [ 9, 1, 8, 1, 1]] #[[1, 3, 4, 8], [6, 10, 20, 9], [11, 2, 15, 1], [1, 5, 3, 6 ]]
    m = 5
    n = 5
    _P = KincsGyujtes(_C, m, n)

    puts "\n\nKincsek begyűjtése dinamikus programozással: "

    _P.reverse_each do |sor|
        sor.each do |oszlop|
            print "#{oszlop + 1} "
        end
        puts
    end
end

_KincsGyujtes()

#1. Bemenetként megadunk egy F táblát, amiben a kkordináták vannak, majd megadjuk a sorok és oszlopok számát.
#2. Előltesztelő ciklussal a tömbök végétől az elejéig megyünk.
#3. Elindulunk a jobb felső sarokból.
#4. Megvizsgáljuk, hogy a bal vagy az alsó mező értéke a nagyobb, és arra megyünk tovább.
#5. Amikor minden csúcsnál ismerjük a kincsösszeget, akkor alulról felfele határozzuk meg az optimális megoldást.
#6. Kimenete a bejárt út.
def BejarasiUtKiolvasasa(_F, m, n)
    _P = Array.new(m + n - 1)
    i = m
    j = n
    k = m + n - 1
    while(i > 0 && j > 0)
        _P[k + 1] = [i, j]
        k -= 1
        if(_F[i - 1][j] > _F[i][j - 1])
            i -= 1
        else
            j -= 1
        end
    end

    while(i > 0)
        _P[k + 1] = [i, j]
        k -= 1
        i -= 1
    end

    while(j > 0)
        _P[k + 1] = [i, j]
        k -= 1
        j -= 1
    end

    _P[0] = [0, 0]
    {_P: _P, osszegyujtott: _P[n + m]}
end

def _BejarasiUtKiolvasasa
    _C = [[ 1, 8, 3, 5, 6], [ 4, 2, 1, 2, 4], [ 3, 4, 1, 4, 3], [ 6, 0, 5, 4, 6], [ 9, 1, 8, 1, 1]] #[[1, 3, 4, 8], [6, 10, 20, 9], [11, 2, 15, 1], [1, 5, 3, 6 ]]
    m = 5
    n = 5
    _F = KincsGyujtes(_C, m, n)

    _P = BejarasiUtKiolvasasa(_F, m - 1, n - 1).fetch(:_P)
    osszegyujtott = BejarasiUtKiolvasasa(_F, m - 1, n - 1).fetch(:osszegyujtott)
   
    puts "\nBejárási út kiolvasása: "
    _P.each do |sor|
        puts "#{sor[0] + 1} #{sor[1] + 1} => #{_F[sor[0]][sor[1]] + 1}"
    end

    puts "Összegyűjtött kincsek összege: #{_F[osszegyujtott[0]][osszegyujtott[1]] + 1}"
end

_BejarasiUtKiolvasasa()