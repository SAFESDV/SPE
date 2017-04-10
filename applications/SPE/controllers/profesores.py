# -*- coding: utf-8 -*-
from Profesores import Profesor
from usbutils import random_key
import Encoder
import csv
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
    return locals()

@auth.requires(Usuario.checkUserPermission(construirAccion(request.application,request.controller)))
def AgregarProfesoresEnMasa():

    import os
    form = SQLFORM.factory(
        Field('archivo_csv', 'upload',uploadfolder="uploads"))
    if form.process().accepted:
        response.flash = 'form accepted'
        session.archivo_exel = form.vars.archivo_exel
        archivo = session.archivo_exel
        filepath = os.path.join('uploads', str(archivo))
        with open(filepath) as f:
            content = csv.reader(f)
            i=1
            for profesor in content:

                AtributosProf = profesor
                first_name = AtributosProf[0]
                last_name = AtributosProf[1]

#No se que es estooooo
                tipoDocumento = AtributosProf[2]
                cedula = AtributosProf[3]
                carnet = AtributosProf[4]
                email = AtributosProf[5]
                telefono = AtributosProf[6]
                direccion = AtributosProf[7]
                sexo = AtributosProf[8]
                pais = AtributosProf[9]
                estado = AtributosProf[10]
                clave = random_key()
                auth_User_Id = db.auth_user.insert(
                    first_name=first_name,
                    last_name=last_name,
 #                   tipo_documento=tipoDocumento,
                    numero_documento=cedula,
                    username=carnet,
                    direccion=direccion,
                    sexo=sexo,
                    email=email,
                    telefono=telefono,
                    password = db.auth_user.password.validate(clave)
                )
                if (len(AtributosProf) == 15):
                    if (AtributosProf[11].upper().lower() == "asociado"):
                        categoriaLeida = '1'
                    elif (AtributosProf[11].upper().lower() == "titular"):
                        categoriaLeida = '2'
                    elif (AtributosProf[11].upper().lower() == "agregado"):
                        categoriaLeida = '3'
                    elif (AtributosProf[11].upper().lower() == "asistente"):
                        categoriaLeida = '4'
                    else:
                        print("Error al leer categoría: " + str(i))
                        categoriaLeida = '1'

                    if (AtributosProf[12].upper().lower() == "exclusiva"):
                        dedicacionLeida = '1'
                    else:
                        print("Error al leer dedicación: " + str(i))
                        print("----------------------------------")
                        print(AtributosProf[12].upper().lower())
                        print("----------------------------------")

                        dedicacionLeida = '1'

                    if (AtributosProf[13].upper().lower() == "ciencias de los materiales"):
                        departamentoLeida = '1'
                    elif (AtributosProf[13].upper().lower() == "ciencias de la tierra"):
                        departamentoLeida = '2'
                    elif (AtributosProf[13].upper().lower() == "computación y tecnología de la información"):
                        departamentoLeida = '3'
                    elif (AtributosProf[13].upper().lower() == "conversión y transporte de energía"):
                        departamentoLeida = '4'
                    elif (AtributosProf[13].upper().lower() == "electrónica y circuitos"):
                        departamentoLeida = '5'
                    elif (AtributosProf[13].upper().lower() == "mecánica"):
                        departamentoLeida = '6'
                    elif (AtributosProf[13].upper().lower() == "procesos y sistemas"):
                        departamentoLeida = '7'
                    elif (AtributosProf[13].upper().lower() == "tecnología de procesos biológicos y bioquímicos"):
                        departamentoLeida = '8'
                    elif (AtributosProf[13].upper().lower() == "termodinámica y fenómenos de transferencia"):
                        departamentoLeida = '9'
                    elif (AtributosProf[13].upper().lower() == "biología celular"):
                        departamentoLeida = '10'
                    elif (AtributosProf[13].upper().lower() == "biología de organismos"):
                        departamentoLeida = '11'
                    elif (AtributosProf[13].upper().lower() == "cómputo científico y estadística"):
                        departamentoLeida = '12'
                    elif (AtributosProf[13].upper().lower() == "estudios ambientales"):
                        departamentoLeida = '13'
                    elif (AtributosProf[13].upper().lower() == "física"):
                        departamentoLeida = '14'
                    elif (AtributosProf[13].upper().lower() == "matemáticas puras y aplicadas"):
                        departamentoLeida = '15'
                    elif (AtributosProf[13].upper().lower() == "química"):
                        departamentoLeida = '16'
                    elif (AtributosProf[13].upper().lower() == "ciencias económicas y administrativas"):
                        departamentoLeida = '17'
                    elif (AtributosProf[13].upper().lower() == "ciencias sociales"):
                        departamentoLeida = '18'
                    elif (AtributosProf[13].upper().lower() == "ciencia y tecnología del comportamiento"):
                        departamentoLeida = '19'
                    elif (AtributosProf[13].upper().lower() == "diseño, arquitectura y artes plásticas"):
                        departamentoLeida = '20'
                    elif (AtributosProf[13].upper().lower() == "filosofía"):
                        departamentoLeida = '21'
                    elif (AtributosProf[13].upper().lower() == "idiomas"):
                        departamentoLeida = '22'
                    elif (AtributosProf[13].upper().lower() == "lengua y literatura"):
                        departamentoLeida = '23'
                    elif (AtributosProf[13].upper().lower() == "planificación urbana"):
                        departamentoLeida = '24'
                    elif (AtributosProf[13].upper().lower() == "profesional externo a la usb (internacional)"):
                        departamentoLeida = '25'
                    elif (AtributosProf[13].upper().lower() == "tecnología industrial"):
                        departamentoLeida = '26'
                    elif (AtributosProf[13].upper().lower() == "formación general y ciencias básicas"):
                        departamentoLeida = '27'
                    elif (AtributosProf[13].upper().lower() == "tecnología de servicios"):
                        departamentoLeida = '28'
                    elif (AtributosProf[13].upper().lower() == "profesional externo a la usb (en venezuela)"):
                        departamentoLeida = '29'
                    else:
                        print("Error al leer el departamento: " + str(i))
                        departamentoLeida = '1'


                    if (AtributosProf[14].upper().lower() == "sartenejas"):
                        sedeLeida = '1'
                    elif (AtributosProf[14].upper().lower() == "litoral"):
                        sedeLeida = '2'
                    else:
                        print("Error al leer sede: " + str(i))
                        sedeLeida = '1'
    
                    activoLeida = True
                    profesorId = db.Profesor.insert(
                        usuario=auth_User_Id,
                        categoria=categoriaLeida,
                        dedicacion=dedicacionLeida,
                        departamento=departamentoLeida,
                        sede=sedeLeida,
                        activo='True'
                    )
                    profesor=db.Profesor(id=profesorId)
                    group = db.auth_group(role="Profesor")
                    membership = db.auth_membership.insert(
                        user_id=profesor.usuario,
                        group_id=group.id,
                    )
                else:
                    print "linea invalida: " + str(i)
                i = i+1
    elif form.errors:
        response.flash = 'form has errors'
    return dict(form=form)

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


