<?php

namespace Administracion\Modelo\Entidades;

use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class Instructor implements InputFilterAwareInterface {

    private $pk_instructor_id;
    private $NOM_INST;
    private $APELL_INST;
    private $IDENTIFICACION;
    private $FECHA_NAC_INST;
    private $CORREO_INST;
    private $TEL_INST;
    private $SEXO_INST;
    private $tipoUsuarioPersonal;
    private $LOGIN;
    private $PASSWORD;
    private $PASSWORDSEGURO;
    private $ESTADO;

    public function __construct(array $datos = null) {
        if (is_array($datos)) {
            $this->exchangeArray($datos);
        }
    }

    public function setInputFilter(InputFilterInterface $inputFilter) {
        throw new \Exception("Not used");
    }

    public function getArrayCopy() {
        return get_object_vars($this);
    }

    public function getInputFilter() {
        
    }

    public function exchangeArray($data) {
        $metodos = get_class_methods($this);
        foreach ($data as $key => $value) {
            $metodo = 'set' . ucfirst($key);
            if (in_array($metodo, $metodos)) {
                $this->$metodo($value);
            }
        }
    }

//------------------------------------------------------------------------------
    function getPk_instructor_id() {
        return $this->pk_instructor_id;
    }

    function getNOM_INST() {
        return $this->NOM_INST;
    }

    function getAPELL_INST() {
        return $this->APELL_INST;
    }

    function getIDENTIFICACION() {
        return $this->IDENTIFICACION;
    }

    function getFECHA_NAC_INST() {
        return $this->FECHA_NAC_INST;
    }

    function getCORREO_INST() {
        return $this->CORREO_INST;
    }

    function getTEL_INST() {
        return $this->TEL_INST;
    }

    function getSEXO_INST() {
        return $this->SEXO_INST;
    }

    function getTipoUsuarioPersonal() {
        return $this->tipoUsuarioPersonal;
    }

    function getLOGIN() {
        return $this->LOGIN;
    }

    function getPASSWORD() {
        return $this->PASSWORD;
    }

    function getPASSWORDSEGURO() {
        return $this->PASSWORDSEGURO;
    }

    function getESTADO() {
        return $this->ESTADO;
    }

    function setPk_instructor_id($pk_instructor_id) {
        $this->pk_instructor_id = $pk_instructor_id;
    }

    function setNOM_INST($NOM_INST) {
        $this->NOM_INST = $NOM_INST;
    }

    function setAPELL_INST($APELL_INST) {
        $this->APELL_INST = $APELL_INST;
    }

    function setIDENTIFICACION($IDENTIFICACION) {
        $this->IDENTIFICACION = $IDENTIFICACION;
    }

    function setFECHA_NAC_INST($FECHA_NAC_INST) {
        $this->FECHA_NAC_INST = $FECHA_NAC_INST;
    }

    function setCORREO_INST($CORREO_INST) {
        $this->CORREO_INST = $CORREO_INST;
    }

    function setTEL_INST($TEL_INST) {
        $this->TEL_INST = $TEL_INST;
    }

    function setSEXO_INST($SEXO_INST) {
        $this->SEXO_INST = $SEXO_INST;
    }

    function setTipoUsuarioPersonal($tipoUsuarioPersonal) {
        $this->tipoUsuarioPersonal = $tipoUsuarioPersonal;
    }

    function setLOGIN($LOGIN) {
        $this->LOGIN = $LOGIN;
    }

    function setPASSWORD($PASSWORD) {
        $this->PASSWORD = $PASSWORD;
    }

    function setPASSWORDSEGURO($PASSWORDSEGURO) {
        $this->PASSWORDSEGURO = $PASSWORDSEGURO;
    }

    function setESTADO($ESTADO) {
        $this->ESTADO = $ESTADO;
    }


}
