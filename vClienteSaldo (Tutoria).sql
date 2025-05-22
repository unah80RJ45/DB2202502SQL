--select * from factura where tipo = 'R'

create or alter view vFacturaValor
as
	select FacturaID, sum(cast(Cantidad * Precio * (1 + ISV) as numeric(11,2))) Valor
	from facturadetalle 
	group by facturaid
go

create or alter view vFacturaPago
as
	select FacturaID, sum(Valor) Valor
	from recibodetalle
	group by FacturaID
go

create or alter view vFacturaSaldo
as
	select fv.facturaid, fv.Valor, isnull(fp.valor, 0) as Pago, fv.Valor - isnull(fp.valor, 0) Saldo
	from vFacturaValor fv
	left join vFacturaPago fp on fv.FacturaID = fp.FacturaID 
go

create or alter view vClienteSaldo
as
	select c.nombre, sum(fs.saldo) as Saldo
	from factura f
	inner join cliente as c on f.clienteid = c.clienteid
	inner join vFacturaSaldo fs on f.facturaid = fs.facturaid
	where fs.Saldo > 0 and f.tipo = 'R'
	group by c.nombre
go

select * from vClienteSaldo
