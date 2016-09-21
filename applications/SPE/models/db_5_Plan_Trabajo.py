# -*- coding: utf-8 -*-


db.define_table('Plan_Trabajo',
    Field('pasantia','reference Pasantia',
          requires=IS_IN_DB(db, db.Pasantia,
          error_message='Elija uno de las pasantías.'),
          label='Pasantia (*)'),
    Field('aprobacion_tutor_academico', 'string', default='En espera', label='Aprobacion Del Tutor Academico',
          represent=lambda v, r: 'N/A' if v is None else v),
    Field('aprobacion_tutor_industrial', 'string', default='En espera', label='Aprobacion Del Tutor Industrial',
          represent=lambda v, r: 'N/A' if v is None else v),
    Field('aprobacion_coordinacion', 'string', default='En espera', label='Aprobacion De La Coordinacion',
          represent=lambda v, r: 'N/A' if v is None else v),
    Field('fecha_creacion','datetime',default=datetime.now(),
          represent=lambda v, r: 'N/A' if v is None else v),
    Field('fecha_envio','datetime',
          represent=lambda v, r: 'N/A' if v is None else v),
    Field('estado','string',default="Sin Enviar",
          represent=lambda v, r: 'N/A' if v is None else v),
)
