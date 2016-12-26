<?php

require_once ('DatabaseBase.php');
/**
 * Created by PhpStorm.
 * User: tigran
 * Date: 12/6/16
 * Time: 12:27 AM
 */
class ProductController
{

    /**
     * This function use to insert product
     *
     * @param array $data
     * @return array
     * @throws HttpException
     */
    public function putAction($data = array()){

        if($data['product_name'] == null || (float)$data['product_price'] <= -1){

            throw new HttpException('aaa', 400);
        }

        $productName = $data['product_name'];
        $productPrice = $data['product_price'];
        $productDescription = $data['product_description'];

        $connection = $this->dbConnection();
        $newProduct = $connection->prepare('INSERT INTO products (product_name, product_price, product_description) VALUES (:n, :p, :d)');
        $newProduct->bindParam(':n', $productName);
        $newProduct->bindParam(':p', $productPrice);
        $newProduct->bindParam(':d', $productDescription);
        $newProduct->execute();

        $data['product_id'] = (int)$connection->lastInsertId();
        try{
            $newProduct->execute();
            $connection->commit();

        }catch (Exception $e){
            //todo add inf in log
        };

        return $data;
    }

    /**
     * This function use to edit data of products
     *
     * @param array $data
     * @return array
     * @throws HttpException
     */
    public function postAction($data = array()){

        if($data['product_id'] == null || $data['product_name'] == null || (float)$data['product_price'] <= -1){

            throw new HttpException('aaa', 400);
        }

        $sql = 'UPDATE products SET product_name = :pr_name,
                                   product_price = :pr_price,
                                   product_description = :pr_description
                             WHERE id = :pr_id';

        $connection = $this->dbConnection();
        $updateProduct = $connection->prepare($sql);

        $updateProduct->bindParam(':pr_name', $data['product_name']);
        $updateProduct->bindParam(':pr_price', $data['product_price']);
        $updateProduct->bindParam(':pr_description', $data['product_description']);
        $updateProduct->bindParam(':pr_id', $data['product_id']);
        $message = '';

        try{
            $updateProduct->execute();
            $message = (string)$updateProduct->errorInfo();


        }catch (Exception $e){
            throw new HttpException($message?$message:$e, 400);
        };

        return $data;
    }

    public function deleteAction($data){

        if($data['product_id'] == null ){

            throw new HttpException('aaa', 400);
        }

        /**
         * get database connection
         */
        $connection = $this->dbConnection();
        $sql = 'DELETE FROM products WHERE id = :pr_id';
        $deleteProduct = $connection->prepare($sql);
        $deleteProduct->bindParam(':pr_id', $data['product_id']);
        $deleteProduct->execute();
        $message = '';

        try{
            $deleteProduct->execute();
            $deleteProduct->errorInfo();

        }catch (Exception $e){
            throw new HttpException($message?$message:$e, 400);
        };

        return $data;

    }

    /**
     * This function use to get all products
     *
     * @return array
     */
    public function getListAction(){

        /**
         * get database connection
         */
        $connection = $this->dbConnection();

        $result = array();
        /**
         * get info from database
         */
        foreach($connection->query('SELECT id, product_name, product_price, product_description from products ORDER BY id ASC ') as $row) {
            $result[] = array('product_id'=>(int)$row['id'], 'product_name'=>$row['product_name'], 'product_price'=>$row['product_price'], 'product_description'=>$row['product_description']);
        }

        return $result;
    }

    /**
     * This function use to create db connection
     *
     * @return PDO
     * @throws HttpException
     */
    protected function dbConnection(){

        $db = new DatabaseBase();

        $connection = $db->connect();
        if(!$connection){

            throw new HttpException('aaa', 500);
        }



        return $connection;

    }


}