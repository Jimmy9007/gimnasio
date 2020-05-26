<?php

/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Administracion\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Administracion\Formularios\UsuarioForm;
use Administracion\Modelo\Entidades\Usuario;

class UsuarioController extends AbstractActionController {

    private $usuarioDAO;
    private $medidasDAO;
    private $rutinasDAO;

    public function getUsuarioDAO() {
        if (!$this->usuarioDAO) {
            $sm = $this->getServiceLocator();
            $this->usuarioDAO = $sm->get('Administracion\Modelo\DAO\UsuarioDAO');
        }
        return $this->usuarioDAO;
    }

    public function getMedidasDAO() {
        if (!$this->medidasDAO) {
            $sm = $this->getServiceLocator();
            $this->medidasDAO = $sm->get('Administracion\Modelo\DAO\MedidasDAO');
        }
        return $this->medidasDAO;
    }

    public function getRutinasDAO() {
        if (!$this->rutinasDAO) {
            $sm = $this->getServiceLocator();
            $this->rutinasDAO = $sm->get('Administracion\Modelo\DAO\RutinasDAO');
        }
        return $this->rutinasDAO;
    }

    function getFormulario($action = '', $onsubmit = '', $idUsuario = 0) {
        $required = true;
        if ($action == 'detail' || $action == 'buscar') {
            $required = false;
        }
        $form = new UsuarioForm($action, $onsubmit, $required);
        if ($action == 'edit') {
            $form->get('LOGIN')->setAttribute('readonly', true);
            $form->get('LOGIN')->setAttribute('required', false);
            $form->get('PASSWORD')->setAttribute('readonly', true);
            $form->get('PASSWORD')->setAttribute('required', false);
            $form->get('PASSWORDSEGURO')->setAttribute('readonly', true);
            $form->get('PASSWORDSEGURO')->setAttribute('required', false);
        }
        if ($idUsuario != 0) {
            $usuarioOBJ = $this->getUsuarioDAO()->getUsuario($idUsuario);
            $form->bind($usuarioOBJ);
        }
        return $form;
    }

//------------------------------------------------------------------------------

    public function indexAction() {
//        $filtro = "usuario.estado = 'Eliminado'";
        return new ViewModel(array(
            'usuarios' => $this->getUsuarioDAO()->getUsuarios(),
            'usuariosTotal' => $this->getUsuarioDAO()->getCountUsuarios(),
            'MujeresTotal' => $this->getUsuarioDAO()->getCountMujeres(),
            'HombresTotal' => $this->getUsuarioDAO()->getCountHombres()
        ));
    }

    public function addAction() {
        $action = 'add';
        $onsubmit = 'return confirm("¿ DESEA REGISTRAR ESTE USUARIO ?")';
        $form = $this->getFormulario($action, $onsubmit);
        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $usuarioOBJ = new Usuario($form->getData());
//                $nombreUsuario = '';
//                if ($sesionUsuario = $this->identity()) {
//                    $nombreUsuario = $sesionUsuario->login;
//                }
                $config = $this->getServiceLocator()->get('Config');
                $passwordSeguro = $config['passwordSeguro'];

                $usuarioOBJ->setPASSWORD(md5($passwordSeguro . $usuarioOBJ->getPASSWORD() . $usuarioOBJ->getPASSWORDSEGURO()));
                $usuarioOBJ->setEstado('Activo');
//                $usuarioOBJ->setRegistradoPor($nombreUsuario);
//                $usuarioOBJ->setFechaHoraReg(date('Y-m-d H:i:s'));
                $this->getUsuarioDAO()->guardar($usuarioOBJ);
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'usuario',
                            'action' => 'index',
                ));
            } else {
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'usuario',
                            'action' => 'index',
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/usuario/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function editAction() {
        $idUsuario = (int) $this->params()->fromQuery('idUsuario', 0);
        $action = 'edit';
        $onsubmit = 'return confirm("¿ DESEA GUARDAR ESTE USUARIO ?")';
        $form = $this->getFormulario($action, $onsubmit, $idUsuario);
        $request = $this->getRequest();
        if ($request->isPost()) {
//            $nombreUsuario = '';
//            if ($sesionUsuario = $this->identity()) {
//                $nombreUsuario = $sesionUsuario->login;
//            }
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $usuarioOBJ = new Usuario($form->getData());
//                $nombreUsuario = '';
//                if ($sesionUsuario = $this->identity()) {
//                    $nombreUsuario = $sesionUsuario->login;
//                }
//                $usuarioOBJ->setModificadoPor($nombreUsuario);
//                $usuarioOBJ->setFechaHoraMod(date('Y-m-d H:i:s'));

                $this->getUsuarioDAO()->guardar($usuarioOBJ);
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'usuario',
                            'action' => 'index',
                ));
            } else {
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'usuario',
                            'action' => 'index',
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/usuario/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function detailAction() {
        $idUsuario = (int) $this->params()->fromQuery('idUsuario', 0);
        $action = 'detail';
        $onsubmit = 'return false';
        $form = $this->getFormulario($action, $onsubmit, $idUsuario);
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/usuario/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function seleccionarUsuarioAction() {
        $filtro = "usuario.estado = 'Activo'";
        $view = new ViewModel(array(
            'usuarios' => $this->getUsuarioDAO()->getUsuarios($filtro),
        ));
        $view->setTerminal(true);
        return $view;
    }

    public function seleccionarUsuarioMensualidadAction() {
        $filtro = "usuario.pk_usuario_id NOT IN (SELECT mensualidad.fk_usuario_id FROM mensualidad)";
        $view = new ViewModel(array(
            'usuarios' => $this->getUsuarioDAO()->getUsuarios($filtro),
        ));
        $view->setTerminal(true);
        return $view;
    }

    public function getUsuarioAction() {
        $idUsuario = (int) $this->params()->fromQuery('idUsuario', 0);
        if (!$idUsuario) {
            return 0;
        }

        $form = $this->getFormulario('buscar', '', $idUsuario);
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/usuario/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function getDetalleUsuarioAction() {
        $idUsuario = (int) $this->params()->fromPost('idUsuario', 0);
        $idUsuario;
        $sl = $this->getUsuarioDAO()->getDetalleUsuario($idUsuario);
//        var_dump("".$sl->getSEXO());
        $view = new ViewModel(array(
            'usuario' => $this->getUsuarioDAO()->getDetalleUsuario($idUsuario)
        ));
        $view->setTerminal(true);
        return $view;
    }

    public function getMedidasUsuarioAction() {
        $idUsuario = (int) $this->params()->fromPost('idUsuario', 0);
        $idUsuario;
        $sl = $this->getUsuarioDAO()->getMedidasUsuario($idUsuario);
        $view = new ViewModel(array(
            'usuario' => $this->getUsuarioDAO()->getMedidasUsuario($idUsuario)
        ));
        $view->setTerminal(true);
        return $view;
    }

}
