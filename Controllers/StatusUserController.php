<?php 

namespace Controllers;

use Model\QueryBuilder;
use Delight\Auth\Auth;
use League\Plates\Engine;
use Tamtamchik\SimpleFlash\Flash;


class StatusUserController {

    private $queryBuilder;

    private $auth;

    private $templates;

    public function __construct(QueryBuilder $queryBuilder, Auth $auth, Engine $templates)
    {
        $this-> queryBuilder = $queryBuilder;

        $this -> auth = $auth;

        $this -> templates = $templates;

    }

    public function index() {

        if ($this -> auth -> isLoggedIn ()) {

            if ($this -> auth->hasAnyRole(\Delight\Auth\Role::ADMIN, \Delight\Auth\Role::AUTHOR)) {
                
                $id = $_GET['id'];

                $user = $this -> queryBuilder -> getOne('users', $id);
    
                echo $this -> templates -> render('status', ['user' => $user, 'id' => $id]);

            } 

        }elseif(!$this -> auth -> isLoggedIn ()) {

            Flash::message('Вы не прошли аутентификацию!', 'error');

            header('Location: login');
        }

    }

    public function editStatus() {

        $id = $_POST['id'];

        $user = $this -> queryBuilder -> updateStatus('users', $id, $_POST['status_info']);

        Flash::message('Статус обновлён!', 'success');
        
        header("Location: pageProfile?id=$id");


    }

}



?>