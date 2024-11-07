<?php

namespace Controllers;

use Model\QueryBuilder;
use League\Plates\Engine;

class ShowUserController {

    private $queryBuilder;

    private $templates;

    public function __construct(QueryBuilder $queryBuilder,Engine $templates)
    {
        $this-> queryBuilder = $queryBuilder;

        $this -> templates = $templates;

    }

    public function index() {

        $users = $this -> queryBuilder -> getAll('users');

        echo $this -> templates -> render('users');


    }

    /*public function users() {

        echo $this -> templates -> render('users');

       }*/
}





?>