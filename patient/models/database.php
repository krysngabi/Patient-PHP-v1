<?php
ob_start();
session_start();
class Database{
     
    // specify your own database credentials
    private $host = "127.0.0.1";
    private $db_name = "patient";
    private $username ="root";
    private $password = "infoset2019";
    public $conn;
     
    // get the database connection
    public function getConnection(){
     
        $this->conn = null;
         
        try{
            $this->conn = new PDO("mysql:host=" . $this->host . ";port=3306;dbname=" . $this->db_name.";charset=utf8", $this->username, $this->password);
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }
         
        return $this->conn;
    }
}
$database = new Database();
$db = $database->getConnection();
?>