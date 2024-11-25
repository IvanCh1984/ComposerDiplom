<?php

namespace Controllers;

use Model\QueryBuilder;
use Delight\Auth\Auth;
use League\Plates\Engine;
use Tamtamchik\SimpleFlash\Flash;


class CreateUserController {

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

            if ($this -> auth->hasAnyRole(\Delight\Auth\Role::ADMIN)) {

                $role = $this->auth->getRoles();
    
                echo $this -> templates -> render('createUser');

            } if($role['1'] !== 'ADMIN') {

                Flash::message('Доступ запрещён, Вы не ADMIN!', 'error');
            
                header('Location: /');
            
            }

        }elseif(!$this -> auth -> isLoggedIn ()) {

            Flash::message('Вы не прошли аутентификацию!', 'error');

            header('Location: login');
        }

    }

    public function insertUser() { 

        try { 
            $this -> auth-> register($_POST['email'], $_POST['password'], $_POST['username']);
            
            Flash::message('Вы успешно добавили пользователя!', 'success');
            header('Location: /');
            
        }

        catch (\Delight\Auth\InvalidEmailException $e) {
            Flash::message('Неверный адрес электронной почты!', 'error');
            echo $this->templates->render('createUser');
        }
        catch (\Delight\Auth\InvalidPasswordException $e) {
            Flash::message('Неверный пароль!', 'error');
            echo $this->templates->render('createUser');
        }
        catch (\Delight\Auth\UserAlreadyExistsException $e) {
            Flash::message('Такой пользователь уже существует!', 'error');
            echo $this->templates->render('createUser');
        }
        catch (\Delight\Auth\TooManyRequestsException $e) {
            Flash::message('Слишком много запросов!', 'error');
            echo $this->templates->render('createUser');
        }
        

        /*$filename = $this -> queryBuilder -> uploadImage($_FILES['image']);

        $user = $this -> queryBuilder -> insertUser('users', $_POST['username'], $_POST['job'], 
        $_POST['phone'], $_POST['adress'], $_POST['email'], $_POST['password'], $_POST['status_info'], 
        $filename, $_POST['vk'], $_POST['telegram'], $_POST['instagram']);*/

        

        
        
        

    }

}





?>