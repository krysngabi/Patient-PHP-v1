 <?php
    error_reporting(0);
    include_once '../../models/database.php';
	class DisplayPatient{
     
        // database connection and table name
        private $conn;
        private $table_name = "tb_patient";
		
        // constructor with $db as database connection
        public function __construct($db){
            $this->conn = $db;
        }
		
		public function lists(){
            // select all qusery
            $query = "SELECT * FROM " . $this->table_name;
			
            // prepare query statement
            $stmt = $this->conn->prepare($query);

            $stmt->execute();

            $patients=array();

            while($row=$stmt->fetch(PDO::FETCH_ASSOC)){
                array_push($patients,
                array('id_patient'=>$row['id_patient'],'firstname'=>$row['firstname'],'lastname'=>$row['lastname'],
                    'age'=>$row['age']));
            }

            echo json_encode($patients);
        }
    
    }
	
    # instaciation de la class User en passant le parametre de la base de donneé
    $patients = new DisplayPatient($db);
	$patients->lists();
?>