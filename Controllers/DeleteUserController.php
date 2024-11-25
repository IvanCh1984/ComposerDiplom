<?php

namespace Controllers;

use Model\QueryBuilder;
use Delight\Auth\Auth;
use Tamtamchik\SimpleFlash\Flash;

class DeleteUserController {

    private $queryBuilder;

    private $auth;

    public function __construct(QueryBuilder $queryBuilder, Auth $auth)
    {
        $this-> queryBuilder = $queryBuilder;

        $this -> auth = $auth;

    }

    public function deleteUser() {

        if ($this -> auth -> isLoggedIn ()) {

            if ($this -> auth->hasAnyRole(\Delight\Auth\Role::ADMIN, \Delight\Auth\Role::AUTHOR)) {
                
                $id = $_GET['id'];

                $this -> queryBuilder -> delete('users',$id);

                Flash::message('Профиль удален!', 'success');
    
                header('Location: /');
    
            } 

        }elseif(!$this -> auth -> isLoggedIn ()) {

            Flash::message('Можно редактировать только свой профиль!', 'error');
        
            header('Location: /');
        }

    }

}



?>