<?php

/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Administracion;

return array(
    'router' => array(
        'routes' => array(
            // The following is a route to simplify getting started creating
            // new controllers and actions without needing to create a new
            // module. Simply drop new controllers in, and you can access them
            // using the path /application/:controller/:action
            'administracion' => array(
                'type' => 'Literal',
                'options' => array(
                    'route' => '/administracion',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Administracion\Controller',
                        'controller' => 'Administracion',
                        'action' => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/:controller/:action[/:id1][/:id2][/:id3]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id1' => '[a-zA-Z0-9_-]*',
                                'id2' => '[a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
    'service_manager' => array(
        'abstract_factories' => array(
            'Zend\Cache\Service\StorageCacheAbstractServiceFactory',
            'Zend\Log\LoggerAbstractServiceFactory',
        ),
        'factories' => array(
            'translator' => 'Zend\Mvc\Service\TranslatorServiceFactory',
        ),
    ),
    'translator' => array(
        'locale' => 'en_US',
        'translation_file_patterns' => array(
            array(
                'type' => 'gettext',
                'base_dir' => __DIR__ . '/../language',
                'pattern' => '%s.mo',
            ),
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Administracion\Controller\Index' => 'Administracion\Controller\IndexController',
            'Administracion\Controller\Usuario' => 'Administracion\Controller\UsuarioController',
            'Administracion\Controller\Medidas' => 'Administracion\Controller\MedidasController',
            'Administracion\Controller\Mensualidad' => 'Administracion\Controller\MensualidadController',
            'Administracion\Controller\Clienteempleado' => 'Administracion\Controller\ClienteempleadoController',
            'Administracion\Controller\Rol' => 'Administracion\Controller\RolController',
            'Administracion\Controller\Turno' => 'Administracion\Controller\TurnoController',
            'Administracion\Controller\Rutinas' => 'Administracion\Controller\RutinasController',
            'Administracion\Controller\UsuarioRutinas' => 'Administracion\Controller\UsuarioRutinasController',
            'Administracion\Controller\Asistencia' => 'Administracion\Controller\AsistenciaController',
            'Administracion\Controller\Ejercicios' => 'Administracion\Controller\EjerciciosController',
            'Administracion\Controller\Entreno' => 'Administracion\Controller\EntrenoController',
            'Administracion\Controller\Personalizado' => 'Administracion\Controller\PersonalizadoController',
            'Administracion\Controller\Producto' => 'Administracion\Controller\ProductoController',
            'Administracion\Controller\Venta' => 'Administracion\Controller\VentaController',
            'Administracion\Controller\ProbaLluvia' => 'Administracion\Controller\ProbaLluviaController',
            'Administracion\Controller\Perfil' => 'Administracion\Controller\PerfilController',
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
        'strategies' => array(
            'ViewJsonStrategy',
        ),
    ),
    // Placeholder for console routes
    'console' => array(
        'router' => array(
            'routes' => array(
            ),
        ),
    ),
);
