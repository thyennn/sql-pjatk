-- podzapytania
-- w klauzulach where i having moze pojawic sie podzapytanie - instrukcja select ujeta w nawiasy i nie zakonczona srednikiem
-- dostarczajaca warowsci do porownan w warunku logicznym

-- w klauzuli from moze sie pojawic podzapytanie - instrukcja select ujeta w nawiasy i nie zakonczona srednikiem
-- tworzaca zestaw rekordow ktory moze byc traktowany jako wirtualna tabelka (widok)

-- w klauzuli select moze sie pojawic podzaputanie ale nie polecam

-- podzapytania "zwykle"
-- znajdz dane pracownika ktory zarabia najwiecej w firmie:

select ename, job, sal
from emp
where sal = (select max(sal) from emp);

-- znajdz dane pracownikow , ktorzy pracuja na tym samym stanowisku co smith i zarabiaja mniej niz scott:

select ename, job, sal
from emp
where job = (select job from emp where ename = 'SMITH')
  and sal < (select sal from emp where ename = 'SCOTT');

-- operator all - testuje wartosci wieksze niz wszystkie wartosci w zbiorze
select *
from emp
where sal > all (select sal from emp where deptno = 30);

-- operator any - testuje wartosci wieksze niz chociaz jedna wartosc w zbiorze
select *
from emp
where sal > any (select sal from emp where deptno = 30);

-- min wartosc sal dla deptno 30 to 950
-- max wartosc sal dla deptno 30 to 2850

-- znajdz dzial w ktorym sa najwyzsze srednie zarobki:
select e.deptno
from emp e
         join dept d on e.deptno = d.deptno
group by e.deptno
having avg(sal) = (select max(avg(sal)) from emp group by deptno);

-- albo

select d.deptno, dname, loc, trunc(avg(sal), 3) as avg_sal
from emp e
         join dept d on e.deptno = d.deptno
group by d.deptno, dname, loc
having avg(sal) >= all (select avg(sal) from emp group by dname, loc);

-- znajdz pracownikow zarabiajacych najwiecej w dzialach w ktorych pracuja. w wyniku podaj nazwe dzialu

select ename, sal, dname, loc
from emp e
         join dept d on e.deptno = d.deptno
where (sal, e.deptno) in (select max(sal), deptno from dept group by deptno);


--========================================================================================================================

-- podzapytania skorelowane
-- podzapytanie moze odwolywac sie do wartosci odczytywanych w zapytaniu nadrzednym - moze dokonywac ich ich porownan


-- przyklad
-- znajdz pracownikow zarabiajacych najwiecej w dzialach w ktorych pracuja w wyniku podaj nazwe dzialu
-- nie korzystajac z prowniania par wartosci jak to mialo miejsce w poprzednim rozwiazaniu

select ename, sal, dname, loc
from emp e
         join dept d on e.deptno = d.deptno
where sal = (select max(sal) from emp e1 where e.deptno = e1.deptno);

-- dla kazdego rozpatrywanego rekordu w zapytaniu nadrzednym
-- wykonywane jest poszukiwanir maksymalnej placy w zapytaniu
-- podrzednym, ale tylko dal rekordow spelniajacych warunek porowniania

-- w podzapytaniach na ogol w podzapytaniach skorelowanych mozna uzywac operatorow:
-- [not] exists testujacego instnienia rekordu spelniajacego warunek porownaniam ale abstrachujacy od ich konkretnych wartowsc, dlatego w porowniach
-- nie musimy odwolywac sie do odczytu watosci z tabel

-- przyklad 1 - szukamy dzialow w ktorych nie ma zatrudnionych pracownikow
select dname, loc
from dept d
where not exists(select 1 from emp e where e.deptno = d.deptno);

-- przyklad 2 - szukamy pracownikow, ktorzy maja podwladnych

select ename
from emp e1
where exists(select 1 from emp e2 where e1.empno = e2.mgr);

-- co mozna tez zrobic bez korelacji

select ename
from emp e1
where empno in (select mgr from emp e2);

-- a teraz tych ktorzy podwladnych nie maja

select ename
from emp e1
where not exists(select 1 from emp e2 where e1.empno = e2.mgr);

-- not in
select ename
from emp e
where empno not in (select mgr from emp);

-- brak rekordow