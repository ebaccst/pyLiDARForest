/*

	plots

*/

insert into owner(name)
select distinct dono from rawplot
where not exists(select dono from owner)

insert into county(name)
select distinct municipio from rawplot
where not exists (select distinct name from county)

insert into vegetation(name)
select distinct vegetacao from rawplot
where not exists (select distinct name from vegetation)

insert into tipology(name)
select distinct tipologia from rawplot
where not exists (select distinct name from tipology)

insert into comunity(name)
select distinct comunidade from rawplot
where not exists (select distinct name from comunity)

insert into plot_type(name)
select distinct tipoparcela from rawplot
where not exists (select distinct name from plot_type)

insert into plot_class(name)
select distinct classificacaoparcela from rawplot
where not exists (select distinct name from plot_class)

insert into plots(county_id,vegetation_id,tipology_id,comunity_id,plot_type_id,plot_class_id,name,number,subplot)
select  b.id,c.id,d.id,e.id,f.id,g.id,parcela,n,subparcela from rawplot a
inner join county b
on a.municipio = b.name
inner join vegetation c
on a.vegetacao = c.name
inner join tipology d
on a.tipologia = d.name
inner join comunity e
on a.comunidade = e.name
inner join plot_type f
on a.tipoparcela = f.name
inner join plot_class g
on a.classificacaoparcela = g.name

/*

	Measurements

*/

insert into measurements(plot_id,initial_date,
