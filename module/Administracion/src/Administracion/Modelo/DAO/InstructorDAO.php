<?php

namespace Administracion\Modelo\DAO;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\Expression;
use Zend\Db\Sql\Select;
use Administracion\Modelo\Entidades\Instructor;

class InstructorDAO extends AbstractTableGateway {

    protected $table = 'instructor';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
    }

    public function getInstructores($filtro = '') {
        $instructores = array();
        $select = new Select($this->table);
        $select->columns(array(
            'pk_instructor_id',
            'NOM_INST',
            'APELL_INST',
            'IDENTIFICACION',
            'FECHA_NAC_INST',
            'CORREO_INST',
            'TEL_INST',
            'SEXO_INST',
            'tipoUsuarioPersonal',
            'LOGIN',
            'PASSWORD',
            'PASSWORDSEGURO',
            'ESTADO',
        ));
        if ($filtro != '') {
            $select->where($filtro);
        }
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $instructores[] = new Instructor($dato);
        }
        return $instructores;
    }

    public function getInstructor($idInstructor = 0) {
        return new Instructor($this->select(array('pk_instructor_id' => $idInstructor))->current()->getArrayCopy());
    }

    public function guardar(Instructor $instructorOBJ = null) {
        $idInstructor = (int) $instructorOBJ->getPk_instructor_id();
        if ($idInstructor == 0) {
            return $this->insert($instructorOBJ->getArrayCopy());
        } else {
            if ($this->existeID($idInstructor)) {
                return $this->update($instructorOBJ->getArrayCopy(), array('pk_instructor_id' => $idInstructor));
            } else {
                return 0;
            }
        }
    }

    public function existeID($idInstructor = 0) {
        $id = (int) $idInstructor;
        $rowset = $this->select(array('pk_instructor_id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("EL ID $id NO EXISTE");
        }
        return $row;
    }

//    public function getPreguntasFormularioSeleccionar($filtro = '') {
//        $instructores = array();
//        $select = new Select($this->table);
//        $select->columns(array(
//            'pk_pregunta_id',
//            'pregunta',
//            'tipoPregunta',
//            'clasificacion',
//            'registradoPor',
//            'fechaHoraReg',
//            'estado',
//        ));
//        if ($filtro != '') {
//            $select->where($filtro);
//        }
////        print $select->getSqlString();
//        $datos = $this->selectWith($select)->toArray();
//        foreach ($datos as $dato) {
//            $instructores[] = new Pregunta($dato);
//        }
//        return $instructores;
//    }

    public function getOpcionPregunta($idPregunta = 0) {
        $instructores = array();
        $select = new Select($this->table);
        $select->columns(array(
                    'pk_opcion_id',
                    'opcion',
                    'puntos',
                    'estado',
                    'registradoPor',
                    'fechaHoraReg',
                ))
                ->join('pregunta_opcion', 'pregunta_opcion.fk_opcion_id = opcion.pk_opcion_id', array())
                ->where('pregunta_opcion.fk_pregunta_id = ' . $idPregunta);
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $instructores[] = new Opcion($dato);
        }
        return $instructores;
    }

}
