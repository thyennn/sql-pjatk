-- Nr. indeksu s26524

--================================================ cz.1

-- 1 Wybierz numery departamentów, nazwiska pracowników oraz numery pracownicze
-- ich szefów z tabeli EMP.

select ename, nvl(deptno, 0), nvl(mgr, 0)
from emp;

-- 2 Wypisz wszystkie dane z wszystkich kolumn tabeli EMP

select *
from emp;

-- 3 Wylicz wartość rocznej pensji podstawowej (12 płac miesięcznych) dla każdego
-- pracownika, bez uwzględniania prowizji. Wypisz nazwisko pracownika.

select ename, sal * 12 "Roczna pensja"
from emp;

-- 4 Oblicz, ile będą wynosiły roczne dochody każdego pracownika, bez uwzględniania
-- prowizji, jeśli założymy, że każdy dostanie podwyżkę o 250 miesięcznie.

select ename, (sal + 250) * 12 "Roczna pensja + 250"
from emp;

-- 5 Wyrażenie sal * 12 z poprzedniego zadania zaetykietuj nagłówkiem Roczna.

select ename, (sal + 250) * 12 "Roczna"
from emp;

-- 6 Wyrażenie sal * 12 zaetykietuj nagłówkiem Placa Roczna.

select ename, (sal + 250) * 12 "Placa roczna"
from emp;

-- 7 Wypisz w jednej kolumnie wynikowej połączony numer pracownika i jego nazwisko.
-- Kolumnę wynikową zaetykietuj nagłówkiem Zatrudniony

select empno || ename zatrudniony
from emp;

-- 8 Literał: Utwórz zapytanie zwracające w jednej kolumnie połączony tekst Pracownik
-- numer i nazwisko pracownika, tekst pracuje w dziale nr i numer działu. Kolumnę
-- wynikową nazwij Informacje o pracownikach

select 'Pracownik ' || ename || ' pracuje w dziale nr ' || empno "Informacje o pracownikach"
from emp;

-- 9 Oblicz roczne dochody każdego pracownika, z uwzględnieniem prowizji comm

select ename, sal * 12 + nvl(comm, 0) "Roczna pensja"
from emp;

-- 10 Wypisz wszystkie numery departamentów występujące w tabeli EMP

select deptno
from emp;

-- 11 Wypisz wszystkie wzajemnie różne, (czyli bez powtórzeń) numery departamentów
-- występujące w tabeli EMP.

select distinct deptno
from emp;

-- 12 Wybierz wszystkie wzajemnie różne (czyli niepowtarzające się) kombinacje wartości
-- Deptno i Job.

select distinct deptno, job
from emp;

-- 13 Posortuj rosnąco wszystkie dane tabeli EMP według wartości w kolumnie Ename.

select *
from emp
order by ename;

-- 14 Posortuj malejąco wszystkie dane tabeli EMP według daty zatrudnienia (kolumna
-- Hiredate) począwszy od ostatnio zatrudnionych.

select *
from emp
order by hiredate desc;

-- 15 Posortuj dane z tabeli EMP według wzrastającej wartości kolumny Deptno, oraz
-- malejących wartości kolumny Sal.

select *
from emp
order by deptno, sal desc;

--================================================ cz.2

-- 1 Wypisz nazwiska, numery pracowników, stanowiska pracy, płacę i numery
-- departamentów wszystkich zatrudnionych na stanowisku CLERK

select ename, empno, job, sal, deptno
from emp
where job = 'CLERK';

-- 2 Wybierz wszystkie nazwy i numery departamentów większe od 20.

select dname, deptno
from dept
where deptno > 20;

-- 3 Wypisz numery i nazwiska pracowników, których prowizja przekracza miesięczną
-- pensję.

select empno, ename
from emp
where sal < comm;

-- 4 Wybierz wszystkie dane tych pracowników, których płaca mieści się w przedziale
-- <1000, 2000>.

select *
from emp
where sal between 1000 and 2000;

-- 5 Wybierz wszystkie dane tych pracowników, których bezpośrednimi szefami są
-- pracownicy o numerach 7902, 7566 lub 7788.

