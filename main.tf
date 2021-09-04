resource "google_sql_database_instance" "master" {
    name    = "sql-with-terraform"
    project =  "uob-bucket"
    region  =  "us-central1"
    database_version ="MYSQL_8_0"

    settings {
        tier = "db-f1-micro"
    }
}

resource "google_sql_database" "database" {
    name = "xyz"
    instance = "${google_sql_database_instance.master.name}"
}
resource "google_sql_user" "users"{
    name = "prasoon"
    instance = "${google_sql_database_instance.master.name}"
    host = "*"
    password = "Hello123"
}




