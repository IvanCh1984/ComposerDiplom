<?php

namespace Model;

use PDO;
use Aura\SqlQuery\QueryFactory;
use Database\Connection;

class QueryBuilder{

    private $pdo;

    private $queryFactory;

    public function __construct(QueryFactory $queryFactory) {
        $this->pdo = Connection::getInstance();
        $this -> queryFactory = $queryFactory;
    }

    public function getAll($table) {
        $select = $this -> queryFactory -> newSelect();
        $select -> cols(['*'])
                ->  from($table);
                   
        $sth = $this -> pdo -> prepare($select -> getStatement()); 

        $sth -> execute($select -> getBindValues());

        $result = $sth->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }

    public function insert($table, $data, $text) {
        $insert = $this -> queryFactory->newInsert();

        $insert ->into($table) 
                ->cols([$data => $text]);                  
        
        $sth = $this -> pdo ->prepare($insert->getStatement());

        $sth->execute($insert->getBindValues());
    }

    public function update($table, $id, $email, $password) {
        $update = $this -> queryFactory -> newUpdate();

        $update
               ->table($table)                  
               ->cols(['email'    => $email,
                       'password' => password_hash($password, algo:PASSWORD_DEFAULT)])
               ->where('id = :id')
               ->bindValue('id', $id);
               

        $sth = $this -> pdo -> prepare($update -> getStatement());

        $sth -> execute($update -> getBindValues());
    }

    public function uploadImage($image) {

        $extension = pathinfo($image['name'], PATHINFO_EXTENSION);
        $filename = uniqid() . "." . $extension;
      
        move_uploaded_file($image['tmp_name'], "upload/" . $filename);

        return $filename;
    }

    public function updateAvatar($table, $id, $filename) {
        $update = $this -> queryFactory -> newUpdate();

        $update
               ->table($table)                  
               ->cols(['avatar' => $filename])
               ->where('id = :id')
               ->bindValue('id', $id);
               

        $sth = $this -> pdo -> prepare($update -> getStatement());

        $sth -> execute($update -> getBindValues());
    }

    public function insertUser($table, $username, $job, $phone, $adress, $email, $password, $status_info, $filename, $vk, $telegram, $instagram) {
        $insert = $this -> queryFactory->newInsert();

           $insert ->into($table) 
                   ->cols(['username' => $username,
                                'job' => $job,
                              'phone' => $phone,
                             'adress' => $adress,
                              'email' => $email,
                           'password' => $password,
                        'status_info' => $status_info,
                             'avatar' => $filename,
                                 'vk' => $vk,
                           'telegram' => $telegram,
                          'instagram' => $instagram]);                  
        
        $sth = $this -> pdo ->prepare($insert->getStatement());

        $sth->execute($insert->getBindValues());
    }

    public function updateStatus($table, $id, $status) {
        $update = $this -> queryFactory -> newUpdate();

        $update
               ->table($table)                  
               ->cols(['status_info' => $status])
               ->where('id = :id')
               ->bindValue('id', $id);
               

        $sth = $this -> pdo -> prepare($update -> getStatement());

        $sth -> execute($update -> getBindValues());
    }

    public function updateInfo($table, $id, $username, $job, $phone, $adress) {
        $update = $this -> queryFactory -> newUpdate();
        $update
               ->table($table)                  
               ->cols(['username' => $username, 
                            'job' => $job, 
                          'phone' => $phone, 
                         'adress' => $adress])
               ->where('id = :id')
               ->bindValue('id', $id);
               
        $sth = $this -> pdo -> prepare($update -> getStatement());

        $sth -> execute($update -> getBindValues());
        
    }

    public function addSocialLinks($table, $id, $vk, $telegram, $instagram) {
        $update = $this -> queryFactory -> newUpdate();

        $update   ->table($table)                  
                  ->cols([   'vk' => $vk, 
                       'telegram' => $telegram, 
                      'instagram' => $instagram])
               ->where('id = :id')
               ->bindValue('id', $id);
               
        $sth = $this -> pdo -> prepare($update -> getStatement());

        $sth -> execute($update -> getBindValues());
        
    }

    public function delete($table, $id) {
        $delete = $this -> queryFactory-> newDelete();

        $delete
            ->from($table)                   
            ->where('id = :id')           
            ->bindValue('id', $id);

        $sth = $this -> pdo-> prepare($delete-> getStatement());

        $sth->execute($delete-> getBindValues());
    }

    public function getOne($table, $id) {
            $select = $this -> queryFactory -> newSelect();
            $select -> cols(['*'])
                    ->  from($table)
                    ->where('id = :id')           
                    ->bindValue('id', $id);
            
            $sth = $this -> pdo -> prepare($select -> getStatement()); 

            $sth -> execute($select -> getBindValues());
        
            $result = $sth->fetch(PDO::FETCH_ASSOC);
        
            return $result;
    }

    public function get_user_by_email($table, $email) {
        $select = $this -> queryFactory -> newSelect();
        $select -> cols(['*'])
                ->  from($table)
                ->where('email = :email')           
                ->bindValue('email', $email);
        
        $sth = $this -> pdo -> prepare($select -> getStatement()); 

        $sth -> execute($select -> getBindValues());
    
        $user = $sth->fetch(PDO::FETCH_ASSOC);
    
        return $user;
}

}

?>