select *
from emp
where mgr in (7902, 7566, 7788);

-- 6 Wybierz wszystkie dane tych pracowników, których nazwiska zaczynają się na literę S.

select *
from emp
where ename like 'S%';

-- 7 Wybierz wszystkie dane pracowników, których nazwiska są czteroliterowe, używając i
-- nie używając funkcji zwracającej długości napisu

select *
from emp
where ename like '____';

select *
from emp
where length(ename) = 4;

-- 8 Wypisz numer, nazwisko i stanowisko tych pracowników, którzy nie posiadają szefa.

select empno, ename, job
from emp
where job is null;

-- 9 Wypisz numer, nazwisko i płacę tych pracowników, których zarobki są poza
-- przedziałem <1000, 2000>.

select empno, ename, sal
from emp
where sal not between 1000 and 2000;

-- 10 Wypisz numer, nazwisko i numer działu tych pracowników, których nazwiska nie
-- zaczynają się na literę M.

select empno, ename, deptno
from emp
where ename not like 'M%';

-- 11 Wybierz nazwiska tych pracowników, którzy mają szefa.

select ename
from emp
where mgr is not null;

-- 12 Wypisz nazwisko, numer działu, płacę i stanowisko pracowników zatrudnionych na
-- stanowisku CLERK, których zarobki mieszczą się w przedziale <1000, 2000>.

select ename, deptno, sal, job
from emp
where job = 'CLERK'
  and sal between 1000 and 2000;

-- 13 Wypisz nazwisko, numer działu, płacę i stanowisko tych pracowników, którzy albo są
-- zatrudnieni na stanowisku CLERK, albo ich zarobki mieszczą się w przedziale <1000,
-- 2000>

select ename, deptno, sal, job
from emp
where job = 'CLERK'
   or sal between 1000 and 2000;

-- 14 Wypisz nazwisko, płacę i stanowisko wszystkich pracowników zatrudnionych na
-- stanowisku MANAGER z pensją (Sal) powyżej 1500 oraz wszystkich zatrudnionych na
-- stanowisku SALESMAN.

select ename, sal, job
from emp
where (job = 'MANAGER'
    and sal > 1500)
   or (job = 'SALESMAN');

-- 15 Wypisz nazwisko, płacę i stanowisko wszystkich pracowników zatrudnionych na
-- stanowisku MANAGER lub na stanowisku SALESMAN, których pensje (Sal) są
-- wyższe od 1500.

select ename, sal, job
from emp
where (sal > 1500)
  and (job = 'SALESMAN' or job = 'MANAGER');

-- 16 Wypisz nazwisko, stanowisko i numer departamentu wszystkich pracowników
-- zatrudnionych na stanowisku MANAGER ze wszystkich departamentów wraz ze
-- wszystkimi pracownikami zatrudnionymi na stanowisku CLERK w departamencie 10.

select ename, job, deptno
from emp
where (job = 'CLERK'
    and deptno = 10)
   or (job = 'MANAGER');

-- 17 Wypisz wszystkie dane z tabeli SALGRADE.

select *
from salgrade;

-- 18 Wypisz wszystkie dane z tabeli DEPT.

select *
from dept;

-- 19 Wypisz wszystkie dane tych pracowników, których roczne dochody (z uwzględnieniem
-- prowizji) są mniejsze od 12000 lub większe od 24000.

select *
from emp
where sal * 12 + nvl(comm, 0) < 12000
   or sal * 12 + nvl(comm, 0) > 24000;

-- 20 Wypisz numery pracownicze, stanowiska i numery departamentów wszystkich
-- pracowników. Wynik posortuj rosnąco według numerów departamentów i stanowisk.

select empno, job, deptno
from emp
order by deptno, job;

-- 21 Wypisz wszystkie wzajemnie różne, (czyli bez powtórzeń) nazwy stanowisk pracy

select distinct job
from emp;

-- 22 Wypisz wszystkie dane pracowników zatrudnionych w departamentach 10 i 20 w
-- kolejności alfabetycznej ich nazwisk.

select *
from emp
where deptno in (10, 20)
order by ename;

