<?php

namespace Controllers;

use League\Plates\Engine;

use Delight\Auth\Auth;

use Model\QueryBuilder;

use Tamtamchik\SimpleFlash\Flash;

class HomeController {

   private $templates;

   private $auth;

   private $queryBuilder;

    public function __construct(Engine $engine, Auth $auth, QueryBuilder $queryBuilder)
    {
        $this -> templates = $engine;

        $this -> auth = $auth;

        $this-> queryBuilder = $queryBuilder;

    }

    public function index() {

        if ($this -> auth -> isLoggedIn ()) {

            $users = $this -> queryBuilder -> getAll('users');

            $id = $this -> auth-> getUserId();

            $role = $this->auth->getRoles();

            echo $this -> templates -> render('users', ['users' => $users, 'role' => $role, 'id' => $id]);

        }if (!$this -> auth -> isLoggedIn ()) {

            Flash::message('Вы не прошли аутентификацию!', 'error');

            header('Location: login');
        }  

    }

}
?>