select * from cuenta
select * from deposito

insert into Deposito values(1, 1, '2025-06-01', 'Ventas al contado', 5000)
insert into Deposito values(2, 1, '2025-06-01', 'Cobros de Ventas Credito', 6000)
insert into Deposito values(1, 2, '2025-06-03', 'Ventas al contado', 4000)
delete from Deposito where CuentaID = 1 and DepositoID = 2

update Deposito set Valor = 14000 where CuentaID = 1 and DepositoID = 2
update Deposito set Valor = 6000 where CuentaID = 1 and DepositoID = 1