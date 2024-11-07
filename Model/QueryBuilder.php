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
                /*->cols([$data])
                ->bindValue($data, $text);*/
        
        $sth = $this -> pdo ->prepare($insert->getStatement());

        $sth->execute($insert->getBindValues());
    }

    public function update($table, $id, $data, $text) {
        $update = $this -> queryFactory->newUpdate();

        $update
               ->table($table)                  
               ->cols([$data => $text])
               ->where('id = :id')
               ->bindValue('id', $id);

        $sth = $this -> pdo->prepare($update->getStatement());

        $sth->execute($update->getBindValues());
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

}

?>