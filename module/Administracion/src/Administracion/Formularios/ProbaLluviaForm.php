<?php

namespace Administracion\Formularios;

use Zend\Form\Element;
use Zend\Form\Form;

class ProbaLluviaForm extends Form {

    public function __construct($action = '', $onsubmit = '', $required = true) {
        parent::__construct('formProbaLluvia');
        $this->setAttribute('method', 'post');
        $this->setAttribute('data-toggle', 'validator');
        $this->setAttribute('role', 'form');
        $this->setAttribute('class', 'form-horizontal form-label-left');
        $this->setAttribute('action', $action);
        $this->setAttribute('onsubmit', $onsubmit);

        $this->add(array(
            'name' => 'pk_proballuvia_id',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control col-md-7 col-xs-12',
                'readonly' => true,
                'id' => 'pk_proballuvia_id',
            )
        ));
        $this->add(array(
            'name' => 'dias',
            'attributes' => array(
                'type' => 'text',
                'onchange' => 'knnlluvia()',
                'class' => 'form-control col-md-7 col-xs-12',
                'id' => 'dias',
            )
        ));
        $this->add(array(
            'name' => 'lluviosos',
            'attributes' => array(
                'type' => 'text',
                'onchange' => 'knnlluvia()',
                'class' => 'form-control col-md-7 col-xs-12',
                'id' => 'lluviosos',
            )
        ));
        $this->add(array(
            'name' => 'probabilidad',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control col-md-7 col-xs-12',
                'maxlength' => 50,
                'style' => 'text-transform: uppercase',
                'required' => $required,
                'readonly' => true,
                'id' => 'probabilidad',
            )
        ));




//------------------------------------------------------------------------------

        $this->add(array(
            'name' => 'btnCancelar',
            'type' => 'Button',
            'options' => array(
                'label' => 'Cerrar',
            ),
            'attributes' => array(
                'value' => 'Cancelar',
                'class' => 'btn btn-primary',
                'data-dismiss' => 'modal',
                'id' => 'btnCancelar',
            ),
        ));

        $this->add(array(
            'name' => 'btnEnviar',
            'type' => 'submit',
            'attributes' => array(
                'value' => 'Guardar',
                'class' => 'btn btn-success',
                'id' => 'btnEnviar',
            ),
        ));
    }

}
