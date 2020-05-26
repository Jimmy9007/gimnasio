<?php

namespace Administracion\Modelo\Entidades;

use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class Usuario implements InputFilterAwareInterface {

    private $pk_usuario_id;
    private $NOM_USU;
    private $APELL_USU;
    private $IDENTIFICACION;
    private $FECHA_NAC_USU;
    private $ocupacion;
    private $CORREO_USU;
    private $TEL_USU;
    private $DIR_USU;
    private $LOGIN;
    private $PASSWORD;
    private $PASSWORDSEGURO;
    private $ESTADO;
    private $TIPO_USUARIO;
    private $SEXO;
    private $condicionFisica;
    private $OBJETIVOS;
    private $rutaFotoPerfil;

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

    function getPk_usuario_id() {
        return $this->pk_usuario_id;
    }

    function getNOM_USU() {
        return $this->NOM_USU;
    }

    function getAPELL_USU() {
        return $this->APELL_USU;
    }

    function getIDENTIFICACION() {
        return $this->IDENTIFICACION;
    }

    function getFECHA_NAC_USU() {
        return $this->FECHA_NAC_USU;
    }

    function getOcupacion() {
        return $this->ocupacion;
    }

    function getCORREO_USU() {
        return $this->CORREO_USU;
    }

    function getTEL_USU() {
        return $this->TEL_USU;
    }

    function getDIR_USU() {
        return $this->DIR_USU;
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

    function getTIPO_USUARIO() {
        return $this->TIPO_USUARIO;
    }

    function getSEXO() {
        return $this->SEXO;
    }

    function getCondicionFisica() {
        return $this->condicionFisica;
    }

    function getOBJETIVOS() {
        return $this->OBJETIVOS;
    }

    function getRutaFotoPerfil() {
        return $this->rutaFotoPerfil;
    }

    function setPk_usuario_id($pk_usuario_id) {
        $this->pk_usuario_id = $pk_usuario_id;
    }

    function setNOM_USU($NOM_USU) {
        $this->NOM_USU = $NOM_USU;
    }

    function setAPELL_USU($APELL_USU) {
        $this->APELL_USU = $APELL_USU;
    }

    function setIDENTIFICACION($IDENTIFICACION) {
        $this->IDENTIFICACION = $IDENTIFICACION;
    }

    function setFECHA_NAC_USU($FECHA_NAC_USU) {
        $this->FECHA_NAC_USU = $FECHA_NAC_USU;
    }

    function setOcupacion($ocupacion) {
        $this->ocupacion = $ocupacion;
    }

    function setCORREO_USU($CORREO_USU) {
        $this->CORREO_USU = $CORREO_USU;
    }

    function setTEL_USU($TEL_USU) {
        $this->TEL_USU = $TEL_USU;
    }

    function setDIR_USU($DIR_USU) {
        $this->DIR_USU = $DIR_USU;
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

    function setTIPO_USUARIO($TIPO_USUARIO) {
        $this->TIPO_USUARIO = $TIPO_USUARIO;
    }

    function setSEXO($SEXO) {
        $this->SEXO = $SEXO;
    }

    function setCondicionFisica($condicionFisica) {
        $this->condicionFisica = $condicionFisica;
    }

    function setOBJETIVOS($OBJETIVOS) {
        $this->OBJETIVOS = $OBJETIVOS;
    }

    function setRutaFotoPerfil($rutaFotoPerfil) {
        $this->rutaFotoPerfil = $rutaFotoPerfil;
    }


}