-- 23 Wypisz wszystkie nazwiska i stanowiska pracy wszystkich pracowników z
-- departamentu 20 zatrudnionych na stanowisku CLERK.

select ename, job
from emp
where deptno = 20
  and job = 'CLERK';

-- 24 Wybierz nazwiska tych pracowników, w których nazwisku występuje ciąg liter „TH”
-- lub „LL”.

select ename
from emp
where ename like '%TH$'
   or ename like '%LL%';

-- 25 Wypisz nazwisko, stanowisko i pensję pracowników, którzy posiadają szefa

select ename, job, sal
from emp
where mgr is not null;

-- 26 Wypisz nazwiska i całoroczne dochody (z uwzględnieniem jednorazowej rocznej
-- prowizji COMM) wszystkich pracowników.

select ename, sal * 12 + nvl(comm, 0)
from emp;

-- 27 Wypisz nazwisko, numer departamentu i datę zatrudnienia tych pracowników, którzy
-- zostali zatrudnieni w 1982 r.

select ename, deptno, hiredate
from emp
where extract(year from hiredate) = 1982;

-- 28 Wypisz nazwiska, roczną pensję oraz prowizję tych wszystkich SALESMAN’ów,
-- których miesięczna pensja przekracza prowizję. Wyniki posortuj według malejących
-- zarobków, potem nazwisk (rosnąco).

select ename, 12 * sal, comm
from emp
where job = 'SALESMAN'
  and sal > comm
order by sal desc, ename;

--================================================ cz.3

-- 1 Wypisz wszystkie dane z tabel EMP i DEPT, nie realizując ich złączenia.

select *
from emp,
     dept;

-- 2 Wypisz wszystkie dane z tabel EMP i DEPT realizując ich złączenie.

select *
from emp
         join dept on emp.deptno = dept.deptno;

-- 3 Wypisz nazwiska wszystkich pracowników, wraz z numerami, nazwami i lokalizacjami
-- departamentów, w których są oni zatrudnieni. Zwracane rekordy posortuj w kolejności
-- alfabetycznej nazwisk.

select ename, empno, dname, loc
from emp
         join dept on emp.deptno = dept.deptno
order by ename;

-- 4 Dla pracowników o miesięcznej pensji powyżej 1500 wypisz ich nazwiska, miejsca
-- usytuowania ich departamentów, oraz nazwy tych departamentów.

select ename, loc, dname
from emp
         join dept on emp.deptno = dept.deptno
where sal > 1500;

-- 5 Utwórz listę pracowników podając ich nazwisko, stanowisko, pensję i stopień
-- zaszeregowania (grupę zarobkową Grade). Wynik posortuj według grupy
-- zaszeregowania malejąco i nazwiska rosnąco.

select ename, job, sal, grade
from emp
         join salgrade on sal between losal and hisal;

-- 6 Wypisz informacje o pracownikach (nazwisko, płaca, stanowisko), których zarobki
-- odpowiadają 3 grupie zarobkowej.

select ename, sal, job
from emp
         join salgrade on sal between losal and hisal
where grade = 3;

-- 7 Wypisz nazwiska i stanowiska pracowników zatrudnionych w DALLAS.

select ename, job
from emp
         join dept on emp.deptno = dept.deptno
where loc = 'DALLAS';

-- 8 Wybierz pracowników z działu 30 i 40 (nazwisko, numer działu, nazwę działu, i jego
-- lokalizację). Wypisz również dane działu 40 w którym brak jest zatrudnionych
-- pracowników.

select ename, emp.deptno, dname, loc
from emp
         right join dept on emp.deptno = dept.deptno and emp.deptno in (10, 30);

-- 9 Wypisz nazwisko, nazwę i lokalizacje działu wszystkich pracowników. Uwzględnij
-- także tych pracowników, którzy nie są przypisani do żadnego działu.

select ename, dname, loc
from emp
         left join dept on emp.deptno = dept.deptno;

-- 10 Wypisz nazwiska wszystkich pracowników oraz nazwy i lokalizacje wszystkich
-- działów. W wyniku mają pojawić się nazwiska pracowników nieprzypisanych do
-- żadnych działów, a także nazwy działów, w których nie są zatrudnieni pracownicy.

