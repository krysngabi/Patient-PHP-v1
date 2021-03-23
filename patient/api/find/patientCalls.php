<?php
ini_set("display_error", 1);
include_once '../../models/database.php';
include_once '../../models/patient.class.php';

$patient = new Patient($db);

if(@$_POST['insertPatient']){

	
	try{
        

        // set values
        $patient->firstname=$_POST['firstname'];
        $patient->lastname=$_POST['lastname'];
        $patient->age=$_POST['age'];

        //echo 'Valeur ' . $patient->age;

        
        
        $patient->createNewPatient();
	
	}catch(Exception $e) {
    echo 'Exception -> ';
    var_dump($e->getMessage());
    }   
    
} else{
		 $json['success'] = 0;
		 $json['message'] = 'pas d utilisateur';
         echo json_encode($json);
}

?>