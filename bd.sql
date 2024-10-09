
-- tabla 1 --
create table usuario (
    idUsuario serial primary key not null,
    nombresUsuario varchar not null,
    usuarioUsuario varchar not null,
    contrasenaUsuario varchar not null
);

-- view usuarios --
create or replace view v_usuarios as 
    select * from usuario;

create or replace function public.f_createUser (

    p_nombresUsuario varchar,
    p_usuarioUsuario varchar,
    p_contrasenaUsuario varchar

)
returns setof v_usuarios
language plpgsql
as $function$
declare 

    nuevoUsuarioId int;

begin

    insert into usuario (nombresUsuario, usuarioUsuario, contrasenaUsuario)
        values (p_nombresUsuario, p_nombresUsuario, p_contrasenaUsuario)

    returning idUsuario into nuevoUsuarioId;

    return query select * from view_usuario where idUsuario = nuevoUsuarioId;

end
$function$;