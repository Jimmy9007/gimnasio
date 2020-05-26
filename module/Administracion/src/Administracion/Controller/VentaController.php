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
use Administracion\Formularios\VentaForm;
use Administracion\Modelo\Entidades\Venta;

class VentaController extends AbstractActionController {

    private $ventaDAO;
    private $productoDAO;

    public function getVentaDAO() {
        if (!$this->ventaDAO) {
            $sm = $this->getServiceLocator();
            $this->ventaDAO = $sm->get('Administracion\Modelo\DAO\VentaDAO');
        }
        return $this->ventaDAO;
    }

    public function getProductoDAO() {
        if (!$this->productoDAO) {
            $sm = $this->getServiceLocator();
            $this->productoDAO = $sm->get('Administracion\Modelo\DAO\productoDAO');
        }
        return $this->usuarioDAO;
    }

    function getFormulario($action = '', $onsubmit = '', $idVenta = 0) {
        $required = true;
        if ($action == 'detail' || $action == 'buscar') {
            $required = false;
        }
        $form = new VentaForm($action, $onsubmit, $required);
        if ($idVenta != 0) {
            $ventaOBJ = $this->getVentaDAO()->getVenta($idVenta);
            $form->bind($ventaOBJ);
        }
        return $form;
    }

//------------------------------------------------------------------------------

    public function indexAction() {
        return new ViewModel(array(
            'venta' => $this->getVentaDAO()->getVentas()
        ));
    }

    public function addAction() {
        $action = 'add';
        $onsubmit = 'return confirm("¿ DESEA REGISTRAR ESTA VENTA ?")';
        $form = $this->getFormulario($action, $onsubmit);
        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $ventaOBJ = new Venta($form->getData());
                $ventaOBJ->setFechaVenta(date('Y-m-d H:i:s'));
                $ventaOBJ->setCantidadVenta(0);
                $ventaOBJ->setValorTotal(0);
                $ventaOBJ->setGanancia(0);
                $this->getVentaDAO()->guardar($ventaOBJ);
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'venta',
                            'action' => 'index',
                ));
            } else {
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'venta',
                            'action' => 'index',
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/venta/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function anexarArticuloAction() {
        $idVenta = (int) $this->params()->fromRoute('id1', 0);
        if ($idVenta == 0) {
            return $this->redirect()->toRoute('administracion/default', array(
                        'controller' => 'venta',
                        'action' => 'anexarArticulo',
            ));
        }
        $action = 'detail';
        $onsubmit = 'return false';
        $form = $this->getFormulario($action, $onsubmit, $idVenta);
        $view = new ViewModel(array(
            'form' => $form,
            'productos' => $this->getVentaDAO()->getProductosVentas($idVenta),
        ));
        return $view;
    }

    public function setProductoVentaAction() {
        $request = $this->getRequest();
        if ($request->isPost()) {
            $datos = $request->getPost()->toArray();
            $this->getVentaDAO()->anexarProducto($datos);
            return $this->redirect()->toRoute('administracion/default', array(
                        'controller' => 'venta',
                        'action' => 'anexarArticulo',
                        'id1' => $datos['idVentaSelect'],
            ));
        }
        return $this->redirect()->toRoute('administracion/default', array(
                    'controller' => 'venta',
                    'action' => 'anexarArticulo',
        ));
    }

    public function addCarritoAction() {
        $idProducto = (int) $this->params()->fromQuery('idProducto', 0);
        $idVenta = (int) $this->params()->fromQuery('idVenta', 0);
        $cantidad = (int) $this->params()->fromQuery('cantidad', 0);
        $valorTotal = (int) $this->params()->fromQuery('valorTotal', 0);
        $form = $this->getFormulario($idProducto, $cantidad, $valorTotal, $idVenta);
        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $ventaOBJ = new Venta($form->getData());
                $this->getVentaDAO()->anexarProducto($ventaOBJ);
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'venta',
                            'action' => 'index',
                ));
            } else {
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'venta',
                            'action' => 'index',
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'productos' => $this->getVentaDAO()->getProductosVentas($idVenta),
        ));
        $view->setTemplate('administracion/venta/formulario_1');
        $view->setTerminal(true);
        return $view;
    }

    public function editAction() {
        $idVenta = (int) $this->params()->fromQuery('idVenta', 0);
        $action = 'edit';
        $onsubmit = 'return confirm("¿ DESEA GUARDAR ESTE VENTA ?")';
        $form = $this->getFormulario($action, $onsubmit, $idVenta);
        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $ventaOBJ = new Venta($form->getData());
//                $ventaOBJ->setFechahoramod(date('Y-m-d H:i:s'));
                $this->getVentaDAO()->guardar($ventaOBJ);
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'venta',
                            'action' => 'index',
                ));
            } else {
                return $this->redirect()->toRoute('administracion/default', array(
                            'controller' => 'venta',
                            'action' => 'index',
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'productos' => $this->getVentaDAO()->getProductosVentas($idVenta),
        ));
        $view->setTemplate('administracion/venta/formulario_1');
        $view->setTerminal(true);
        return $view;
    }

    public function detailAction() {
        $idVenta = (int) $this->params()->fromQuery('idVenta', 0);
        $action = 'detail';
        $onsubmit = 'return false';
        $form = $this->getFormulario($action, $onsubmit, $idVenta);
        $view = new ViewModel(array(
            'form' => $form
        ));
        $view->setTemplate('administracion/venta/formulario');
        $view->setTerminal(true);
        return $view;
    }

    public function deleteAction() {
        $request = $this->getRequest();
        $response = $this->getResponse();
        if ($request->isPost()) {
            $idVenta = (int) $this->params()->fromPost('idVenta', 0);
            $resultado = $this->getVentaDAO()->eliminar($idVenta);
            $response->setContent(Json::encode(array('eliminado' => $resultado)));
        }
        return $response;
    }

    public function anexarProductoAction() {
        $idProducto = (int) $this->params()->fromQuery('idProducto', 0);
        $productoOBJ = $this->getProductoDAO()->getProductos('pk_producto_id=' . $idProducto);

        $form = new ventaForm();
        $form->get('fk_producto_id')->setValue($productoOBJ[0]->getPk_producto_id());


        $view = new ViewModel(array(
            'form' => $form,
        ));
        $view->setTerminal(TRUE);
        return $view;
    }

}
