<?php
if (!defined('DB_SERVER')) {
    require_once("../initialize.php");
}
class DBConnection
{

    private $host = DB_SERVER;
    private $username = DB_USERNAME;
    private $password = DB_PASSWORD;
    private $database = DB_NAME;
    private $database_chatbot = DB_NAME_CHATBOT;

    public $conn;
    public $conn_chatbot;

    public function __construct()
    {

        if (!isset($this->conn)) {

            $this->conn = new mysqli($this->host, $this->username, $this->password, $this->database);

            if (!$this->conn) {
                echo 'Cannot connect to database server';
                exit;
            }
        }
        if (!isset($this->conn_chatbot)) {

            $this->conn_chatbot = new mysqli($this->host, $this->username, $this->password, $this->database_chatbot);

            if (!$this->conn_chatbot) {
                echo 'Cannot connect to database server';
                exit;
            }
        }
    }
    public function __destruct()
    {
        $this->conn->close();
        $this->conn_chatbot->close();
    }
}