select ename, dname, loc
from emp
         full outer join dept on emp.deptno = dept.deptno
where emp.deptno is null;

-- 11 Wypisz nazwiska pracowników, którzy zarabiają mniej od swoich kierowników.

select emp.ename
from emp
         join emp m on (emp.mgr = m.empno)
where emp.sal < m.sal;

-- 12 Do rozwiązania zadania 11 dołącz nazwiska szefów, oraz płace szefów i ich
-- podwładnych.

select emp.ename pracownik, emp.sal placa, m.ename przelozony, m.sal placa
from emp
         join emp m on emp.mgr = m.empno
where emp.sal < m.sal;

-- UNION - złączenie wyników zapytań
-- INTERSECT - iloczyn wyników zapytań
-- EXCEPT (minus in oracle) - odejmowanie wyników zapytań

-- 13 Wykorzystując operację na zbiorach wyników, wypisz nazwy wszystkich stanowisk,
-- które występujące w dziale 10 lub w dziale 30.

select job
from emp
where deptno = 10
union
select job
from emp
where deptno = 30;

-- 14 Wykorzystując operację na zbiorach wyników, wypisz stanowiska występujące
-- zarówno w dziale 10, jak i w dziale 30.

select job
from emp
where deptno = 10
intersect
select job
from emp
where deptno = 30;

-- 15 Wykorzystując operację na zbiorach wyników, wypisz stanowiska występujące w dziale
-- 10, a niewystępujące w dziale 30.

select job
from emp
where deptno = 10
minus
select job
from emp
where deptno = 30;

--================================================ cz.4

-- 1 Oblicz średni zarobek w firmie, nazywając wynikową kolumnę Średnia płaca.

select avg(sal) "Srednia placa"
from emp;

-- 2 Znajdź minimalne zarobki na stanowisku CLERK.

select min(sal)
from emp
where job = 'CLERK';

-- 3 Policz pracowników zatrudnionych w departamencie 20.

select count(*)
from emp
where deptno = 20;

-- 4 Oblicz średnie zarobki na każdym ze stanowisk pracy

select job, avg(sal)
from emp
group by job;

-- 5 Oblicz średnie zarobki na każdym ze stanowisk pracy, z wyjątkiem stanowiska
-- MANAGER.

select job, avg(sal)
from emp
where job != 'MANAGER'
group by job;

-- 6 Oblicz średnie zarobki na każdym ze stanowisk pracy w każdym departamencie.

select job, deptno, avg(sal)
from emp
group by job, deptno;

-- 7 Oblicz maksymalne zarobki dla każdego stanowiska.

select job, max(sal)
from emp
group by job;

-- 8 Wybierz średnie zarobki tych departamentów, które zatrudniają więcej niż trzech
-- pracowników.

select deptno, avg(sal)
from emp e
group by deptno
having count(*) > 3;

-- 9 Wybierz stanowiska, na których średni zarobek wynosi 3000 lub więcej.

select job, avg(sal)
from emp
group by job
having avg(sal) >= 3000;

-- 10 Znajdź średnie miesięczne pensje oraz średnie roczne dochody dla każdego stanowiska
-- (pamiętaj o prowizji).

select job, avg(sal) "Pensja miesieczna", avg(sal * 12 + nvl(comm, 0)) "Srednia placa roczna"
from emp
group by job;

-- 11 Znajdź departamenty zatrudniające więcej niż trzech pracowników

select deptno
from emp e
group by deptno
having count(*) > 3;

-- 12 Sprawdź, czy wszystkie numery pracowników są rzeczywiście wzajemnie różne.

select empno
from emp
group by empno
having count(*) > 1;

-- 13 Podaj najniższe pensje wypłacane podwładnym swoich kierowników. Wyeliminuj
-- grupy o minimalnych zarobkach niższych niż 1000. Uporządkuj wyniki malejąco
-- według wielkości pensji.

select min(sal)
from emp
where mgr is not null
group by mgr
having min(sal) > 1000;

-- 14 Policz, ilu pracowników zatrudnia dział mający siedzibę w DALLAS.

