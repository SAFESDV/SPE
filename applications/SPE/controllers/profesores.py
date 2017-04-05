# -*- coding: utf-8 -*-
from Profesores import Profesor

import Encoder
from applications.SPE_lib.modules.grids import simple_spe_grid
Profesor = Profesor()

def sqlform_grid():
    if not request.args:
        return simple_spe_grid(db.Profesor)
    elif request.args[-2]=='new':
        return agregar(request)
    elif request.args[-3]=='edit':
        return modificar(request)
    elif request.args[-3]=='delete':
        return eliminar(request)
    else:
        return simple_spe_grid(db.Profesor)

def sqlform_grid():
    query = db(db.Profesor.usuario == db.auth_user.id)
    db.auth_user._format = lambda row: row.first_name + " " + row.last_name
    db.Departamento._format = lambda row: row.first_name
    fields = [
        db.auth_user.username,
        db.Profesor.usuario,
        db.Profesor.categoria,
        db.Profesor.dedicacion,
        db.Profesor.departamento,
        db.Profesor.sede,
    ]

    if not request.args:
        return simple_spe_grid(query, fields=fields, field_id=db.Profesor.id)
    elif request.args[-2]=='new':
        return agregar(request)
    elif request.args[-3]=='edit':
        return modificar(request)
    elif request.args[-3]=='delete':
        return eliminar(request)
    else:
        return simple_spe_grid(query, fields=fields, field_id=db.Profesor.id)



@auth.requires(Usuario.checkUserPermission(construirAccion(request.application,request.controller)))
def listar():
    session.rows = []
    return dict(rows=session.rows)


def agregarProfesoresEnMasa():
    y = request.vars.agregarProfesoresEnMasa
    y = request.vars.fafafa
    return y

@auth.requires(Usuario.checkUserPermission(construirAccion(request.application,request.controller)))
def agregar(request):
    fields = [
        'usuario',
        'categoria',
        'dedicacion',
        'departamento',
        'sede'
    ]
    db.Profesor.usuario.writable=True
    form = SQLFORM.factory(db.Profesor, fields=fields, submit_button='Crear', showid=False)

    if form.process().accepted:
        # Actualizo los datos de usuario
        profesorId = db.Profesor.insert(
            usuario=form.vars.usuario,
            categoria=form.vars.categoria,
            dedicacion=form.vars.dedicacion,
            departamento=form.vars.departamento,
            sede=form.vars.sede,
            activo=form.vars.activo,
        )
        profesor=db.Profesor(id=profesorId)
        group = db.auth_group(role="Profesor")
        # Se agrega el rol
        membership = db.auth_membership.insert(
            user_id=profesor.usuario,
            group_id=group.id,
        )
        # Actualizo los datos exclusivos de estudiante
        session.flash = T('Perfil actualizado exitosamente!')
        redirect(URL('sqlform_grid'))
    elif form.errors:
        response.flash = T('La forma tiene errores, por favor llenela correctamente.')
    else:
        response.flash = T('Por favor llene la forma.')

    return form

@auth.requires(Usuario.checkUserPermission(construirAccion(request.application,request.controller)))
def count():
    obj = Encoder.to_dict(request.vars)
    count = Profesor.count(obj)

    return count

@auth.requires(Usuario.checkUserPermission(construirAccion(request.application,request.controller)))
def get():
    obj = Encoder.to_dict(request.vars)

    rows = db(((db.Profesor.usuario == db.auth_user.id) & (db.Profesor.sede == db.Sede.id)
               & (db.Profesor.dedicacion == db.Dedicacion.id)
               & (db.Profesor.categoria == db.Categoria.id)
               & (db.auth_user.auth_User == db.auth_user.id))).select()

    return rows.as_json()

@auth.requires(Usuario.checkUserPermission(construirAccion(request.application,request.controller)))
def modificar(request):
    fields = [
        'usuario',
        'categoria',
        'dedicacion',
        'departamento',
        'sede'
    ]
    profesor = db.Profesor(request.args[-1]) or redirect(URL('agregar'))
    usuario = db.auth_user(profesor.usuario)
    form = SQLFORM.factory(db.Profesor,record=profesor, fields=fields, submit_button='Actualizar', showid=False)

    if form.process().accepted:
        # Actualizo los datos exclusivos de profesor
        profesor.update_record(**db.Profesor._filter_fields(form.vars))
        session.flash = T('Perfil actualizado exitosamente!')
        redirect(URL('sqlform_grid'))
    elif form.errors:
        response.flash = T('La forma tiene errores, por favor llenela correctamente.')
    else:
        response.flash = T('Por favor llene la forma.')

    return form

@auth.requires(Usuario.checkUserPermission(construirAccion(request.application,request.controller)))
def eliminar(request):
    profesor = db.Profesor(request.args[-1]) or redirect(URL('agregar'))
    group = db.auth_group(role="Profesor")
    # Se agrega el rol
    membership = db.auth_membership(
        user_id=profesor.usuario,
        group_id=group.id,
    )
    profesor.delete_record()
    membership.delete_record()
    redirect(URL('sqlform_grid'))
