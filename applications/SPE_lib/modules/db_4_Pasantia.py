# -*- coding: utf-8 -*-
from gluon import *
from datetime import datetime
def Pasantia_Table(db,T):
    db.define_table('Pasantia',
        Field('titulo',
               label='Titulo'),
        Field('estudiante','reference Estudiante',
              label='Estudiante (*)'),
        Field('tutor_academico','reference Profesor',
              label='Tutor Academico (*)',
              requires=IS_EMPTY_OR(IS_IN_DB(db, db.Profesor._id, db.Profesor._format))),
        Field('tutor_industrial','reference Tutor_Industrial',
              label='Tutor Industrial (*)',
              requires=IS_EMPTY_OR(IS_IN_DB(db, db.Tutor_Industrial._id, db.Tutor_Industrial._format))),
        Field('periodo','reference Periodo',
              label='Periodo (*)',
              requires=IS_EMPTY_OR(IS_IN_DB(db, db.Periodo._id, db.Periodo._format))),
        Field('area_proyecto','reference Area_Proyecto',
              label='Areas de Proyectos (*)',
              requires=IS_EMPTY_OR(IS_IN_DB(db, db.Area_Proyecto._id, db.Area_Proyecto._format))),
        Field('resumen_proyecto','text',
              label ='Resumen del Proyecto',
              represent=lambda v, r: 'N/A' if v is None else v),
        Field('materia','reference Materia',
              label='Materia (*)',
              requires=IS_EMPTY_OR(IS_IN_DB(db, db.Materia._id, db.Materia._format))),
        Field('objetivo',
              label ='Objetivo General',
              represent=lambda v, r: 'N/A' if v is None else v),
        Field('confidencialidad','text',
              label ='Detalles de Confidencialidad',
              represent=lambda v, r: 'N/A' if v is None else v),
        Field('status','string',
              label='Estado De Pasantia',
              represent=lambda v, r: 'N/A' if v is None else v),
        Field('etapa','reference Etapa',
              label='Etapa (*)'),
        Field('fecha_creacion','datetime',default=datetime.now(),
              represent=lambda v, r: 'N/A' if v is None else v),
        Field('fecha_inicio','date',
              label='Fecha de inicio',
              represent=lambda v, r: 'N/A' if v is None else v),
        Field('fecha_fin','date',
              label='Fecha de culminacion',
              represent=lambda v, r: 'N/A' if v is None else v),
        Field('fecha_tope_jurado','date',
              label='Fecha tope para designar jurado',
              represent=lambda v, r: 'N/A' if v is None else v),
        Field('fecha_defensa','date',
              label='Fecha de la defensa',
              represent=lambda v, r: 'N/A' if v is None else v),
        format=lambda r: '%s %s - %s %s (%s)' % (r.id,r.titulo, r.estudiante.nombre,r.estudiante.apellido,r.estudiante.usbid)
    )
