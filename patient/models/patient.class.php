<?php
    /**
     * Created by PhpStorm.
     * User: Rodrigue Diakiese
     * Date: 21/08/2017
     * Time: 01:10
     */
    include_once 'database.php';

	class Patient{
     
        // database connection and table name
        private $conn;
        private $table_name = "tb_patient";

        // object properties
        public $firstname;
        public $lastname;
        public $age;

        // constructor with $db as database connection
        public function __construct($db){
            $this->conn = $db;
        }
        // create user
        public function createNewPatient(){
            // query to insert record


            $query = "INSERT INTO " . $this->table_name . " VALUES(NULL,?,?,?)";

            // posted values
            $this->firstname=addslashes(strip_tags($this->firstname));
            $this->lastname=htmlspecialchars(strip_tags($this->lastname));
            $this->age=htmlspecialchars(strip_tags($this->age));
           
            // prepare query
            $stmt = $this->conn->prepare($query);

            if($stmt->execute(array($this->firstname,$this->lastname,$this->age))){
                $json['success'] = 1;
                $json['message'] = 'insert successfull '.$stmt->queryString;
                echo json_encode($json);
            }else{
                $json['success'] = -4;
                $json['message'] = $stmt->errorInfo()[2];
                echo json_encode($json);
            }

        }
       
	}
    # instaciation de la class User en passant le parametre de la base de donneé
    $patient = new Patient($db);
?>