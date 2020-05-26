<?php

namespace Administracion\Modelo\DAO;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\Expression;
use Zend\Db\Sql\Select;
use Administracion\Modelo\Entidades\Usuario;
use Administracion\Modelo\Entidades\Chat;
use Administracion\Modelo\Entidades\Medidas;

class ChatDAO extends AbstractTableGateway {

    protected $table = 'usuario';
    protected $table2 = 'chat';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
    }

    public function getUsuarios($filtro = '') {
        $usuarios = array();
        $select = new Select($this->table);
        $select->columns(array(
            'pk_usuario_id',
            'NOM_USU',
            'APELL_USU',
            'IDENTIFICACION',
            'FECHA_NAC_USU',
            'ocupacion',
            'CORREO_USU',
            'TEL_USU',
            'DIR_USU',
            'LOGIN',
            'PASSWORD',
            'PASSWORDSEGURO',
            'ESTADO',
            'TIPO_USUARIO',
            'SEXO',
            'condicionFisica',
            'OBJETIVOS',
            'rutaFotoPerfil',
        ));
        if ($filtro != '') {
            $select->where($filtro);
        }
//        print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $usuarios[] = new Usuario($dato);
        }
        return $usuarios;
    }

    public function getCountUsuarios() {
        $select = array();
        $select = new Select($this->table);
        $select->columns(array(
            'totalUser' => new Expression('count(pk_usuario_id)'),
        ));
        $datos = $this->selectWith($select)->toArray();
        return $datos[0]['totalUser'];
    }

    public function getCountMujeres() {
        $select = array();
        $select = new Select($this->table);
        $select->columns(array(
            'SEXO',
            'totalMujeres' => new Expression('COUNT(SEXO)'),
        ))->where("SEXO = 'Femenino'");
        $datos = $this->selectWith($select)->toArray();
        return $datos[0]['totalMujeres'];
    }

    public function getCountHombres() {
        $select = array();
        $select = new Select($this->table);
        $select->columns(array(
            'SEXO',
            'totalHombres' => new Expression('COUNT(SEXO)'),
        ))->where("SEXO = 'Masculino'");
        $datos = $this->selectWith($select)->toArray();
        return $datos[0]['totalHombres'];
    }

    public function getDetalleUsuario($id = 0) {
        $Usuarios = null;
        $select = new Select($this->table);
        $select->columns(array(
                    'pk_usuario_id',
                    'NOM_USU',
                    'APELL_USU',
                    'IDENTIFICACION',
                    'FECHA_NAC_USU',
                    'ocupacion',
                    'CORREO_USU',
                    'TEL_USU',
                    'DIR_USU',
                    'LOGIN',
                    'PASSWORD',
                    'PASSWORDSEGURO',
                    'ESTADO',
                    'TIPO_USUARIO',
                    'SEXO',
                    'condicionFisica',
                    'OBJETIVOS',
                ))
                ->where(array('pk_usuario_id' => $id))
                ->limit(1);
        // print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $Usuarios = new Usuario($dato);
        }
        return $Usuarios;
    }

    public function getMedidasUsuario($id = "") {
        $Usuarios = array();
        $select = new Select($this->table);
        $select->columns(array(
            'pk_usuario_id',
            'NOM_USU',
            'APELL_USU',
            'IDENTIFICACION',
            'FECHA_NAC_USU',
            'ocupacion',
            'CORREO_USU',
            'TEL_USU',
            'DIR_USU',
            'LOGIN',
            'PASSWORD',
            'PASSWORDSEGURO',
            'ESTADO',
            'TIPO_USUARIO',
            'SEXO',
            'condicionFisica',
            'OBJETIVOS',
        ));
        $select->join('medidas', 'medidas.fk_usuario_id = usuario.pk_usuario_id', array(
            'pk_medida_id',
            'fechaMedias' => new Expression('DATE_FORMAT(FECHA_MED_USU, "%Y%m%d")'),
            'PGC',
            'IMC',
            'ESTATURA',
            'PESO',
            'PECHO',
            'BICEPS',
            'HOMBRO',
            'ANTEBRAZO',
            'CINTURA',
            'CADERA',
            'PIERNA',
            'PANTORRILLA',
            'porGrasa',
        ));
        if ($id != '') {
            $select->where(array('pk_usuario_id' => $id))
            ->limit(1);
        }
//         print $select->getSqlString();//imprime la consulta sql
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $medidaUsuario = array(
                'usuarioOBJ' => new Usuario($dato),
                'medidasOBJ' => new Medidas($dato),
                'fechaMedias' => $dato['fechaMedias'],
            );
            $Usuarios[] = $medidaUsuario;
        }
        return $Usuarios;
    }

    public function getPerfilUsuario($filtro = '') {
        $usuario = array();
        $select = new Select($this->table);
        $select->columns(array(
            'pk_usuario_id',
            'NOM_USU',
            'APELL_USU',
            'IDENTIFICACION',
            'FECHA_NAC_USU',
            'ocupacion',
            'CORREO_USU',
            'TEL_USU',
            'DIR_USU',
            'LOGIN',
            'PASSWORD',
            'PASSWORDSEGURO',
            'ESTADO',
            'TIPO_USUARIO',
            'SEXO',
            'condicionFisica',
            'OBJETIVOS',
            'rutaFotoPerfil',
        ))->where(array('pk_usuario_id' => $filtro));
        if ($filtro != '') {
            $select->where($filtro);
        }
        //print $select->getSqlString();
        $datos = $this->selectWith($select)->toArray();
        foreach ($datos as $dato) {
            $perfilUsuario = array(
                'usuarioOBJ' => new Usuario($dato),
            );
            $usuario[] = $perfilUsuario;
        }
        return $usuario;
    }

    public function getUsuario($pk_usuario_id = 0) {
        return new Usuario($this->select(array('pk_usuario_id' => $pk_usuario_id))->current()->getArrayCopy());
    }

    public function guardar(Usuario $usuarioOBJ = null) {
        $idUsuario = (int) $usuarioOBJ->getPk_usuario_id();
        if ($idUsuario == 0) {
            return $this->insert($usuarioOBJ->getArrayCopy());
        } else {
            if ($this->existeID($idUsuario)) {
                return $this->update($usuarioOBJ->getArrayCopy(), array('pk_usuario_id' => $idUsuario));
            } else {
                return 0;
            }
        }
    }

    public function existeID($idUsuario = 0) {
        $id = (int) $idUsuario;
        $rowset = $this->select(array('pk_usuario_id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("EL ID $id NO EXISTE");
        }
        return $row;
    }

}
