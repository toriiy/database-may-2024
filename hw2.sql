show databases;
use torii24;

select * from client where length(FirstName)<6;

select * from department where DepartmentCity = 'Lviv';

select * from client where Education = 'high' order by LastName;

select * from application order by idApplication desc limit 5;

select * from client where LastName = '%ov' or LastName = '%ova';

select client.*, d.DepartmentCity from client
                                           join torii24.department d on d.idDepartment = client.Department_idDepartment
where DepartmentCity = 'Kyiv';

select distinct FirstName from client;

select * from client
                  join torii24.application a on client.idClient = a.Client_idClient
where sum>5000;

select count(*), d.DepartmentCity from client
                                           join torii24.department d on d.idDepartment = client.Department_idDepartment
group by DepartmentCity;

select count(*), d.DepartmentCity from client
                                           join torii24.department d on d.idDepartment = client.Department_idDepartment
where DepartmentCity = 'Lviv';

select max(Sum), client.* from client
                                   join torii24.application a on client.idClient = a.Client_idClient
group by idClient;

select count(CreditState), client.* from client
                                             join torii24.application a on client.idClient = a.Client_idClient
group by idClient;

select max(Sum) from application;
select min(Sum) from application;

select count(CreditState), client.* from client
                                             join torii24.application a on client.idClient = a.Client_idClient
where Education = 'high'
group by idClient;

select avg(Sum), client.* from client
                                   join torii24.application a on client.idClient = a.Client_idClient
group by idClient
order by avg(Sum) desc
    limit 1;

select sum(Sum), d.* from client
                              join torii24.department d on d.idDepartment = client.Department_idDepartment
                              join torii24.application a on client.idClient = a.Client_idClient
group by idDepartment
order by sum(Sum) desc limit 1;

select max(Sum), d.* from client
                              join torii24.application a on client.idClient = a.Client_idClient
                              join torii24.department d on d.idDepartment = client.Department_idDepartment
group by idDepartment
    limit 1;

update application
    join torii24.client c on application.Client_idClient = c.idClient
    set Sum = 6000
where Education = 'high';

update client
    join torii24.department d on d.idDepartment = client.Department_idDepartment
    set City = 'Kyiv'
where DepartmentCity = 'Kyiv';

delete from application where CreditState = 'Returned';

delete application from application
join torii24.client c on c.idClient = application.Client_idClient
where LastName like '_a%' or
      LastName like '_o%' or
      LastName like '_i%' or
      LastName like '_e%' or
      LastName like '_y%';

select sum(Sum) as creditSum, idDepartment, DepartmentCity from department
                                                                    join torii24.client c on department.idDepartment = c.Department_idDepartment
                                                                    join torii24.application a on c.idClient = a.Client_idClient
where DepartmentCity = 'Lviv'
group by idDepartment
having sum(Sum)>5000;

select client.*, a.Sum, CreditState from client
                                             join torii24.application a on client.idClient = a.Client_idClient
where CreditState = 'Returned' and Sum>5000;

select * from application where CreditState = 'Not returned' order by Sum desc limit 1;

select Sum, client.* from client
                              join torii24.application a on client.idClient = a.Client_idClient
order by Sum limit 1;

select * from application
where Sum > (select avg(Sum) from application);

select * from client
where City = (
    select City from client
                         join torii24.application a on client.idClient = a.Client_idClient
    group by idClient
    order by count(CreditState) desc limit 1);

select City from client
                     join torii24.application a on client.idClient = a.Client_idClient
group by idClient
order by count(CreditState) desc limit 1;