select count(*) "Liczba pracownikow"
from emp
         join dept on emp.deptno = dept.deptno
where loc = 'DALLAS'
group by dept.deptno;

-- 15 Podaj maksymalne zarobki dla każdej grupy zarobkowej

select grade, max(sal) "Najwyzsza pensja"
from emp
         join salgrade on sal between losal and hisal
group by salgrade.grade;

-- 16 Sprawdź, które wartości zarobków powtarzają się i ilu pracowników je otrzymuje.

select sal, count(*) "Liczba pracownikow"
from emp e
group by sal;

-- 17 Podaj średni zarobek pracowników z drugiej grupy zarobkowej.

select trunc(avg(sal), 3) "Srednia placa"
from emp e
         join salgrade s on sal between s.losal and s.hisal
where s.grade = 2;

-- 18 Sprawdź, ilu podwładnych ma każdy kierownik, podając nazwisko kierownika

select mgr, count(*) "Liczba podwladnych"
from emp e
group by mgr;

-- 19 Podaj sumę, którą zarabiają razem wszyscy pracownicy z pierwszej grupy zarobkowej.

select sum(sal) "Suma"
from emp e
         join salgrade s on sal between s.losal and s.hisal
where s.grade = 1;

--================================================ cz.5

-- 1 Znajdź nazwiska i pensje pracowników, których pensja jest równa minimalnej pensji w firmie.

select ename, sal
from emp
where sal = (select min(sal) from emp);

-- 2 Znajdź nazwiska, pensje i numery departamentów wszystkich pracowników zatrudnionych na tym samym stanowisku, co BLAKE.

select ename, sal, deptno
from emp
where job = (select job from emp where ename = 'BLAKE');

-- 3 Z wyniku poprzedniego zadania wyeliminuj dane BLAKE’a.

select ename, sal, deptno
from emp
where job = (select job from emp where ename = 'BLAKE')
  and ename != 'BLAKE';

-- 4 Znajdź nazwisko, pensję i numer departamentu pracowników, których płace wynoszą tyle, ile najniższe zarobki w poszczególnych departamentach.

select ename, sal, deptno
from emp e
where sal in (select min(sal) from emp group by deptno);

-- 5 Znajdź nazwisko, pensję i numer departamentu pracowników o najniższych zarobkach
-- w tych departamentach, w których są zatrudnieni.

select ename, sal, deptno
from emp e
where sal in (select min(sal) from emp where e.deptno = emp.deptno);

-- 6 Stosując kwantyfikator ANY wypisz nazwisko, pensję i numer departamentu
-- pracowników zarabiających powyżej najniższej pensji z departamentu 30 (czyli więcej
-- od dowolnego pracownika z departamentu 30, czyli tego, który zarabia najmniej).

select ename, sal, deptno
from emp e
where sal > any (select sal from emp where deptno = 30);

-- 7 Stosując kwantyfikator ALL wypisz nazwisko, pensję i numer departamentu
-- pracowników, których zarobki są wyższe od pensji każdego pracownika z departamentu
-- 30 (czyli większe od najwyższej pensji w departamencie 30).

select ename, sal, deptno
from emp e
where sal > all (select sal from emp where deptno = 30);

-- 8 Znajdź numery departamentów, których średnie zarobki przekraczają średni zarobek
-- departamentu 30.

select deptno
from emp e
group by deptno
having avg(sal) > all (select avg(sal) from emp where deptno = 30);

-- 9 Do wyniku zadania poprzedniego dodaj wartości średnich zarobków w departamentach,
-- nazwy i lokalizacje departamentów.

select d.deptno, avg(sal), d.dname, d.loc
from emp e
         join dept d on e.deptno = d.deptno
group by d.deptno, d.dname, d.loc
having avg(sal) > all (select avg(sal) from emp where deptno = 30);

-- 10 Znajdź stanowisko, na którym są najwyższe średnie zarobki.

select job
from emp e
group by job
having avg(sal) > all (select avg(sal) from emp)
    fetch first 1 rows only;

-- 11 Znajdź nazwisko, pensję, stanowisko i numer departamentu pracowników, których
-- zarobki przekraczają najwyższe pensje z departamentu SALES.

