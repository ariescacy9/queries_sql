
-- muestra el producto con su categoria, tipo de material, cantidad en inventario y precio unitario
select p.name as nombre, m.type as material, c.name as categoria, i.amount_total as cantidad_productos, pr.unit as precio_unitario 
  from product p 
  join material m on p.material_id  = m.id
  join category c on p.category_id = c.id
  join price pr on pr.product_id  = p.id 
  join inventory i on p.id = i.product_id 
  group by p.name, pr.unit, i.amount_total, m.type, c.name
  order by amount_total desc;

-- muestra la compra de productos por cada proveedor
select pro.name as proveedor, br.name as marca, p.name as producto, b.amount as cantidad, b.price_total as precio_total, m.type  
  from provider pro join buy b on  pro.id = b.provider_id
  join product p  on  p.id  = b.product_id 
  join brand br on br.id = p.brand_id 
  join material m on m.id = p.material_id 
  group by pro.name, br.name, p.name, b.amount, b.price_total, m."type" 
  order by pro.name desc;

-- muestra la cantidad del valor total de las ventas mas altas de cada producto
select p.name as producto, s.amount as cantidad_vendida, pr.unit as precio_unitario, (s.amount * pr.unit) as valor_total 
  from product p join sale s on  p.id = s.product_id 
  join price pr  on  p.id  = pr.product_id 
  group by p.name, s.amount , pr.unit
  order by valor_total desc;

-- muestra la cantidad total de productos vendidos
select  p.name as producto, sum(s.amount) as cantidad_vendida
  from product p join sale s on  p.id = s.product_id 
  group by p.name
  order by cantidad_vendida desc;

-- muestra la cantidad de productos por nombre y ventas realizadas del producto
select count(p.name) as cantidad_ventas,  p.name as producto
  from product p join sale s on  p.id = s.product_id 
  group by p.name
  order by cantidad_ventas desc;