# -*- coding: utf-8 -*-
# this file is released under public domain and you can use without limitations

#########################################################################
## This is a sample controller
## - index is the default action of any application
## - user is required for authentication and authorization
## - download is for downloading files uploaded in the db (does streaming)
#########################################################################

from usbutils import get_ldap_data, random_key
from Usuarios import Usuario

Usuario = Usuario()

def reroute():
    """
    Funcion utilizada para que nos lleve al index aunque estemos en la pagina
    por defecto de web2py
    """
    redirect(URL('index'))

def index():
    """
    example action using the internationalization operator T and flash
    rendered by views/default/index.html or views/generic.html

    if you need a simple wiki simply replace the two lines below with:
    return auth.wiki()
    """
    response.flash = T("¡Bienvenido!")
    return dict(message=T('Sistema de Pasantías Empresariales'))


def user():
    """
    exposes:
    http://..../[app]/default/user/login
    http://..../[app]/default/user/logout
    http://..../[app]/default/user/register
    http://..../[app]/default/user/profile
    http://..../[app]/default/user/retrieve_password
    http://..../[app]/default/user/change_password
    http://..../[app]/default/user/bulk_register
    use @auth.requires_login()
        @auth.requires_membership('group name')
        @auth.requires_permission('read','table name',record_id)
    to decorate functions that need access control
    also notice there is http://..../[app]/appadmin/manage/auth to allow administrator to manage users
    """
    return dict(form=auth())

def login_cas():
    if not request.vars.getfirst('ticket'):
        #redirect(URL('error'))
        pass
    try:
        import urllib2, ssl
        ssl._create_default_https_context = ssl._create_unverified_context


        # url en caso de querer iniciar sesion en el servidor remoto
        url = "https://secure.dst.usb.ve/validate?ticket="+\
              request.vars.getfirst('ticket') +\
              "&service=http%3A%2F%2Flocalhost%3A8000%2FSPE%2Fdefault%2Flogin_cas"

        # url en caso de querer iniciar sesion en el servidor remoto
        # url = "https://secure.dst.usb.ve/validate?ticket="+\
        #      request.vars.getfirst('ticket') +\
        #      "&service=https%3A%2F%2Fprosigue.dex.usb.ve%2FSPE%2Fdefault%2Flogin_cas"

        req = urllib2.Request(url)
        response = urllib2.urlopen(req)
        the_page = response.read()

    except Exception, e:
        print e
        redirect(URL('error'))

    if the_page[0:2] == "no":
        redirect(URL('index'))
    else:
        # session.casticket = request.vars.getfirst('ticket')
        data  = the_page.split()
        usbid = data[1]

        usuario = get_ldap_data(usbid) #Se leen los datos del CAS
        
        tablaUsuario  = db.UsuarioUSB

        #Esto nos indica si el usuario ha ingresado alguna vez al sistema
        #buscandolo en la tabla de usuario.
        primeravez = db(tablaUsuario.usbid==usbid)

        if primeravez.isempty():

            print usuario['tipo']

            authUserId=Usuario.registrar(usuario,auth)

            respuesta = Usuario.getByRole(authUserId)

            session.currentUser = respuesta

            if usuario['tipo'] == 'Pregrado' or usuario['tipo'] == 'Postgrado':
                redirect(URL(c='mi_perfil/configuracion'))

            redirect(URL(c='default',f='index'))
            # auth.login_bare(usbid,clave)
            #redirect(URL(c='default',f='registrar', vars=dict(usuario=usuario,usbid=usbid)))

        else:
            #Como el usuario ya esta registrado, buscamos sus datos y lo logueamos.
            datosAuth=db(db.auth_user.username==usbid).select().first()
            # Iniciamos Sesion
            auth.user=datosAuth
            auth.login_user(datosAuth)

            respuesta = Usuario.getByRole(auth.user.id)

            # Caso 1: El usuario no ha registrado sus datos
            if respuesta == None:
                redirect(URL(c='usuarios',f='perfil'))
            # Caso 2: El usuario no ha verificado su correo
            elif correo_no_verificado(usbid):
                obtener_correo(usbid)
                correo_sec = obtener_correo(usbid)
                redirect(URL(c='default',f='verifyEmail',vars=dict(usbid=usbid,correo=correo_sec)))
            # Caso 3: El usuario ha cumplido con los pasos necesarios por lo que
            # puede iniciar sesion
            else:
                #Deberiamos redireccionar a un "home" dependiendo del tipo de usuario
                session.currentUser = respuesta
                redirect('index')

    return None

