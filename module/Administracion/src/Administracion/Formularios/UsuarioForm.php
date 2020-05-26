<?php

namespace Administracion\Formularios;

use Zend\Form\Element;
use Zend\Form\Form;

class UsuarioForm extends Form {

    public function __construct($action = '', $onsubmit = '', $required = true) {
        parent::__construct('formUsuario');
        $this->setAttribute('method', 'post');
        $this->setAttribute('data-toggle', 'validator');
        $this->setAttribute('role', 'form');
        $this->setAttribute('class', 'form-horizontal form-label-left');
        $this->setAttribute('enctype', 'multipart/form-data');
        $this->setAttribute('action', $action);
        $this->setAttribute('onsubmit', $onsubmit);



        $this->add(array(
            'name' => 'pk_usuario_id',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control col-md-7 col-xs-12',
                'readonly' => true,
                'id' => 'pk_usuario_id',
            )
        ));

        $this->add(array(
            'name' => 'NOM_USU',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control has-feedback-left',
                'maxlength' => 50,
                'style' => 'text-transform: uppercase',
                'required' => $required,
                'readonly' => !$required,
                'id' => 'NOM_USU',
            )
        ));
        $this->add(array(
            'name' => 'APELL_USU',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control has-feedback-left',
                'maxlength' => 50,
                'style' => 'text-transform: uppercase',
                'required' => $required,
                'readonly' => !$required,
                'id' => 'APELL_USU',
            )
        ));
        $this->add(array(
            'name' => 'IDENTIFICACION',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control col-md-7 col-xs-12',
                'placeholder' => 'Solo Numeros',
                'pattern' => '[0-9]{1,20}',
                'maxlength' => 20,
                'required' => $required,
                'readonly' => !$required,
                'id' => 'IDENTIFICACION',
            )
        ));
        $this->add(array(
            'name' => 'FECHA_NAC_USU',
            'attributes' => array(
                'type' => 'date',
                'class' => 'form-control has-feedback-left',
                'required' => $required,
                'readonly' => !$required,
                'id' => 'FECHA_NAC_USU',
            )
        ));
        $this->add(array(
            'name' => 'ocupacion',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control has-feedback-left',
                'maxlength' => 50,
                'style' => 'text-transform: uppercase',
                'required' => $required,
                'readonly' => !$required,
                'id' => 'ocupacion',
            )
        ));
        $this->add(array(
            'name' => 'CORREO_USU',
            'attributes' => array(
                'type' => 'email',
                'class' => 'form-control has-feedback-left',
                'maxlenght' => 80,
                'style' => 'text-transform: lowercase',
                'required' => $required,
                'readonly' => !$required,
                'id' => 'CORREO_USU',
            )
        ));

        $this->add(array(
            'name' => 'TEL_USU',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control has-feedback-left',
                'maxlenght' => 50,
                'required' => $required,
                'readonly' => !$required,
                'id' => 'TEL_USU',
            )
        ));
        $this->add(array(
            'name' => 'DIR_USU',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control col-md-7 col-xs-12',
                'maxlenght' => 50,
                'required' => $required,
                'readonly' => !$required,
                'id' => 'DIR_USU',
            )
        ));
        $this->add(array(
            'name' => 'LOGIN',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control col-md-7 col-xs-12',
                'maxlength' => 500,
                'required' => $required,
                'readonly' => !$required,
                'id' => 'LOGIN',
            )
        ));
        $this->add(array(
            'name' => 'PASSWORD',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control col-md-7 col-xs-12',
                'maxlength' => 500,
                'required' => $required,
                'readonly' => !$required,
                'id' => 'PASSWORD',
            )
        ));
        $this->add(array(
            'name' => 'PASSWORDSEGURO',
            'attributes' => array(
                'type' => 'text',
                'class' => 'form-control col-md-7 col-xs-12',
                'maxlength' => 500,
                'onchange' => 'confirmarPassword()',
                'required' => $required,
                'readonly' => !$required,
                'id' => 'PASSWORDSEGURO',
            )
        ));

        $this->add(array(
            'name' => 'ESTADO',
            'type' => 'Select',
            'options' => array(
                'empty_option' => 'Seleccione ...',
                'value_options' => array(
                    'Activo' => 'Activo',
                    'Eliminado' => 'Eliminado',
                ),
                'disable_inarray_validator' => true,
            ),
            'attributes' => array(
                'class' => 'form-control',
                'required' => $required,
                'id' => 'ESTADO',
            )
        ));
        $this->add(array(
            'name' => 'TIPO_USUARIO',
            'type' => 'Select',
            'options' => array(
                'empty_option' => 'Seleccione ...',
                'value_options' => array(
                    'Administrador' => 'Administrador',
                    'Cliente' => 'Cliente',
                ),
                'disable_inarray_validator' => true,
            ),
            'attributes' => array(
                'class' => 'form-control',
                'required' => $required,
                'id' => 'TIPO_USUARIO',
            )
        ));
        $this->add(array(
            'name' => 'SEXO',
            'type' => 'Select',
            'options' => array(
                'empty_option' => 'Seleccione ...',
                'value_options' => array(
                    'Femenino' => 'Femenino',
                    'Masculino' => 'Masculino',
                ),
                'disable_inarray_validator' => true,
            ),
            'attributes' => array(
                'class' => 'form-control',
                'required' => $required,
                'id' => 'SEXO',
            )
        ));
        $this->add(array(
            'name' => 'condicionFisica',
            'type' => 'Select',
            'options' => array(
                'empty_option' => 'Seleccione ...',
                'value_options' => array(
                    'Normal' => 'Normal',
                    'Deportista' => 'Deportista',
                    'Sedentaria' => 'Sedentaria',
                ),
                'disable_inarray_validator' => true,
            ),
            'attributes' => array(
                'class' => 'form-control',
                'required' => $required,
                'id' => 'condicionFisica',
            )
        ));
        $this->add(array(
            'name' => 'OBJETIVOS',
            'type' => 'Select',
            'options' => array(
                'empty_option' => 'Seleccione ...',
                'value_options' => array(
                    'Bajar de peso' => 'Bajar de peso',
                    'Ganar masa muscular' => 'Ganar masa muscular',
                    'Tonificar el musculo' => 'Tonificar el musculo',
                    'Mejorar la condición fisica' => 'Mejorar la condición fisica',
                    'Terapia' => 'Terapia',
                ),
                'disable_inarray_validator' => true,
            ),
            'attributes' => array(
                'class' => 'form-control',
                'required' => $required,
                'id' => 'OBJETIVOS',
            )
        ));
        $this->add(array(
            'name' => 'rutaFotoPerfil',
            'attributes' => array(
                'type' => 'file',
                'class' => 'form-control col-md-7 col-xs-12',
                'required' => !$required,
                'readonly' => !$required,
                'id' => 'rutaFotoPerfil',
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
