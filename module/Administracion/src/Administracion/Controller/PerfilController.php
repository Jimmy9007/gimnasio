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
use Administracion\Modelo\Entidades\Usuario;
use Administracion\Modelo\Entidades\Chat;
use Administracion\Formularios\UsuarioForm;

class PerfilController extends AbstractActionController {

    private $rutaArchivos = '../gimnasio/public/img/profile';
    private $usuarioDAO;
    private $chatDAO;

    public function getUsuarioDAO() {
        if (!$this->usuarioDAO) {
            $sm = $this->getServiceLocator();
            $this->usuarioDAO = $sm->get('Administracion\Modelo\DAO\UsuarioDAO');
        }
        return $this->usuarioDAO;
    }

    public function getChatDAO() {
        if (!$this->chatDAO) {
            $sm = $this->getServiceLocator();
            $this->chatDAO = $sm->get('Administracion\Modelo\DAO\ChatDAO');
        }
        return $this->chatDAO;
    }

    function getFormulario($action = '', $onsubmit = '', $idPerfil = 0) {
        $required = true;
        if ($action == 'detail' || $action == 'buscar') {
            $required = false;
        }
        $form = new UsuarioForm($action, $onsubmit, $required);
        if ($action == 'edit') {
            $form->get('PASSWORD')->setAttribute('readonly', true);
            $form->get('PASSWORD')->setAttribute('required', false);
            $form->get('PASSWORDSEGURO')->setAttribute('readonly', true);
            $form->get('PASSWORDSEGURO')->setAttribute('required', false);
            $form->get('LOGIN')->setAttribute('readonly', true);
            $form->get('LOGIN')->setAttribute('required', false);
        }
        if ($idPerfil != 0) {
            $perfilOBJ = $this->getUsuarioDAO()->getUsuario($idPerfil);
            $form->bind($perfilOBJ);
        }
        return $form;
    }

//------------------------------------------------------------------------------
    public function indexAction() {
        $idUsuario = '';
        if ($sesionUsuario = $this->identity()) {
            $idUsuario = $sesionUsuario->pk_usuario_id;
        }
        return new ViewModel(array(
            'usuario' => $this->getUsuarioDAO()->getPerfilUsuario($idUsuario)
        ));
    }

    public function perfilesUsuariosAction() {
        return new ViewModel(array(
            'usuarios' => $this->getUsuarioDAO()->getUsuarios()
        ));
    }

    public function chatAction() {
        $idUsuario = (int) $this->params()->fromQuery('idUsuario', 0);
    }

    public function editAction() {
        $idPerfil = (int) $this->params()->fromQuery('idPerfil', 0);
        $action = 'edit';
        $onsubmit = 'return confirm("¿ DESEA GUARDAR ESTE USUARIO ?")';
        $form = $this->getFormulario($action, $onsubmit, $idPerfil);
        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $perfilOBJ = new Usuario($form->getData());
                $files = $request->getFiles()->toArray();
                $httpadapter = new \Zend\File\Transfer\Adapter\Http();
                $filesize = new \Zend\Validator\File\Size(array('max' => 5242880)); //  5 MB
                $extension = new \Zend\Validator\File\Extension(array('extension' => array('gif', 'jpg', 'png', 'jpeg', 'bmp')));
                $httpadapter->setValidators(array($filesize, $extension), $files['rutaFotoPerfil']['name']);
                if ($httpadapter->isValid()) {
                    $httpadapter->setDestination($this->rutaArchivos);
                    $ext = pathinfo($files['rutaFotoPerfil']['name'], PATHINFO_EXTENSION);
                    $archivo = strtoupper(md5(rand() . $files['rutaFotoPerfil']['name'])) . '.' . $ext;
                    $httpadapter->addFilter('File\Rename', array(
                        'target' => $this->rutaArchivos . '/' . $archivo,
                    ));
                    if ($httpadapter->receive($files['rutaFotoPerfil']['name'])) {

                        $perfilOBJ->setrutaFotoPerfil($archivo);
                        if ($this->getUsuarioDAO()->guardar($perfilOBJ) == 0) {
                            unlink($this->rutaArchivos . '/' . $archivo);
                        }
                        return $this->redirect()->toRoute('administracion/default', array(
                                    'controller' => 'perfil',
                                    'action' => 'index',
                        ));
                    }
                } else {

//                   si no guarda la foto hace esto


                    $idUsuario = (int) $this->params()->fromQuery('idUsuario', 0);
                    $action = 'edit';
                    $onsubmit = 'return confirm("¿ DESEA GUARDAR ESTE USUARIO ?")';
                    $form = $this->getFormulario($action, $onsubmit, $idUsuario);
                    $request = $this->getRequest();
                    if ($request->isPost()) {
                        $form->setData($request->getPost());
                        if ($form->isValid()) {
                            $usuarioOBJ = new Usuario($form->getData());
                            if ($usuarioOBJ->getSEXO() == 'Masculino') {
                                $usuarioOBJ->setRutaFotoPerfil('perfilHombre.png');
                            } else {
                                $usuarioOBJ->setRutaFotoPerfil('perfilMujer.png');
                            }

                            $this->getUsuarioDAO()->guardar($usuarioOBJ);
                            return $this->redirect()->toRoute('administracion/default', array(
                                        'controller' => 'perfil',
                                        'action' => 'index',
                            ));
                        } else {
                            return $this->redirect()->toRoute('administracion/default', array(
                                        'controller' => 'perfil',
                                        'action' => 'index',
                            ));
                        }
                    }
                    $view = new ViewModel(array(
                        'form' => $form,
                    ));
                    $view->setTemplate('administracion/usuario/formulario');
                    $view->setTerminal(true);
                    return $view;

//                fin no guarda la foto
                }
            } else {
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'perfil',
                            'action' => 'index',
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
        ));
        $view->setTemplate('administracion/perfil/formulario');
        $view->setTerminal(true);
        return $view;
    }

}
