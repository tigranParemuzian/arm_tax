<?php

/**
 * Created by PhpStorm.
 * User: tigran
 * Date: 12/6/16
 * Time: 12:24 AM
 */
class DatabaseBase
{

    protected $dbName = 'armen_tax';
    protected $dbUser = 'root';
    protected $dbPass = 'root';
    protected $dbHost = 'localhost';

    // Open a connect to the database.
    // Make sure this is called on every page that needs to use the database.

    public function connect() {

        try {
            $dbh = new PDO("mysql:host={$this->dbHost};dbname={$this->dbName}", $this->dbUser, $this->dbPass);

        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }


        return $dbh;

    }

}