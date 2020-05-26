<?php

namespace Administracion\Modelo\Entidades;

use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class Chat implements InputFilterAwareInterface {

    private $pk_chat_id;
    private $fk_usuariologin_id;
    private $fk_usuario_id;
    private $mensaje;

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
    function getPk_chat_id() {
        return $this->pk_chat_id;
    }

    function getFk_usuariologin_id() {
        return $this->fk_usuariologin_id;
    }

    function getFk_usuario_id() {
        return $this->fk_usuario_id;
    }

    function getMensaje() {
        return $this->mensaje;
    }

    function setPk_chat_id($pk_chat_id) {
        $this->pk_chat_id = $pk_chat_id;
    }

    function setFk_usuariologin_id($fk_usuariologin_id) {
        $this->fk_usuariologin_id = $fk_usuariologin_id;
    }

    function setFk_usuario_id($fk_usuario_id) {
        $this->fk_usuario_id = $fk_usuario_id;
    }

    function setMensaje($mensaje) {
        $this->mensaje = $mensaje;
    }

}
