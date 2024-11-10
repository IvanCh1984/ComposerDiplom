<?php

namespace Controllers;

use Delight\Auth\InvalidEmailException;
use Delight\Auth\InvalidPasswordException;
use Delight\Auth\InvalidSelectorTokenPairException;
use Delight\Auth\TokenExpiredException;
use Delight\Auth\TooManyRequestsException;
use Delight\Auth\UserAlreadyExistsException;
use SimpleMail;
use Delight\Auth\Auth;
use League\Plates\Engine;
use Tamtamchik\SimpleFlash\Flash;

class RegistrationUserController
{
    private $templates;

    private $auth;

    public function __construct(Engine $engine, Auth $auth)
    {
        $this->templates = $engine;

        $this->auth = $auth;
    }

    public function index()
    {
        echo $this->templates->render('index_view');
    }

    public function login()
    {
        echo $this->templates->render('login');
    }

    public function registerUser()
    {
        try {
            $this->auth->register($_POST['email_user'], $_POST['pass_user'], $_POST['name_user'], function ($selector, $token) {
                //$verification = "<a href='".$_SERVER['HTTP_REFERER'] . '/verification/' . \urlencode($selector) . '/' . \urlencode($token)."'>Verificate your account</a>";
                $verification = "<a href='" . $_SERVER['HTTP_REFERER'] . 'verification/' . \urlencode($selector) . '/' . \urlencode($token) . "'>Verificate your account</a>";
                SimpleMail::make()
                    ->setTo($_POST['name_user'], $_POST['email_user'])
                    ->setFrom('info@example.com', 'Admin')
                    ->setSubject('Вы успешно зарегистрировались!')
                    ->setMessage('Вы зарегистрировались на сайте, для подтверждения почты перейдите по ' . $verification)
                    ->setHtml()
                    ->send();

            });


            Flash::message('Вы успешно зарегистрировались!', 'success');
            echo $this->templates->render('login');
        } catch (InvalidEmailException $e) {
            Flash::message('Неверный адрес электронной почты!', 'error');
            echo $this->templates->render('index_view');
        } catch (InvalidPasswordException $e) {
            Flash::message('Неверный пароль!', 'error');
            echo $this->templates->render('index_view');
        } catch (UserAlreadyExistsException $e) {
            Flash::message('Такой пользователь уже существует!', 'error');
            echo $this->templates->render('index_view');
        } catch (TooManyRequestsException $e) {
            Flash::message('Слишком много запросов!', 'error');
            echo $this->templates->render('index_view');
        }
    }

    public function verificationUser($data)
    {
        try {
            // тут не будет гет-параметров, так как ты их передал массивом в index.php
            // и поэтому ты должен принять их в методе как параметр
            //$this->auth->confirmEmail($_GET['selector'], $_GET['token']);
            $this->auth->confirmEmail($data['selector'], $data['token']);

            Flash::message('Почта успешно подтверждена', 'success');
            //echo $this->templates->render('login'); // тут ты должен перенаправить пользователя на страницу входа
            header('Location: /login');
        } catch (InvalidSelectorTokenPairException $e) {
            // в блоках catch не обязательно вызывать die() так как тут ты ловишь ошибку и скорее всего программа
            // дальше уже не сможет выполняться, вместо этого неплохо было бы показать ошибку по которой случился косяк
            //die('Invalid token');
            print_r($e->getMessage());
        } catch (TokenExpiredException $e) {
            die('Token expired');
        } catch (UserAlreadyExistsException $e) {
            die('Email address already exists');
        } catch (TooManyRequestsException $e) {
            die('Too many requests');
        }
    }

    public function loginUser()
    {
        try {
            $this->auth->login($_POST['email_user'], $_POST['pass_user']);
            Flash::message('Главная страница', 'success');
            echo $this->templates->render('users');

        } catch (InvalidEmailException $e) {
            Flash::message('Неправильный адрес электронной почты!', 'error');
            echo $this->templates->render('login');
        } catch (InvalidPasswordException $e) {
            Flash::message('Неправильный пароль!', 'error');
            echo $this->templates->render('login');
        } catch (\Delight\Auth\EmailNotVerifiedException $e) {
            Flash::message('Электронная почта не подтверждена!', 'error');
            echo $this->templates->render('login');
        } catch (TooManyRequestsException $e) {
            Flash::message('Слишком много запросов!', 'error');
            echo $this->templates->render('login');
        }

    }

    public function logOut()
    {
        $this->auth->logOut();
        echo $this->templates->render('index_view');
    }

}
