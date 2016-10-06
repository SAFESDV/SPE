# -*- coding: utf-8 -*-
from Ejecuciones import Ejecucion

import Encoder

Ejecucion = Ejecucion()

def listar():
    session.rows = []

    return locals()

def agregar():
    form = SQLFORM(db.Ejecucion)

    if form.process().accepted:
        session.flash = T('La Inscripcion fue agregada exitosamente!')
        redirect(URL('listar'))
    elif form.errors:
        response.flash = T('La forma tiene errores, por favor llenela correctamente.')
    else:
        response.flash = T('Por favor llene la forma.')
    return locals()

def count():
    obj = Encoder.to_dict(request.vars)
    count = Ejecucion.count(obj)

    return count

def get():
    obj = Encoder.to_dict(request.vars)

    rows = db((db.Ejecucion.pasantia == db.Pasantia.id) & (db.Pasantia.estudiante == db.Estudiante.id) & (db.Pasantia.id == db.Plan_Trabajo.pasantia)).select()

    # rows = Inscripcion.find(obj)

    # rows = rows.as_json()

    # print 'INICIO'
    # print db((db.Inscripcion.pasantia == db.Pasantia.id) & (db.Pasantia.estudiante == db.Estudiante.id)).select()
    # print '\n'
    # print rows
    return rows.as_json()


# -*- coding: utf-8 -*-

def modificar():
    record = db.Ejecucion(request.args(0)) or redirect(URL('agregar'))
    form = SQLFORM(db.Ejecucion, fields=['aprobacionCCT','comentarioCCT'],record=record,showid=False)

    if form.process().accepted:
        '''
        if request.vars.aprobacionCCT:
            pasantia = db.Pasantia(record.pasantia)
            etapa = db.Etapa(pasantia.etapa)

            if not etapa.nombre == 'Ejecucion':
                etapaEjec = db(db.Etapa.nombre == 'Ejecucion').select().first()
                pasantia.update_record(etapa=etapaEjec.id)

                record.update_record(estado='Aprobado')          
        '''
        session.flash = T('La Ejecucion fue modificada exitosamente!')
        redirect(URL('listar'))

    else:
        response.flash = T('Por favor llene la forma.')
    return locals()

def create():
    return request.vars
