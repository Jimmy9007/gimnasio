<?php

return array(
    'acl' => array(
        'roles' => array(
            'guest' => null,
            'member' => 'guest'
        ),
        'resources' => array(
            'allow' => array(
                'Usuarios\Controller\Login' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                'Administracion\Controller\Index' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                'Administracion\Controller\Usuario' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                'Administracion\Controller\Medidas' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                 'Administracion\Controller\Mensualidad' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                 'Administracion\Controller\Instructor' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                'Administracion\Controller\Rutinas' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                'Administracion\Controller\Usuariorutinas' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                 'Administracion\Controller\Asistencia' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                  'Administracion\Controller\Ejercicios' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                  'Administracion\Controller\Entreno' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                  'Administracion\Controller\Producto' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                  'Administracion\Controller\Venta' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                  'Administracion\Controller\Proballuvia' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
                'Administracion\Controller\Perfil' => array(
                    'login' => 'invitado',
                    'all' => 'member'
                ),
            )
        )
    )
);