select ename, sal, job, e.deptno
from emp e
where sal > all (select sal
                 from emp
                          join dept on emp.deptno = dept.deptno
                 where dname = 'SALES');

-- 12 Znajdź nazwisko, stanowisko i pensję pracowników, którzy pracują na tym samym
-- stanowisku, co pracownik o numerze 7369 i których zarobki są większe niż pracownika
-- o numerze 7876.

select ename, job, sal
from emp e
where job = (select job from emp where empno = 7369)
  and sal > (select sal from emp where empno = 7876);

-- 13 Wypisz nazwy działów, w których pracują urzędnicy (CLERK)

select dname
from dept
where dname in (select dname
                from dept e
                         join emp e on e.deptno = e.deptno
                where job = 'CLERK');

--================================================ cz.6

-- 1 Znajdź nazwisko, płacę i numer departamentu pracowników, którzy zarabiają najwięcej
-- w swoich departamentach.

select ename, sal, deptno
from emp e
where sal in (select max(sal) from emp where e.deptno = emp.deptno group by deptno);

-- 2 Znajdź nazwisko, płacę i numer departamentu pracowników, którzy zarabiają powyżej
-- średniej w ich departamentach.

select ename, sal, deptno
from emp e
where sal > all (select avg(sal) from emp where e.deptno = emp.deptno);

-- 3 Znajdź nazwisko, płacę i stanowisko pracowników o najniższych zarobkach wśród
-- pracowników na poszczególnych stanowiskach.

select ename, sal, job
from emp e
where sal in (select min(sal) from emp where e.job = emp.job);

-- 4 Znajdź za pomocą predykatu EXISTS nazwiska pracowników, którzy posiadają
-- podwładnych.

select ename
from emp e
where exists(select * from emp where emp.mgr = e.empno);

-- 5 Znajdź nazwiska pracowników, których departament nie występuje w tabeli DEPT

select ename
from emp e
where not exists(select * from dept where dept.deptno = e.deptno);

-- 6 Stosując podzapytanie, znajdź nazwy i lokalizację departamentów, które nie zatrudniają
-- żadnych pracowników.

select d.dname, d.loc
from dept d
where not exists(select * from emp where emp.deptno = d.deptno);

-- 7 Znajdź nazwiska, płace i stanowiska pracowników zarabiających maksymalną pensję
-- na ich stanowiskach pracy. Wynikowe rekordy uporządkuj według malejących
-- zarobków.

select ename, sal, job
from emp e
where sal = (select max(sal) from emp where e.job = emp.job)
order by sal desc;

-- 8 Znajdź nazwiska, płace i grupy zarobkowe pracowników zarabiających minimalną
-- pensję w ich grupach zarobkowych. Wynikowe rekordy uporządkuj według malejących
-- grup zarobkowych.

select ename, sal, grade
from emp e
         join salgrade s on e.sal between s.losal and s.hisal
where sal = (select min(sal) from emp where emp.sal between s.losal and s.hisal)
order by grade desc;

-- 9 Wskaż dla każdego departamentu (podaj nazwę i lokalizację) nazwiska i daty
-- zatrudnienia pracowników ostatnio zatrudnionych. Wynikowe rekordy uporządkuj
-- malejąco według dat zatrudnienia.

select d.dname, d.loc, e.ename, e.hiredate
from dept d
         join emp e on d.deptno = e.deptno
where e.hiredate in (select max(hiredate) from emp where e.deptno = d.deptno group by deptno);

-- 10 Podaj nazwisko, pensję i nazwę departamentu pracowników, których płaca przekracza
-- średnią ich grup zarobkowych.

select ename, sal, grade, d.dname
from emp e
         join salgrade s on e.sal between s.losal and s.hisal
         join dept d on e.deptno = d.deptno
where e.sal > (select avg(sal) from emp where emp.sal between s.losal and s.hisal);

-- 11 Stosując podzapytanie znajdź nazwiska pracowników przypisanych do nieistniejących
-- departamentów.

select ename
from emp e
where not exists(select * from dept where dept.deptno = e.deptno);