def logout():
    url = 'http://secure.dst.usb.ve/logout'
    session.currentUser = None
    auth.logout(next=url)

def verificar_datos(usuario,usbid):

    usuariousb = db(db.UsuarioUSB.usbid==usbid).select()[0]
    consulta = None

    if usuario['tipo'] == "Docente":
        consulta = db(db.Profesor.usuario==usuariousb.id)
    elif usuario['tipo'] == "Administrativo":
        pass
    elif usuario['tipo'] in ["Pregrado","Postgrado"]:
        consulta = db(db.Estudiante.usuario==usuariousb.id)
    elif usuario['tipo'] in ["Empleado","Organizacion","Egresado"]:
        pass

    return consulta

def registrar():

    import ast
    #Aqui estan las variables obtenidas por el CAS
    usuario =  ast.literal_eval(request.vars['usuario'])

    if usuario['tipo'] == "Docente":
        #Enviar al registro del profesor
        redirect(URL(c='profesor',f='registrar_profesor', vars=dict(usuario=usuario,usbid=request.vars.usbid)))
    elif usuario['tipo'] == "Administrativo":
        pass
    elif usuario['tipo'] in ["Pregrado","Postgrado"]:
        #redirect(URL(c='profesor',f='registrar_profesor', vars=dict(usuario=usuario,usbid=request.vars.usbid)))
        redirect(URL(c='estudiante',f='registrar_estudiante', vars=dict(usuario=usuario,usbid=request.vars.usbid)))
    elif usuario['tipo'] in ["Empleado","Organizacion","Egresado"]:
        pass

    return dict(message=usuario)

#Comprueba si el usuario no ha verificado su correo
def correo_no_verificado(usbid):

    correoUsuario = obtener_correo(usbid)
    buscarCorreo  = db(db.correo_por_verificar.correo==correoUsuario)

    return not(buscarCorreo.isempty())

#Reenvia la verificacion del correo
def resendVerificationEmail():

    correoVerificarSet = db(db.correo_por_verificar.correo == request.vars.correo).select()

    reenviar_Correo_Verificacion(request.vars.correo)

    redirect(URL(c='default',f='verifyEmail',
        vars=dict(usbid=request.vars.usbid,correo=request.vars.correo,
            resend= T("El Correo ha sido reenviado"),
            message=T("Verificacion de Correo"))))

#Verifica el correo
def verifyEmail():
    form = SQLFORM.factory(
        Field('codigo', label=T('Codigo De Verificacion'), required=True,
                requires=IS_NOT_EMPTY(error_message=T('Este campo es necesario'))),
                formstyle='bootstrap3_stacked'
                           )
    form.add_button(T('Send Email Again'), URL(c='default',f='resendVerificationEmail',
        vars=dict(usbid=request.vars.usbid,correo=request.vars.correo)))

    correo_usuario = request.vars.correo

    if form.process().accepted:
        # Buscamos el id de la empresa
        correoVerificarSet = db(db.correo_por_verificar.correo == correo_usuario).select()[0]
        if correoVerificarSet.codigo != request.vars.codigo:
            response.flash = T("Codigo incorrecto")
        else:
            db(db.correo_por_verificar.correo == correo_usuario).delete()
            usuarioUSB = db(db.UsuarioUSB.usbid==request.vars.usbid).select()[0]
            auth.login_bare(request.vars.usbid,usuarioUSB.clave)
            redirect(URL(c='default',f='index'))

    return response.render('default/codigoVerificacion.html',
    message=T("Verificacion de Correo"),
    resend= request.vars.resend,
    form=form,vars=dict(usbid=request.vars.usbid,correo=correo_usuario))


@cache.action()
def download():
    """
    allows downloading of uploaded files
    http://..../[app]/default/download/[filename]
    """
    return response.download(request, db)


def call():
    """
    exposes services. for example:
    http://..../[app]/default/call/jsonrpc
    decorate with @services.jsonrpc the functions to expose
    supports xml, json, xmlrpc, jsonrpc, amfrpc, rss, csv
    """
    return service()