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
use Administracion\Formularios\InstructorForm;
use Administracion\Modelo\Entidades\Instructor;

class InstructorController extends AbstractActionController {

    private $instructorDAO;

    public function getInstructorDAO() {
        if (!$this->instructorDAO) {
            $sm = $this->getServiceLocator();
            $this->instructorDAO = $sm->get('Administracion\Modelo\DAO\InstructorDAO');
        }
        return $this->instructorDAO;
    }

    function getFormulario($action = '', $onsubmit = '', $idInstructor = 0) {
        $required = true;
        if ($action == 'detail' || $action == 'buscar') {
            $required = false;
        }
        $form = new InstructorForm($action, $onsubmit, $required);
        if ($action == 'edit') {
            $form->get('LOGIN')->setAttribute('readonly', true);
            $form->get('LOGIN')->setAttribute('required', false);
            $form->get('PASSWORD')->setAttribute('readonly', true);
            $form->get('PASSWORD')->setAttribute('required', false);
            $form->get('PASSWORDSEGURO')->setAttribute('readonly', true);
            $form->get('PASSWORDSEGURO')->setAttribute('required', false);
        }
        if ($idInstructor != 0) {
            $instructorOBJ = $this->getInstructorDAO()->getInstructor($idInstructor);
            $form->bind($instructorOBJ);
        }
        return $form;
    }

//------------------------------------------------------------------------------

    public function indexAction() {
//        $filtro = "instructor.estado = 'Eliminado'";
        return new ViewModel(array(
            'instructores' => $this->getInstructorDAO()->getInstructores()
        ));
    }

    public function addAction() {
        $action = 'add';
        $onsubmit = 'return confirm("¿ DESEA REGISTRAR ESTE INSTRUCTOR ?")';
        $form = $this->getFormulario($action, $onsubmit);
        $request = $this->getRequest();
        if ($request->isPost()) {
//            $nombreInstructor = '';
//            if ($sesionInstructor = $this->identity()) {
//                $nombreInstructor = $sesionInstructor->login;
//            }
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $instructorOBJ = new Instructor($form->getData());
//                $nombreInstructor = '';
//                if ($sesionInstructor = $this->identity()) {
//                    $nombreInstructor = $sesionInstructor->login;
//                }
                $config = $this->getServiceLocator()->get('Config');
                $passwordSeguro = $config['passwordSeguro'];
                $instructorOBJ->setPASSWORD(md5($passwordSeguro . $instructorOBJ->getPASSWORD() . $instructorOBJ->getPASSWORDSEGURO()));
                $instructorOBJ->setEstado('Activo');
//                $instructorOBJ->setEstado('Activo');
//                $instructorOBJ->setRegistradoPor($nombreInstructor);
//                $instructorOBJ->setFechaHoraReg(date('Y-m-d H:i:s'));
//                $instructorOBJ->setModificadoPor('');
//                $instructorOBJ->setFechaHoraMod('0000-00-00 00:00:00');
                $this->getInstructorDAO()->guardar($instructorOBJ);
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'instructor',
                            'action' => 'index',
                ));
            } else {
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'instructor',
                            'action' => 'index',
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/instructor/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function editAction() {
        $idInstructor = (int) $this->params()->fromQuery('idInstructor', 0);
        $action = 'edit';
        $onsubmit = 'return confirm("¿ DESEA GUARDAR ESTE USUARIO ?")';
        $form = $this->getFormulario($action, $onsubmit, $idInstructor);
        $request = $this->getRequest();
        if ($request->isPost()) {
//            $nombreInstructor = '';
//            if ($sesionInstructor = $this->identity()) {
//                $nombreInstructor = $sesionInstructor->login;
//            }
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $instructorOBJ = new Instructor($form->getData());
//                $nombreInstructor = '';
//                if ($sesionInstructor = $this->identity()) {
//                    $nombreInstructor = $sesionInstructor->login;
//                }
//                $instructorOBJ->setModificadoPor($nombreInstructor);
//                $instructorOBJ->setFechaHoraMod(date('Y-m-d H:i:s'));

                $this->getInstructorDAO()->guardar($instructorOBJ);
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'instructor',
                            'action' => 'index',
                ));
            } else {
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'instructor',
                            'action' => 'index',
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/instructor/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function detailAction() {
        $idInstructor = (int) $this->params()->fromQuery('idInstructor', 0);
        $action = 'detail';
        $onsubmit = 'return false';
        $form = $this->getFormulario($action, $onsubmit, $idInstructor);
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/instructor/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function seleccionarInstructorAction() {
        $view = new ViewModel(array(
            'instructores' => $this->getInstructorDAO()->getInstructores()
        ));
        $view->setTerminal(true);
        return $view;
    }

    public function getInstructorAction() {
        $idInstructor = (int) $this->params()->fromQuery('idInstructor', 0);
        if (!$idInstructor) {
            return 0;
        }
        $form = $this->getFormulario('buscar', '', $idInstructor);
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/instructor/formulario');
        $view->setTerminal(true);
        return $view;
    }

}
