# -*- coding: utf-8 -*-
from gluon import *


def Profesor_Table(db, T):
    db.define_table('Profesor',
                    Field('usuario', 'reference auth_user',
                          writable=False,
                          unique=True,
                          label='Usuario (*)'),
                    Field('categoria', 'reference Categoria',
                          label='Categoria (*)'),
                    Field('dedicacion', 'reference Dedicacion',
                          label='Dedicacion (*)'),
                    Field('departamento', 'reference Departamento',
                          label='Departamento (*)'),
                    Field('sede', 'reference Sede',
                          label='Sede (*)'),
                    Field('activo', 'boolean'),
                    format=lambda r: '%s - %s %s' % (r.usuario.username, r.usuario.first_name, r.usuario.last_name)
                    )

    if db(db.Profesor.id > 0).count() == 0:
        db.Profesor.insert(
            id='3',
            usuario='3',
            categoria='1',
            dedicacion='1',
            departamento='1',
            sede='1',
            activo='True'
        )
        db.Profesor.insert(
            id='5',
            usuario='5',
            categoria='1',
            dedicacion='1',
            departamento='1',
            sede='1',
            activo='True'
        )
        db.Profesor.insert(
            id='9',
            usuario='9',
            categoria='1',
            dedicacion='1',
            departamento='1',
            sede='1',
            activo='True'
        )
        db.Profesor.insert(
            id='10',
            usuario='10',
            categoria='1',
            dedicacion='1',
            departamento='1',
            sede='1',
            activo='True'
        )
        db.commit()
