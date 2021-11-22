<?php

namespace Administracion\Modelo\Entidades;

use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class UsuarioHuella implements InputFilterAwareInterface {

    private $idUsuario;
    private $idClienteEmpleado;
    private $fecha_creacion;
    private $documentoUsuario;
    private $nombreUsuario;
    private $fechaNacimiento;
    private $imgHuella;
    private $huella;

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
    function getIdUsuario() {
        return $this->idUsuario;
    }

    function getIdClienteEmpleado() {
        return $this->idClienteEmpleado;
    }

    function getFecha_creacion() {
        return $this->fecha_creacion;
    }

    function getDocumentoUsuario() {
        return $this->documentoUsuario;
    }

    function getNombreUsuario() {
        return $this->nombreUsuario;
    }

    function getFechaNacimiento() {
        return $this->fechaNacimiento;
    }

    function getImgHuella() {
        return $this->imgHuella;
    }

    function getHuella() {
        return $this->huella;
    }

    function setIdUsuario($idUsuario) {
        $this->idUsuario = $idUsuario;
    }

    function setIdClienteEmpleado($idClienteEmpleado) {
        $this->idClienteEmpleado = $idClienteEmpleado;
    }

    function setFecha_creacion($fecha_creacion) {
        $this->fecha_creacion = $fecha_creacion;
    }

    function setDocumentoUsuario($documentoUsuario) {
        $this->documentoUsuario = $documentoUsuario;
    }

    function setNombreUsuario($nombreUsuario) {
        $this->nombreUsuario = $nombreUsuario;
    }

    function setFechaNacimiento($fechaNacimiento) {
        $this->fechaNacimiento = $fechaNacimiento;
    }

    function setImgHuella($imgHuella) {
        $this->imgHuella = $imgHuella;
    }

    function setHuella($huella) {
        $this->huella = $huella;
    }

}
