<?php

namespace Administracion\Modelo\DAO;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\Expression;
use Zend\Db\Sql\Select;
use Administracion\Modelo\Entidades\Venta;
use Administracion\Modelo\Entidades\Producto;
use Administracion\Modelo\Entidades\VentasProductos;

class VentaDAO extends AbstractTableGateway {

    protected $table = 'venta';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
    }

    public function getVentas($filtro = '') {
        $ventas = array();
        $select = new Select($this->table);
        $select->columns(array(
            'pk_venta_id',
            'cantidadVenta',
            'valorTotal',
            'ganancia',
            'fechaVenta',
        ));

        if ($filtro != '') {
            $select->where($filtro);
        }
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $rutinaUsuario = array(
                'ventaOBJ' => new Venta($dato),
            );
            $ventas[] = $rutinaUsuario;
        }
        return $ventas;
    }

    public function getReporteVenta($filtro = '') {
        $ReporteVenta = array();
        $select = new Select($this->table);
        $select->columns(array(
            'pk_venta_id',
            'fk_producto_id',
            'cantidadVenta',
            'valorTotal',
            'ganancia',
            'fechaVenta',
            'mes' => new Expression('month(fechaVenta)'),
        ));
        $select->join('producto', 'producto.pk_producto_id = venta.fk_producto_id', array(
            'pk_producto_id',
            'nombreProducto',
            'descripcion',
            'cantidad',
            'precioCosto',
            'precioVenta',
            'fechaadquisicion',
            'proveedor',
            'numfactura',
            'estado',
            'fechahorareg',
            'fechahoramod',
        ));
        if ($filtro != '') {
            $select->where($filtro);
        }
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $Reporte = array(
                'reporteOBJ' => new Venta($dato),
                'productoOBJ' => new Producto($dato),
                'mes' => $dato['mes'],
            );
            $ReporteVenta[] = $Reporte;
        }
        return $ReporteVenta;
    }

    public function getProductosVentas($idVenta = 0) {
        $productos = array();
        $select = new Select($this->table);
        $select->columns(array(
                    'pk_venta_id',
                    'cantidadVenta',
                    'valorTotal',
                    'ganancia',
                    'fechaVenta',
                ))
                ->join('venta_producto', 'venta_producto.pk_venta_id = venta.pk_venta_id', array(
                    'pk_producto_id',
                    'cantidadVenta',
                    'monto',
                ))->join('producto', 'producto.pk_producto_id = venta_producto.pk_producto_id', array(
                    'pk_producto_id',
                    'codigoBarras',
                    'nombreProducto',
                    'descripcion',
                    'cantidad',
                    'precioCosto',
                    'precioVenta',
                    'fechaadquisicion',
                    'proveedor',
                    'numfactura',
                    'estado',
                    'fechahorareg',
                    'fechahoramod',
                ))
                ->where('venta_producto.pk_venta_id = ' . $idVenta);
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $rutinaUsuario = array(
                'ventaOBJ' => new Venta($dato),
                'productoOBJ' => new Producto($dato),
                'productoVentaOBJ' => new VentasProductos($dato),
            );
            $productos[] = $rutinaUsuario;
        }
        return $productos;
    }

    public function anexarProducto($datos = array()) {
        $this->table = 'venta_producto';

        return $this->insert(array(
                    'pk_venta_id' => $datos['idVentaSelect'],
                    'pk_producto_id' => $datos['pk_producto_id'],
                    'cantidadVenta' => $datos['cantidadVenta'],
                    'monto' => $datos['valorTotal'],
        ));
    }

    public function getVenta($idVenta = 0) {
        return new Venta($this->select(array('pk_venta_id' => $idVenta))->current()->getArrayCopy());
    }

    public function guardar(Venta $ventaOBJ = null) {
        $idVenta = (int) $ventaOBJ->getPk_venta_id();
        if ($idVenta == 0) {
            return $this->insert($ventaOBJ->getArrayCopy());
        } else {
            if ($this->existeID($idVenta)) {
                return $this->update($ventaOBJ->getArrayCopy(), array('pk_venta_id' => $idVenta));
            } else {
                return 0;
            }
        }
    }

    public function existeID($idVenta = 0) {
        $id = (int) $idVenta;
        $rowset = $this->select(array('pk_venta_id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("EL ID $id NO EXISTE");
        }
        return $row;
    }

    public function eliminar($idVenta) {
        $resultado = $this->delete(array("pk_venta_id" => (int) $idVenta));
        return $resultado;
    }

}
