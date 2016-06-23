from datetime import datetime
# -*- coding: utf-8 -*-

db.define_table('Pasantia',
    Field('titulo',
           requires=[IS_NOT_EMPTY
                        (error_message='Es necesario un Titulo.')],
           label='Titulo'),
    Field('estudiante','reference Estudiante',
          requires=IS_IN_DB(db, db.Estudiante, '%(carnet)s',
          error_message='Elija uno de los estudiantes.'),
          label='Estudiante (*)'),
    # Field('tutor_academico', 'reference Profesor',
    #       label='Tutor Academico'),
    # Field('tutor_industrial','reference Tutor_Industrial',
    #       requires=IS_IN_DB(db, db.Tutor_Industrial, '%(apellido)s',
    #       error_message='Elija un tutor.'),
    #       label='Tutores (*)'),
    Field('periodo','reference Periodo',
          requires=IS_IN_DB(db, db.Periodo, '%(mes_inicio)s-%(mes_final)s',
          error_message='Elija un periodos.'),
          label='Periodo (*)'),
    # Field('area_proyecto','reference Area_Proyecto',
    #       requires=IS_IN_DB(db, db.Area_Proyecto, '%(nombre)s',
    #       error_message='Elija una de las áreas de proyecto'),
    #       label='Areas de Proyectos (*)'),
    Field('resumen_proyecto','text',
          requires=[IS_NOT_EMPTY
                        (error_message='Coloque resumen del proyecto ')],
          label ='Resumen del Proyecto'),
    Field('materia','reference Materia',
          requires=IS_IN_DB(db, db.Materia, '%(codigo)s',
          error_message='Elija una de las materias.'),
          label='Materia (*)'),
    Field('objetivo',
          requires=[IS_NOT_EMPTY
                (error_message='Adicione Area del Proyecto.')],
          label ='Objetivo General'),
    Field('confidencialidad',
          requires=[IS_NOT_EMPTY
                        (error_message='Adicione Area del Proyecto.')],
          label ='Detalles de Confidencialidad'),
    Field('status','string',
          label='Estado De Pasantia'),
    Field('etapa','reference Etapa',
          requires=IS_IN_DB(db, db.Etapa, '%(nombre)s',
          error_message='Elija una de las Etapas.'),
          label='Etapa (*)'),
    Field('fecha_creacion','datetime',default=datetime.now()),
    Field('fecha_inicio','string',
          label='Fecha de inicio'),
    Field('fecha_fin','string',
          label='Fecha de culminacion'),
    Field('fecha_tope_jurado','string',
          label='Fecha tope para designar jurado'),
    Field('fecha_defensa','string',
          label='Fecha de la defensa')
)
