select * from cliente;
select * from cuenta;

select ct.id, ct.numero_cuenta, cl.nombre from cuenta ct
left join cliente cl on ct.cliente_id = cl.cliente_id
order by ct.id asc;