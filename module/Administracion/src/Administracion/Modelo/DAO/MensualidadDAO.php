<?php

namespace Administracion\Modelo\DAO;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\Expression;
use Zend\Db\Sql\Select;
use Administracion\Modelo\Entidades\Mensualidad;
use Administracion\Modelo\Entidades\Usuario;
use Administracion\Modelo\Entidades\ReporteMensualidad;
use Administracion\Modelo\Entidades\Clienteempleado;

class MensualidadDAO extends AbstractTableGateway {

    protected $table = 'mensualidad';
    protected $table2 = 'reportemensualidad';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
    }

    public function getMensualidades($filtro = '') {
        $mensualidades = array();
        $select = new Select($this->table);
        $select->columns(array(
            'pk_mensualidad_id',
            'fk_usuario_id',
            'FECHA_MENS',
            'FECHA_MENS_FIN',
            'valor',
            'diasPreaviso' => new Expression('DATEDIFF(mensualidad.FECHA_MENS_FIN, CURDATE())'),
            'enivarPreaviso' => new Expression('DATEDIFF(mensualidad.fechaUltPreaviso, mensualidad.FECHA_MENS_FIN)'),
            'fechaUltPreaviso',
        ));
        $select->join('usuario', 'usuario.pk_usuario_id = mensualidad.fk_usuario_id', array(
            'pk_usuario_id',
            'fk_clienteempleado_id',
            'nombreApellido',
            'genero',
        ));
        $select->join('clienteempleado', 'clienteempleado.pk_clienteempleado_id = usuario.fk_clienteempleado_id', array(
            'pk_clienteempleado_id',
            'nombre',
            'apellido',
            'identificacion',
            'genero',
        ));
        if ($filtro != '') {
            $select->where($filtro);
        }
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $mensualidadUsuario = array(
                'usuarioOBJ' => new Usuario($dato),
                'mensualidadOBJ' => new Mensualidad($dato),
                'clienteempleadoOBJ' => new Clienteempleado($dato),
                'diasPreaviso' => $dato['diasPreaviso'],
                'enivarPreaviso' => $dato['enivarPreaviso'],
            );
            $mensualidades[] = $mensualidadUsuario;
        }
        return $mensualidades;
    }

    public function getReporteMensualidad($filtro = '') {
        $ReporteMensualidad = array();
        $select = new Select($this->table2);
        $select->columns(array(
            'pk_reporte_id',
            'fechaReporte',
            'fechaFinReporte',
            'valorReporte',
            'fk_mensualidad_id',
        ));
        $select->join('mensualidad', 'mensualidad.pk_mensualidad_id = reportemensualidad.fk_mensualidad_id', array(
            'pk_mensualidad_id',
            'FECHA_MENS',
            'FECHA_MENS_FIN',
            'valor',
            'fechaUltPreaviso',
            'fk_usuario_id',
        ));
        $select->join('usuario', 'usuario.pk_usuario_id = mensualidad.fk_usuario_id', array(
            'pk_usuario_id',
            'fk_clienteempleado_id',
            'nombreApellido',
            'genero',
        ));
        $select->join('clienteempleado', 'clienteempleado.pk_clienteempleado_id = usuario.fk_clienteempleado_id', array(
            'pk_clienteempleado_id',
            'nombre',
            'apellido',
            'identificacion',
            'genero',
        ));

        if ($filtro != '') {
            $select->where($filtro);
        }
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $ReporteMensual = array(
                'usuarioOBJ' => new Usuario($dato),
                'clienteempleadoOBJ' => new Clienteempleado($dato),
                'mensualidadOBJ' => new Mensualidad($dato),
                'reporteOBJ' => new ReporteMensualidad($dato),
            );
            $ReporteMensualidad[] = $ReporteMensual;
        }
        return $ReporteMensualidad;
    }

    public function getReporteMensualidad2($filtro = '') {
        $ReporteMensualidad = array();
        $select = new Select($this->table2);
        $select->columns(array(
            'pk_reporte_id',
            'fechaReporte',
            'fechaFinReporte',
            'valorReporte',
            'fk_mensualidad_id',
            'mes' => new Expression('month(fechaReporte)'),
        ));
        $select->join('mensualidad', 'mensualidad.pk_mensualidad_id = reportemensualidad.fk_mensualidad_id', array(
            'pk_mensualidad_id',
            'fk_usuario_id',
            'FECHA_MENS',
            'FECHA_MENS_FIN',
            'valor',
            'fechaUltPreaviso',
        ));
        $select->join('usuario', 'usuario.pk_usuario_id = mensualidad.fk_usuario_id', array(
            'pk_usuario_id',
            'fk_clienteempleado_id',
            'nombreApellido',
            'genero',
        ));
        $select->join('clienteempleado', 'clienteempleado.pk_clienteempleado_id = usuario.fk_clienteempleado_id', array(
            'pk_clienteempleado_id',
            'nombre',
            'apellido',
            'identificacion',
            'genero',
        ));
        if ($filtro != '') {
            $select->where($filtro);
        }
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $ReporteMensual = array(
                'reporteOBJ' => new ReporteMensualidad($dato),
                'usuarioOBJ' => new Usuario($dato),
                'clienteempleadoOBJ' => new Clienteempleado($dato),
                'mensualidadOBJ' => new Mensualidad($dato),
                'mes' => $dato['mes'],
            );
            $ReporteMensualidad[] = $ReporteMensual;
        }
        return $ReporteMensualidad;
    }

    public function getMensualidadeUsuario($filtro = '') {
        $mensualidades = array();
        $select = new Select($this->table);
        $select->columns(array(
            'pk_mensualidad_id',
            'fk_usuario_id',
            'FECHA_MENS',
            'FECHA_MENS_FIN',
            'valor',
            'diasPreaviso' => new Expression('DATEDIFF(mensualidad.FECHA_MENS_FIN, CURDATE())'),
            'enivarPreaviso' => new Expression('DATEDIFF(mensualidad.fechaUltPreaviso, mensualidad.FECHA_MENS_FIN)'),
            'fechaUltPreaviso',
        ));
        $select->join('usuario', 'usuario.pk_usuario_id = mensualidad.fk_usuario_id', array(
            'pk_usuario_id',
            'nombreApellido',
            'genero',
        ))->where(array('pk_usuario_id' => $filtro));
        if ($filtro != '') {
            $select->where($filtro);
        }
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $mensualidadUsuario = array(
                'usuarioOBJ' => new Usuario($dato),
                'mensualidadOBJ' => new Mensualidad($dato),
                'diasPreaviso' => $dato['diasPreaviso'],
                'enivarPreaviso' => $dato['enivarPreaviso'],
            );
            $mensualidades[] = $mensualidadUsuario;
        }
        return $mensualidades;
    }

    public function getMensualidad($pk_mensualidad_id = 0) {
        return new Mensualidad($this->select(array('pk_mensualidad_id' => $pk_mensualidad_id))->current()->getArrayCopy());
    }

    public function guardar(Mensualidad $mensualidadOBJ = null) {
        $idMensualidad = (int) $mensualidadOBJ->getpk_mensualidad_id();
        if ($idMensualidad == 0) {
            return $this->insert($mensualidadOBJ->getArrayCopy());
        } else {
            if ($this->existeID($idMensualidad)) {
                return $this->update($mensualidadOBJ->getArrayCopy(), array('pk_mensualidad_id' => $idMensualidad));
            } else {
                return 0;
            }
        }
    }

    public function existeID($idMensualidad = 0) {
        $id = (int) $idMensualidad;
        $rowset = $this->select(array('pk_mensualidad_id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("EL ID $id NO EXISTE");
        }
        return $row;
    }

    public function setFechaUltPreaviso($idMensualidad = 0) {
        return $this->update(array('fechaUltPreaviso' => date('Y-m-d H:i:s')), array('pk_mensualidad_id' => (int) $idMensualidad));
    }

//------------------------------------------------------------------------------
    public function getTotalMensualidadByFechas($fechaini = '0000-00-00', $fechafin = '0000-00-00') {
        $this->table = 'reportemensualidad';
        $select = array();
        $select = new Select($this->table);
        $select->columns(array(
            'total' => new Expression('SUM(valorReporte)'),
        ))->where("DATE(fechaReporte) >= '$fechaini' AND DATE(fechaReporte) < '$fechafin'");
        $datos = $this->selectWith($select)->toArray();
        return $datos[0]['total'];
    }

    public function getTotalVentaByFechas($fechaini = '0000-00-00', $fechafin = '0000-00-00') {
        $this->table = 'venta';
        $select = array();
        $select = new Select($this->table);
        $select->columns(array(
            'total' => new Expression('SUM(valorTotal)'),
        ))->where("DATE(fechaVenta) >= '$fechaini' AND DATE(fechaVenta) < '$fechafin'");
        $datos = $this->selectWith($select)->toArray();
        return $datos[0]['total'];
    }

}
